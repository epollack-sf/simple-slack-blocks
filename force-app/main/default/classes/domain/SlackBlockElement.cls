public abstract class SlackBlockElement {
    private String type;

    protected SlackBlockElement(String type) {
        setType(type);
    }
    
    // Safe initialization - forces children to call parameterized constructor
    private SlackBlockElement() {
        this(null);
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}