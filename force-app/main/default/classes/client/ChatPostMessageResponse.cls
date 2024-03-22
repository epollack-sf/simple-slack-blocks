public class ChatPostMessageResponse implements SlackApiResponse {
    private Boolean ok;
    private String error;
    private String channel;
    // Long, 5 decimal places, but comes as string?
    // the same as SlackMessage.ts
    private String ts;
    private SlackMessage message;

    // Only created through deserialization
    private ChatPostMessageResponse() {}

    public Boolean getOk() {
        return ok;
    }

    public String getError() {
        return error;
    }

    public String getChannel() {
        return channel;
    }

    public String getTs() {
        return ts;
    }

    public SlackMessage getMessage() {
        return message;
    }
}