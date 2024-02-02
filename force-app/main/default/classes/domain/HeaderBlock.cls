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
    private final SlackText text;

    private HeaderBlock(HeaderBlockBuilder builder) {
        super('header', null);
        this.text = builder.text;
    }

    public SlackText getText() {
        return text;
    }

    public static HeaderBlockBuilder builder() {
        return new HeaderBlockBuilder();
    }

    public class HeaderBlockBuilder {
        private SlackText text;

        private HeaderBlockBuilder() {}

        public HeaderBlockBuilder text(SlackText text) {
            Validation.isNull(this.text, new BuilderException('text can only be invoked once per build'));
            this.text = text;

            return this;
        }

        // Validate Schema
        private void validate() {
            Validation.isNotNull(this.text, new SchemaException('Text is a required field and must be specified'));
            
            
            String message; 
            // Offloaded to Text Object
            if (!this.text.getType().equals('plain_text')) {
                message = 'Text must be in plain_text format';
            // Less than the 3000 character base limit on text blocks
            // Offloaded to Text Object
            } else if (!(this.text.getText().length() <= 150)) {
                message = 'Text length must be less than 150 characters';
            } else {
                return;
            }

            throw new SchemaException('Build Failed: ' + message);
        }

        public HeaderBlock build() {
            validate();
            return new HeaderBlock(this);
        }
    }
}