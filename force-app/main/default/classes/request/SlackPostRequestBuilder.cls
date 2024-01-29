// implements Resetable
public class SlackPostRequestBuilder {
    private SlackPostRequest request;
    
    public SlackPostRequestBuilder() {
        reset();
    }

    public SlackPostRequestBuilder channel(String channel) {
        request.setChannel(channel);
        return this;
    }

    public SlackPostRequestBuilder text(String text) {
        request.setText(text);
        return this;
    }

    public SlackPostRequestBuilder blocks(List<SlackBlock> blocks) {
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