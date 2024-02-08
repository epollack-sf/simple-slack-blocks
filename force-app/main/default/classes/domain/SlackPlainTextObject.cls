public class SlackPlainTextObject extends SlackTextObject {
    private static final String TYPE = 'plain_text';

    private final Boolean emoji;

    public SlackPlainTextObject(String text) {
        super(TYPE, text);
    }

    public SlackPlainTextObject(String text, Boolean emoji) {
        super(TYPE, text);
        setEmoji(emoji);
    }

    public Boolean getEmoji() {
        return emoji;
    }

    private void setEmoji(Boolean emoji) {
        this.emoji = emoji;
    }
}