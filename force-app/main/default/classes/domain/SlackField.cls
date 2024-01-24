public class SlackField extends SlackBlockComposition {
    private String text;
    
    public SlackField(String type, String text) {
        super(type);
        this.text = text;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String toJSON() {
        return 'Hi';
    }
}