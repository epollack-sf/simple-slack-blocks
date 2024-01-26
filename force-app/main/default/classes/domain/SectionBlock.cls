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
    
    public String toJSON() {
        System.debug(JSON.serialize(this, true));
        
        return 'Hi';
    }

    public static SectionBlockBuilder builder() {
        return new SectionBlockBuilder();
    }
    // Static?
    public class SectionBlockBuilder {
        private SlackText text;
        private List<SlackText> fields;
        private SlackBlockElement accessory;

        private SectionBlockBuilder() {}
        
        /**
         * Questions:
         * 1. Should user only pass in text, limiting the configurability of the Text Object
         * 2. Should user create SlackText instance and pass it in?
         * 3. Should I create Config objects that can be passed in and mapped to Text Object on construction?
         */

        public SectionBlockBuilder text(String text) {
            if (this.text != null) {
                throw new BuilderException('text can only be invoked once per build');
            }
            this.text = new SlackText('plain_text', text, true, null);
            
            return this;
        }

        public SectionBlockBuilder field(String text) {
            if (this.fields == null) {
                this.fields = new List<SlackText>();
            }
            this.fields.add(new SlackText('plain_text', text, true, null));
            
            return this;
        }

        public SectionBlockBuilder accessory(SlackBlockElement accessory) {
            if (this.accessory != null) {
                throw new BuilderException('accessory can only be invoked once per build');
            }
            this.accessory = accessory;

            return this;
        }
        // Move outside of builder --> protected abstract method?
        // Validate Schema
        private void validate() {
            String message;
            
            if (this.fields == null && this.text == null) {
                message = 'Text cannot be null if fields is null and vice versa';
            } else if (this.fields?.size() > 10) {
                message = 'Section Blocks can only have 10 fields';
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