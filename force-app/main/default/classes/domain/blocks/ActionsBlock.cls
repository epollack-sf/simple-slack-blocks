/**
 * Created by epollack@salesforce.com
 * 
 * Immutable class representing an Actions Block, a top level layout 
 * component that can be added to a surface. This class must be created 
 * by it's corresponding builder class.
 * 
 * Schema Rules:
 * - elements: required with a length <= 25
 * 
 * Reference: https://api.slack.com/reference/block-kit/blocks#actions
 */

public class ActionsBlock extends SlackBlock {
    private static final String TYPE = 'actions';
    private static final Integer MAX_ELEMENTS = 25;
    
    // see compatible elements --> Not enforced
    // enforce with ActionsBlockElement interface
    private final List<SlackBlockElement> elements;
    
    private ActionsBlock(ActionsBlockBuilder builder) {
        super(TYPE, null);
        this.elements = builder.elements;
    }

    public List<SlackBlockElement> getElements() {
        return elements;
    }

    public static ActionsBlockBuilder builder() {
        return new ActionsBlockBuilder();
    }

    public class ActionsBlockBuilder {
        private List<SlackBlockElement> elements;

        private ActionsBlockBuilder() {}

        public ActionsBlockBuilder element(SlackBlockElement element) {
            this.elements = this.elements ?? new List<SlackBlockElement>();
            this.elements.add(element);

            return this;
        }

        // Validate Schema
        private void validate() {
            // Alternative: Add required fields to builder constructor instead of checking after builder use
            // Pros: shifts required field exceptions from runtime to compile time
            // Cons: Some blocks, like ActionsBlock, have lists for required fields, defeating purpose of builder
            checkRequiredFields();
            checkFieldLengths();
        }

        private void checkRequiredFields() {
            if (this.elements == null) {
                throw new SchemaException('elements is a required field and must be specified');
            }
        }

        private void checkFieldLengths() {
            if (this.elements.size() > MAX_ELEMENTS) {
                throw new SchemaException('Actions Blocks can only have ' + MAX_ELEMENTS + ' elements');
            }
        }

        public ActionsBlock build() {
            validate();
            return new ActionsBlock(this);
        }
    }
}