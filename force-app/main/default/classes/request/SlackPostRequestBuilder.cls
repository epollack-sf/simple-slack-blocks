public class SlackPostRequestBuilder implements Builder {
    private SlackPostRequest request;
    
    public SlackPostRequestBuilder() {
        reset();
    }

    public SlackPostRequestBuilder toChannel(String channel) {
        request.setChannel(channel);
        return this;
    }

    public SlackPostRequestBuilder withText(String text) {
        request.setText(text);
        return this;
    }

    public SlackPostRequestBuilder withBlocks(List<SlackBlock> blocks) {
        request.setBlocks(blocks);
        return this;
    }

    public SlackPostRequest build() {
        SlackPostRequest result = request;
        reset();
        return result;
    }

    public void reset() {
        this.request = new SlackPostRequest();
    }
}