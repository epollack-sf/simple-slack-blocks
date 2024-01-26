public class DividerBlock extends SlackBlock {
    public DividerBlock() {
        super('divider', null);
    }

    public String toJSON() {
        return JSON.serialize(this, null);
    }
}