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
 * - accessory: element must be compatible --> use Interface
 * 
 * Reference: https://api.slack.com/reference/block-kit/blocks#section
 */

public class SectionBlock extends SlackBlock {
    private static final String TYPE = 'section';
    private static final Integer MAX_FIELDS = 10;
    private static final Integer MAX_FIELD_LENGTH = 2000;
    
    
    private final SlackTextObject text;
    private final List<SlackTextObject> fields;
    private final SlackBlockElement accessory;
    
    private SectionBlock(SectionBlockBuilder builder) {
        super(TYPE, null);
        this.text = builder.text;
        this.fields = builder.fields;
        this.accessory = builder.accessory;
    }

    public SlackTextObject getText() {
        return text;
    }

    public List<SlackTextObject> getFields() {
        return fields;
    }

    public SlackBlockElement getAccessory() {
        return accessory;
    }

    public static SectionBlockBuilder builder() {
        return new SectionBlockBuilder();
    }
    
    public class SectionBlockBuilder {
        private SlackTextObject text;
        private List<SlackTextObject> fields;
        private SlackBlockElement accessory;

        private SectionBlockBuilder() {}

        public SectionBlockBuilder text(SlackTextObject text) {
            if (this.text != null) {
                throw new BuilderException('text can only be invoked once per build');
            }
            this.text = text;
            
            return this;
        }

        public SectionBlockBuilder field(SlackTextObject field) {
            this.fields = this.fields ?? new List<SlackTextObject>();
            this.fields.add(field);
            
            return this;
        }

        public SectionBlockBuilder accessory(SlackBlockElement accessory) {
            if (this.accessory != null) {
                throw new BuilderException('accessory can only be invoked once per build');
            }
            this.accessory = accessory;

            return this;
        }
        
        // Validate Schema
        // Text length <= 3000 enforced in SlackText.cls by default --> Problematic because now the Section Block has to know the internals of TextObject
        private void validate() {
            checkRequiredFields();
            checkFieldLengths();
        }

        private void checkRequiredFields() {
            if (this.fields == null && this.text == null) {
                throw new SchemaException('Text is required if fields is null');
            }
        }

        private void checkFieldLengths() {
            if (this.fields?.size() > MAX_FIELDS) {
                throw new SchemaException('Section Blocks can only have ' + MAX_FIELDS + ' fields');
            }

            // Not good, not offloading validation off to another object, forcing more complex logic here
            // Mixing intrinsic with extrinsic validation
            for (SlackTextObject field : this.fields) {
                if (field.getText().length() > MAX_FIELD_LENGTH) {
                    throw new SchemaException('Fields must be less than or equal to ' + MAX_FIELD_LENGTH + ' characters');
                }
            }
        }

        public SectionBlock build() {
            validate();
            return new SectionBlock(this);
        }
    }
}