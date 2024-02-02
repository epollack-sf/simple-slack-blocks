/**
 * Created by epollack@salesforce.com
 * 
 * Immutable class representing a Section Block, a top level layout 
 * component that can be added to a surface. This class must be created 
 * by it's corresponding builder class.
 * 
 * Builder Rules:
 * - text and accessory methods can only be invoked once per build
 * 
 * Schema Rules:
 * - text: required if there are no fields, otherwise preferred. 0 < length <= 3000
 * - fields: field count <= 10, text length <= 2000
 * - accessory: element must be compatible --> do I need to test for this?
 * 
 * Reference: https://api.slack.com/reference/block-kit/blocks#section
 */

public class SectionBlock extends SlackBlock {
    private final SlackText text;
    private final List<SlackText> fields;
    private final SlackBlockElement accessory;
    
    private SectionBlock(SectionBlockBuilder builder) {
        super('section', null);
        this.text = builder.text;
        this.fields = builder.fields;
        this.accessory = builder.accessory;
    }

    public SlackText getText() {
        return text;
    }

    public List<SlackText> getFields() {
        return fields;
    }

    public SlackBlockElement getAccessory() {
        return accessory;
    }

    public static SectionBlockBuilder builder() {
        return new SectionBlockBuilder();
    }
    
    public class SectionBlockBuilder {
        private SlackText text;
        private List<SlackText> fields;
        private SlackBlockElement accessory;

        private SectionBlockBuilder() {}

        public SectionBlockBuilder text(SlackText text) {
            Validation.isNull(this.text, new BuilderException('text can only be invoked once per build'));
            this.text = text;
            
            return this;
        }

        public SectionBlockBuilder field(SlackText field) {
            this.fields = this.fields ?? new List<SlackText>();
            this.fields.add(field);
            
            return this;
        }

        public SectionBlockBuilder accessory(SlackBlockElement accessory) {
            Validation.isNull(this.accessory, new BuilderException('accessory can only be invoked once per build'));
            this.accessory = accessory;

            return this;
        }
        
        // Validate Schema
        // Text length <= 3000 enforced in SlackText.cls by default
        private void validate() {
            Validation.isLessThan(this.fields?.size(), 10, new SchemaException('Section Blocks can only have 10 fields'));
            Validation.areNotNull(new List<Object> {
                this.fields,
                this.text
            }, new SchemaException('Text is required if fields is null'))
            String message;

            // Offloaded to Text Object
            Boolean invalidFields = false;
            for (SlackText field : fields) {
                if (!(field.getText().length() <= 2000)) {
                    invalidFields = true;
                    break;
                }
            }

            if (invalidFields) {
                message = 'Field text must be less than 2000 characters';
            } else {
                return;
            }

            throw new SchemaException('Build Failed: ' + message);
        }

        public SectionBlock build() {
            validate();
            return new SectionBlock(this);
        }
    }
}