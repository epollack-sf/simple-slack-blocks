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

        // Problematic because developer still needs to know about 150 Character Limit
        public HeaderBlockBuilder text(SlackPlainTextObject text) {
            Validation.isNull(this.text, new BuilderException('text can only be invoked once per build'));
            this.text = text;

            return this;
        }

        // Validate Schema
        private void validate() {
            Validation.isNotNull(this.text, new SchemaException('Text is a required field and must be specified'));
            
            // Not good, checking for text length here forces SectionBlock to iterate over all fields
            // Mixing intrinsic with extrinsic validation
            Validation.isLessThan(
                this.text.getText().length(), 
                150, 
                new SchemaException('Text length must be less than 150 characters')
            );
        }

        public HeaderBlock build() {
            validate();
            return new HeaderBlock(this);
        }
    }
}