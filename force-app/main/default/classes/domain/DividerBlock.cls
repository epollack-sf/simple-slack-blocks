public class DividerBlock extends SlackBlock {
    private DividerBlock() {
        super('divider', null);
    }

    public String toJSON() {
        return JSON.serialize(this, null);
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