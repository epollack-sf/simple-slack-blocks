public with sharing class SlackPostRequest {
    private String channel;
    private String text;
    private List<SlackBlock> blocks;
    // Only needed if we want to disable mrkdwn formatting for all text
    // private Boolean mrkdwn;

    public String getChannel() {
        return channel;
    }
    
    public void setChannel(String channel) {
        this.channel = channel;
    }

    public String getText() {
        return text;
    }
    
    public void setText(String text) {
        this.text = text;
    }

    public List<SlackBlock> getBlocks() {
        return blocks;
    }

    public void setBlocks(List<SlackBlock> blocks) {
        this.blocks = blocks;
    }

    public override String toString() {
        return 'channel: ' + channel + '\n'
            + 'text: ' + text;
    }

    // public Boolean getMrkdwn() {
    //     return mrkdwn;
    // }

    // public void setMrkdwn(Boolean mrkdwn) {
    //     this.mrkdwn = mrkdwn;
    // }
}