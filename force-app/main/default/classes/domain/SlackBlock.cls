public abstract class SlackBlock implements SerializableSlackMessageComponent {
    protected String type;
    protected String blockId;
    protected List<SlackBlockComposition> children;

    protected SlackBlock(String type, String blockId) {
        this.type = type;
        this.blockId = blockId;
        this.children = new List<SlackBlockComposition>();
    }

    // Safe initialization - forces children to call parameterized constructor
    private SlackBlock() {
        this(null, null);
    }
    
    public String getType() {
        return type;
    }
    
    public String getBlockId() {
        return blockId;
    }
    
    public void setBlockId(String blockId) {
        this.blockId = blockId;
    }

    // Decorate base add with validation specific to each block type
    public virtual void add(SlackBlockComposition component) {
        children.add(component);
    }
    
    public virtual void remove(SlackBlockComposition component) {
        children.remove(children.indexOf(component));
    }
}