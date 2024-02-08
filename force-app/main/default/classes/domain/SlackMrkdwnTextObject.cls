public class SlackMrkdwnTextObject extends SlackTextObject {
    private static final String TYPE = 'mrkdwn';
    
    private final Boolean verbatim;

    public SlackMrkdwnTextObject(String text) {
        super(TYPE, text);
    }

    public SlackMrkdwnTextObject(String text, Boolean verbatim) {
        super(TYPE, text);
        setVerbatim(verbatim);
    }

    public Boolean getVerbatim() {
        return verbatim;
    }

    private void setVerbatim(Boolean verbatim) {
        this.verbatim = verbatim;
    }
}