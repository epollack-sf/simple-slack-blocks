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
 */

public class HeaderBlock extends SlackBlock {
    // required, plain_text only, length <= 150 --> Partially enforced
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
            if (this.text != null) {
                throw new BuilderException('text can only be invoked once per build');
            }
            this.text = text;

            return this;
        }

        // Validate Schema
        private void validate() {
            String message;
            
            if (this.text == null) {
                message = 'text is a required field and must be specified';
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