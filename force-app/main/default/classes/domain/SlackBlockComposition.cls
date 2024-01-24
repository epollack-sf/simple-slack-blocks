public abstract class SlackBlockComposition implements SerializableSlackMessageComponent {
    protected String type;

    protected SlackBlockComposition(String type) {
        this.type = type;
    }

    // Safe initialization - forces children to call parameterized constructor
    private SlackBlockComposition() {
        this(null);
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}