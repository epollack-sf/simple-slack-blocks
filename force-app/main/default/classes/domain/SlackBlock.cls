public abstract class SlackBlock {
    protected String type;
    protected String blockId;

    protected SlackBlock(String type, String blockId) {
        this.type = type;
        this.blockId = blockId;
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
}