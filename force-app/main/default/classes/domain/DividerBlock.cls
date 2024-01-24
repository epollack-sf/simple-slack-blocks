public class DividerBlock extends SlackBlock {
    public DividerBlock() {
        super('divider', null);
    }

    public override void add(SlackBlockComposition component) {
        throw new UnsupportedMethodException('Dividers only have type and blockId');
    }

    public override void remove(SlackBlockComposition component) {
        throw new UnsupportedMethodException('Dividers only have type and blockId');
    }

    public String toJSON() {
        return JSON.serialize(this, null);
    }
}