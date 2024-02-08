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
    private static final String TYPE = 'section';
    
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
            Validation.isNull(this.text, new BuilderException('text can only be invoked once per build'));
            this.text = text;
            
            return this;
        }

        public SectionBlockBuilder field(SlackTextObject field) {
            // Replace conditional once upgrade to SOAP API v60.0 is complete
            // this.fields = this.fields ?? new List<SlackTextObject>();
            if (this.fields == null) {
                this.fields = new List<SlackTextObject>();
            }
            this.fields.add(field);
            
            return this;
        }

        public SectionBlockBuilder accessory(SlackBlockElement accessory) {
            Validation.isNull(this.accessory, new BuilderException('accessory can only be invoked once per build'));
            this.accessory = accessory;

            return this;
        }
        
        // Validate Schema
        // Text length <= 3000 enforced in SlackText.cls by default --> Problematic because now the Section Block has to know the internals of TextObject
        private void validate() {
            Validation.isLessThan(this.fields?.size(), 10, new SchemaException('Section Blocks can only have 10 fields'));
            Validation.areNotNull(new List<Object> {
                this.fields,
                this.text
            }, new SchemaException('Text is required if fields is null'));

            // Not good, not offloading validation off to another object, forcing more complex logic here
            // Mixing intrinsic with extrinsic validation
            for (SlackTextObject field : fields) {
                Validation.isLessThan(
                    field.getText().length(),
                    2000,
                    new SchemaException('Fields must be less than or equal to 2000 characters')
                );
            }
        }

        public SectionBlock build() {
            validate();
            return new SectionBlock(this);
        }
    }
}