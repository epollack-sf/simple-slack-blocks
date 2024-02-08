public class SlackMrkdwnTextObject extends SlackTextObject {
    private static final String TYPE = 'mrkdwn';
    
    private final Boolean verbatim;

    public SlackMrkdwnTextObject(String text) {
        super(TYPE, text);
    }

    public SlackMrkdwnTextObject(String text, Boolean verbatim) {
        super(TYPE, text);
        this.verbatim = verbatim;
    }

    public Boolean getVerbatim() {
        return verbatim;
    }
}