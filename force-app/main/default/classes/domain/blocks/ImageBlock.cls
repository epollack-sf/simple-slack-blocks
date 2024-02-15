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

    private static final Integer MAX_ALT_TEXT_LENGTH = 2000;
    private static final Integer MAX_TITLE_LENGTH = 2000;
    private static final Integer MAX_URL_LENGTH = 3000;
    
    private final String alt_text;
    private final String image_url;
    private final SlackFile slack_file;
    private final SlackPlainTextObject title;
    
    private ImageBlock(ImageBlockBuilder builder) {
        super(TYPE, null);
        this.alt_text = builder.alt_text;
        this.image_url = builder.image_url;
        this.slack_file = builder.slack_file;
        this.title = builder.title;
    }

    public String getAltText() {
        return alt_text;
    }

    public String getImageUrl() {
        return image_url;
    }

    public SlackFile getSlackFile() {
        return slack_file;
    }

    public SlackPlainTextObject getTitle() {
        return title;
    }

    public static ImageBlockBuilder builder() {
        return new ImageBlockBuilder();
    }

    public class ImageBlockBuilder {
        // no markup --> not enforced, need pattern matching (assuming markup == mrkdwn)
        private String alt_text;
        private String image_url;
        private SlackFile slack_file;
        private SlackPlainTextObject title;

        private ImageBlockBuilder() {}
    
        public ImageBlockBuilder altText(String alt_text) {
            if (this.alt_text != null) {
                throw new BuilderException('alt_text can only be invoked once per build');
            }
            this.alt_text = alt_text;

            return this;
        }

        public ImageBlockBuilder imageUrl(String image_url) {
            if (this.image_url != null) {
                throw new BuilderException('image_url can only be invoked once per build');
            }
            this.image_url = image_url;

            return this;
        }

        public ImageBlockBuilder slackFile(SlackFile slack_file) {
            if (this.slack_file != null) {
                throw new BuilderException('slack_file can only be invoked once per build');
            }
            this.slack_file = slack_file;

            return this;
        }

        public ImageBlockBuilder title(SlackPlainTextObject title) {
            if (this.title != null) {
                throw new BuilderException('title can only be invoked once per build');
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
            if (this.alt_text == null) {
                new SchemaException('Alt_text is a required field and must be specified');
            }

            if (this.alt_text == null && this.slack_file == null) {
                throw new SchemaException('Either image_url or slack_file must be populated');
            }
        }

        private void checkFieldLengths() {
            if (this.alt_text.length() > MAX_ALT_TEXT_LENGTH) {
                throw new SchemaException('Alt_text must be less than ' + MAX_ALT_TEXT_LENGTH + ' characters');
            }

            if (this.image_url.length() > MAX_URL_LENGTH) {
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