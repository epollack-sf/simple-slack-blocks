public class SlackMessage {
    private String text;
    private String username;
    private String bot_id;
    // private List<SlackAttachment> attachments;
    private String type;
    private String subtype;
    // Long, 5 decimal places, but comes as string?
    private String ts;
    
    // Only created through deserialization 
    private SlackMessage() {}

    public String getText() {
        return text;
    }

    public String getUsername() {
        return username;
    }

    public String getBotId() {
        return bot_id;
    }

    // public List<SlackAttachment> getAttachments() {
    //     return attachments;
    // }

    public String getType() {
        return type;
    }

    public String getSubtype() {
        return subtype;
    }
    
    public String getTs() {
        return ts;
    }  
}