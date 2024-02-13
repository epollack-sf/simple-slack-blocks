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
    private static final String TYPE = 'image';
    
    private final String altText;
    private final String imageUrl;
    private final SlackFile slackFile;
    private final SlackPlainTextObject title;
    
    private ImageBlock(ImageBlockBuilder builder) {
        super(TYPE, null);
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

    public SlackPlainTextObject getTitle() {
        return title;
    }

    public static ImageBlockBuilder builder() {
        return new ImageBlockBuilder();
    }

    public class ImageBlockBuilder {
        private static final Integer MAX_ALT_TEXT_LENGTH = 2000;
        private static final Integer MAX_TITLE_LENGTH = 2000;
        private static final Integer MAX_URL_LENGTH = 3000;
        
        // no markup --> not enforced, need pattern matching (assuming markup == mrkdwn)
        private String altText;
        private String imageUrl;
        private SlackFile slackFile;
        private SlackPlainTextObject title;

        private ImageBlockBuilder() {}
    
        public ImageBlockBuilder altText(String altText) {
            if (this.altText != null) {
                throw new BuilderException('altText can only be invoked once per build');
            }
            this.altText = altText;

            return this;
        }

        public ImageBlockBuilder imageUrl(String imageUrl) {
            if (this.imageUrl != null) {
                throw new BuilderException('imageUrl can only be invoked once per build');
            }
            this.imageUrl = imageUrl;

            return this;
        }

        public ImageBlockBuilder slackFile(SlackFile slackFile) {
            if (this.slackFile != null) {
                throw new BuilderException('slackFile can only be invoked once per build');
            }
            this.slackFile = slackFile;

            return this;
        }

        public ImageBlockBuilder title(SlackPlainTextObject title) {
            if (this.imageUrl != null) {
                throw new BuilderException('imageUrl can only be invoked once per build')
            }
            this.title = title;

            return this;
        }

        // Validate Schema
        // alt_text: no markup --> Not enforced, use regex
        private void validate() {
            checkRequiredFields();
            checkFieldLengths();
        }

        private void checkRequiredFields() {
            if (this.altText == null) {
                new SchemaException('Alt_text is a required field and must be specified');
            }

            if (this.altText == null && this.slackFile == null) {
                throw new SchemaException('Either image_url or slack_file must be populated');
            }
        }

        private void checkFieldLengths() {
            if (this.altText > MAX_ALT_TEXT_LENGTH) {
                throw new SchemaException('Alt_text must be less than ' + MAX_ALT_TEXT_LENGTH + ' characters');
            }

            if (this.imageUrl > MAX_URL_LENGTH) {
                throw new SchemaException('Image_url must be less than ' + MAX_URL_LENGTH + ' characters');
            }

            // Not good, checking for text length here forces SectionBlock to iterate over all fields
            // Mixing intrinsic with extrinsic validation
            if (this.title.getText().length() > MAX_TITLE_LENGTH) {
                throw new SchemaException('Title must be less than ' + MAX_TITLE_LENGTH + ' characters');
            }
        }

        public ImageBlock build() {
            validate();
            return new ImageBlock(this);
        }
    }
}