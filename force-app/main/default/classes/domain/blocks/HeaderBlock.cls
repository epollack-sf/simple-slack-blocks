/**
 * Created by epollack@salesforce.com
 * 
 * Immutable class representing a Header Block, a top level layout 
 * component that can be added to a surface. This class must be created 
 * by it's corresponding builder class.
 * 
 * Builder Rules:
 * - Each method can only be invoked once per build
 * 
 * Schema Rules:
 * - text: must be a plain_text text object with a length <= 150
 * 
 * Reference: https://api.slack.com/reference/block-kit/blocks#header
 */

public class HeaderBlock extends SlackBlock {
    private static final String TYPE = 'header';
    private static final Integer MAX_TEXT_LENGTH = 150;
    
    private final SlackPlainTextObject text;

    private HeaderBlock(HeaderBlockBuilder builder) {
        super(TYPE, null);
        this.text = builder.text;
    }

    public SlackPlainTextObject getText() {
        return text;
    }

    public static HeaderBlockBuilder builder() {
        return new HeaderBlockBuilder();
    }

    public class HeaderBlockBuilder {
        private SlackPlainTextObject text;

        private HeaderBlockBuilder() {}

        // Problematic because developer still needs to know about 150 Character Limit -> ?? Java SDK doesn't seem to care about this
        public HeaderBlockBuilder text(SlackPlainTextObject text) {
            if (this.text != null) {
                throw new BuilderException('text can only be invoked once per build');
            }
            this.text = text;

            return this;
        }

        // Validate Schema
        private void validate() {
            // Alternative: Add required fields to builder constructor instead of checking after builder use
            // Pros: shifts required fields to compile error
            // Cons: Some blocks, like ActionsBlock, have lists for required fields, defeating purpose of builder
            checkRequiredFields();
            
            // Mixing intrinsic with extrinsic validation
            checkFieldLengths();
        }

        private void checkRequiredFields() {
            if (this.text == null) {
                throw new SchemaException('Text is a required field and must be specified');
            }
        }

        private void checkFieldLengths() {
            if (this.text.getText().length() > MAX_TEXT_LENGTH) {
                throw new SchemaException('Text length must be less than ' + MAX_TEXT_LENGTH + ' characters');
            }
        }

        public HeaderBlock build() {
            validate();
            return new HeaderBlock(this);
        }
    }
}