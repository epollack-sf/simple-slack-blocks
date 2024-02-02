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
    // see compatible elements --> Not enforced
    private final List<SlackBlockElement> elements;
    
    private ActionsBlock(ActionsBlockBuilder builder) {
        super('actions', null);
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
            Validation.isNotNull(this.elements, new SchemaException('elements is a required field and must be specified'));
            Validation.isLessThan(this.element.size(), 25, new SchemaException('Actions Blocks can only have 25 elements'));
        }

        public ActionsBlock build() {
            validate();
            return new ActionsBlock(this);
        }
    }
}