/**
 * Created by epollack@salesforce.com
 * 
 * Immutable class representing a Divider Block, a top level layout 
 * component that can be added to a surface. This class must be created 
 * by it's corresponding builder class.
 * 
 * Note: Divider blocks are simple extensions of the base SlackBlock,
 * as they only have a type and a blockId. Builder use is for creational 
 * consisitency with other blocks.
 */

public class DividerBlock extends SlackBlock {
    private DividerBlock() {
        super('divider', null);
    }

    public static DividerBlockBuilder builder() {
        return new DividerBlockBuilder();
    }

    public class DividerBlockBuilder {
        private DividerBlockBuilder() {}

        public DividerBlock build() {
            return new DividerBlock();
        }
    }
}