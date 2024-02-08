/**
 * Created by epollack@salesforce.com
 * 
 * A class representation of the Slack Text Composition Object based on the
 * specifications defined in the Slack Web API documentation. Used as a 
 * building block for Slack Blocks.
 * 
 * Schema Rules:
 * - type: 'button'
 * - text: length <= 75, can only be 'plain_text', required
 * - action_id: length <= 255
 * - url: length <= 3000
 * - value: length <= 2000
 * - style: null | 'primary' | 'danger'
 * - accessibility_label: length <= 75
 * 
 * Reference: https://api.slack.com/reference/block-kit/block-elements#button
 */


public class SlackButton extends SlackBlockElement {
    private static final String TYPE = 'button';
    
    private final SlackPlainTextObject text;
    private final String actionId;
    private final String url;
    private final String value;
    private final String style;
    private final SlackConfirm confirm;
    private final String accessibilityLabel;
    
    private SlackButton(SlackButtonBuilder builder) {
        super(TYPE);
        this.text = builder.text;
        this.actionId = builder.actionId;
        this.url = builder.url;
        this.value = builder.value;
        this.style = builder.style;
        this.confirm = builder.confirm;
        this.accessibilityLabel = builder.accessibilityLabel;
    }

    public SlackPlainTextObject getText() {
        return text;
    }

    public String getActionId() {
        return actionId;
    }

    public String getUrl() {
        return url;
    }

    public String getValue() {
        return value;
    }

    public String getStyle() {
        return style;
    }

    public SlackConfirm getConfirm() {
        return confirm;
    }

    public String getAccessibilityLabel() {
        return accessibilityLabel;
    }

    public static SlackButtonBuilder builder() {
        return new SlackButtonBuilder();
    }

    public class SlackButtonBuilder {
        private SlackPlainTextObject text;
        private String actionId;
        private String url;
        private String value;
        private String style;
        private SlackConfirm confirm;
        private String accessibilityLabel;

        private SlackButtonBuilder() {}

        public SlackButtonBuilder text(SlackPlainTextObject text) {
            Validation.isNull(this.text, new BuilderException('text can only be invoked once per build'));
            this.text = text;

            return this;
        }

        public SlackButtonBuilder actionId(String actionId) {
            Validation.isNull(this.actionId, new BuilderException('actionId can only be invoked once per build'));
            this.actionId = actionId;

            return this;
        }

        public SlackButtonBuilder url(String url) {
            Validation.isNull(this.url, new BuilderException('url can only be invoked once per build'));
            this.url = url;

            return this;
        }

        public SlackButtonBuilder value(String value) {
            Validation.isNull(this.value, new BuilderException('value can only be invoked once per build'));
            this.value = value;

            return this;
        }

        public SlackButtonBuilder confirm(SlackConfirm confirm) {
            Validation.isNull(this.confirm, new BuilderException('confirm can only be invoked once per build'));
            this.confirm = confirm;

            return this;
        }

        public SlackButtonBuilder accessibilityLabel(String accessibilityLabel) {
            Validation.isNull(this.accessibilityLabel, new BuilderException('accessibilityLabel can only be invoked once per build'));
            this.accessibilityLabel = accessibilityLabel;

            return this;
        }

        public SlackButtonBuilder primary() {
            Validation.isNull(this.style, new BuilderException('style can only be set once per build'));
            this.style = 'primary';

            return this;
        }

        public SlackButtonBuilder danger() {
            Validation.isNull(this.style, new BuilderException('style can only be set once per build'));
            this.style = 'danger';

            return this;
        }

        private void validate() {
            Validation.isNotNull(this.text, new SchemaException('Text is a required field and must be populated'));
            Validation.isLessThan(this.text.getText().length(), 75, new SchemaException('Text length must be less than 75 characters'));
            Validation.isLessThan(this.actionId?.length(), 255, new SchemaException('Action id must be less than 255 characters'));
            Validation.isLessThan(this.url?.length(), 3000, new SchemaException('Url must be less than 3000 characters'));
            Validation.isLessThan(this.value?.length(), 2000, new SchemaException('Value must be less than 2000 characters'));
            Validation.isLessThan(this.accessibilityLabel?.length(), 75, new SchemaException('Accessiblity label must be less than 75 characters'));
        }

        public SlackButton build() {
            validate();
            return new SlackButton(this);
        }
    }
}