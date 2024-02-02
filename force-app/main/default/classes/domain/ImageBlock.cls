/**
 * Created by epollack@salesforce.com
 * 
 * Immutable class representing an Image Block, a top level layout 
 * component that can be added to a surface. This class must be created 
 * by it's corresponding builder class.
 * 
 * Builder Rules:
 * - All builder methods can only be invoked once per build
 * 
 * Schema Rules:
 * - alt_text: required, no markup allowed, length <= 2000
 * - image_url: required if slack_file is null, length <= 3000
 * - slack_file: required if image_url is null
 * - title: type must be plain_text, length <= 2000
 * 
 * Reference: https://api.slack.com/reference/block-kit/blocks#image
 */

public class ImageBlock extends SlackBlock {
    private final String altText;
    private final String imageUrl;
    private final SlackFile slackFile;
    private final SlackText title;
    
    private ImageBlock(ImageBlockBuilder builder) {
        super('image', null);
        this.altText = builder.altText;
        this.imageUrl = builder.imageUrl;
        this.slackFile = builder.slackFile;
        this.title = builder.title;
    }

    public String getAltText() {
        return altText;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public SlackFile getSlackFile() {
        return slackFile;
    }

    public SlackText getTitle() {
        return title;
    }

    public static ImageBlockBuilder builder() {
        return new ImageBlockBuilder();
    }

    public class ImageBlockBuilder {
        // no markup --> not enforced, need pattern matching (assuming markup == mrkdwn)
        private String altText;
        private String imageUrl;
        private SlackFile slackFile;
        private SlackText title;

        private ImageBlockBuilder() {}
    
        public ImageBlockBuilder altText(String altText) {
            Validation.isNull(this.altText, new BuilderException('altText can only be invoked once per build'));
            this.altText = altText;

            return this;
        }

        public ImageBlockBuilder imageUrl(String imageUrl) {
            Validation.isNull(this.imageUrl, new BuilderException('imageUrl can only be invoked once per build'));
            this.imageUrl = imageUrl;

            return this;
        }

        public ImageBlockBuilder slackFile(SlackFile file) {
            Validation.isNull(this.slackFile, new BuilderException('slackFile can only be invoked once per build'));
            this.slackFile = slackFile;

            return this;
        }

        public ImageBlockBuilder title(SlackText title) {
            Validation.isNull(this.imageUrl, new BuilderException('imageUrl can only be invoked once per build'));
            this.title = title;

            return this;
        }

        // Validate Schema
        // alt_text: no markup --> Not enforced, use regex
        private void validate() {
            Validation.isNotNull(this.altText, new SchemaException('Alt_text is a required field and must be specified'));
            Validation.isLessThan(this.altText, 2000, new SchemaException('Alt_text must be less than 2000 characters'));
            Validation.areNotNull(new List<Object>() {
                this.imageUrl,
                this.slackFile
            }, new SchemaException('Either image_url or slack_file must be populated'));
            
            // Validation class BREAKS DOWN HERE because imageUrl can be null, reason for null coalescing operator in Validation.cls
            Validation.isLessThan(this.imageUrl, 3000, new SchemaException('Image_url must be less than 3000 characters'));
            
            
            
            
            
            String message;

            // Title Type check offloaded to the actual type
            if (this.title != null && this.title.getType() != 'plain_text') {
                message = 'Title must be in plain_text format';
            // Offloaded to Text Object
            } else if (!(this.title.getText().length() <= 2000)) {
                message = 'Title must be less than 2000 characters';
            } else {
                return;
            }

            throw new SchemaException('Build Failed: ' + message);
        }

        public ImageBlock build() {
            validate();
            return new ImageBlock(this);
        }

    }
}