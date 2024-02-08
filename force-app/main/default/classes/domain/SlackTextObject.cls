public abstract class SlackTextObject implements SlackBlockComposition {   
    protected static final Integer MAX_LENGTH = 3000;
    protected static final Integer MIN_LENGTH = 1;
    
    protected final String type;
    protected final String text;

    protected SlackTextObject(String type, String text) {
        setType(type);
        setText(text);
    }

    // Safe initialization - forces children to call parameterized constructor
    private SlackTextObject() {
        this(null, null);
    }

    public String getType() {
        return type;
    }

    private void setType(String type) {
        this.type = type;
    }

    public String getText() {
        return text;
    }

    private void setText(String text) {
        Validation.isNotNull(text, new SchemaException('Text is a required field and must be populated'));
        Validation.isGreaterThan(
            text.length(), 
            MIN_LENGTH,
            new SchemaException('Text length must be at least ' + MIN_LENGTH + ' character(s)')
        );
        Validation.isLessThan(
            text.length(),
            MAX_LENGTH,
            new SchemaException('Text must be less than ' + MAX_LENGTH + ' characters')
        );
        this.text = text;
    }
}