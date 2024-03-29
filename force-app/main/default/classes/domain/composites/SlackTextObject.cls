public abstract class SlackTextObject implements SlackBlockComposition {   
    // Not static because all classes that inherit from SlackTextObject will be able to see the max and min constants
    protected transient final Integer MAX_LENGTH = 3000;
    protected transient final Integer MIN_LENGTH = 1;
    
    // Implicitly final to allow for validation in setters (setters cannot be called on explicitly final variables, even if invoked in constructor)
    protected String type;
    protected String text;

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
        // Can be abstracted to checkRequiredFields and checkFieldLengths
        if (text == null) {
            throw new SchemaException('Text is a required field and must be populated');
        }

        if (text.length() < MIN_LENGTH) {
            throw new SchemaException('Text length must be at least ' + MIN_LENGTH + ' character(s)');
        }
        
        if (text.length() > MAX_LENGTH) {
            throw new SchemaException('Text must be less than ' + MAX_LENGTH + ' characters');
        }
        
        this.text = text;
    }
}