public class ChatPostMessageRequest implements SlackApiRequest {
    private final String channel;
    private final String text;
    // Layout Blocks
    private final List<SlackBlock> blocks;
    // Going to be tricky with context aware validation because this turns off mrkdwn formatting for all text
    private final Boolean mrkdwn;

    private ChatPostMessageRequest(ChatPostMessageRequestBuilder builder) {
        channel = builder.channel;
        text = builder.text;
        blocks = builder.blocks;
        mrkdwn = builder.mrkdwn;
    }

    public String getChannel() {
        return channel;
    }

    public String getText() {
        return text;
    }

    public List<SlackBlock> getBlocks() {
        return blocks;
    }

    public Boolean getMrkdwn() {
        return mrkdwn;
    }

    public static ChatPostMessageRequestBuilder builder() {
        return new ChatPostMessageRequestBuilder();
    }

    public class ChatPostMessageRequestBuilder {
        private String channel;
        private String text;
        private List<SlackBlock> blocks;
        private Boolean mrkdwn;

        private ChatPostMessageRequestBuilder() {}

        public ChatPostMessageRequestBuilder channel(String channel) {
            this.channel = channel;

            return this;
        }

        public ChatPostMessageRequestBuilder text(String text) {
            this.text = text;

            return this;
        }

        public ChatPostMessageRequestBuilder blocks(List<SlackBlock> blocks) {
            this.blocks = blocks;

            return this;
        }

        public ChatPostMessageRequestBuilder mrkdwn(Boolean mrkdwn) {
            this.mrkdwn = mrkdwn;

            return this;
        }

        // Check specs
        private void validate() {

        }

        public ChatPostMessageRequest build() {
            validate();
            return new ChatPostMessageRequest(this);
        }
    }
}