public abstract class SlackBlock {
    protected String type;
    protected String block_id;

    protected SlackBlock(String type, String block_id) {
        this.type = type;
        this.block_id = block_id;
    }

    // Safe initialization - forces children to call parameterized constructor
    private SlackBlock() {
        this(null, null);
    }
    
    public String getType() {
        return type;
    }
    
    public String getBlockId() {
        return block_id;
    }
    
    public void setBlockId(String block_id) {
        this.block_id = block_id;
    }
}