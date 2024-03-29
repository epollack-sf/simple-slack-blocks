/**
 * Created by epollack@salesforce.com
 * 
 * A class representation of the Slack Text Composition Object based on the
 * specifications defined in the Slack Web API documentation. Used as a 
 * building block for Slack Blocks.
 * 
 * Schema Rules:
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
    private static final Integer MAX_TEXT_LENGTH = 75;
    private static final Integer MAX_ACCESSIBILITY_LABEL_LENGTH = 75;
    private static final Integer MAX_ACTION_ID_LENGTH = 255;
    private static final Integer MAX_VALUE_LENGTH = 2000;
    private static final Integer MAX_URL_LENGTH = 3000;
    
    private final SlackPlainTextObject text;
    private final String action_id;
    private final String url;
    private final String value;
    private final String style;
    private final SlackConfirm confirm;
    private final String accessibility_label;
    
    private SlackButton(SlackButtonBuilder builder) {
        super(TYPE);
        this.text = builder.text;
        this.action_id = builder.actionId;
        this.url = builder.url;
        this.value = builder.value;
        this.style = builder.style;
        this.confirm = builder.confirm;
        this.accessibility_label = builder.accessibilityLabel;
    }

    public SlackPlainTextObject getText() {
        return text;
    }

    public String getActionId() {
        return action_id;
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
        return accessibility_label;
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
            if (this.text != null) {
                throw new BuilderException('text can only be invoked once per build');
            }
            this.text = text;

            return this;
        }

        public SlackButtonBuilder actionId(String actionId) {
            if (this.actionId != null) {
                throw new BuilderException('action_id can only be invoked once per build');
            }
            this.actionId = actionId;

            return this;
        }

        public SlackButtonBuilder url(String url) {
            if (this.url != null) {
                throw new BuilderException('url can only be invoked once per build');
            }
            this.url = url;

            return this;
        }

        public SlackButtonBuilder value(String value) {
            if (this.value != null) {
                throw new BuilderException('value can only be invoked once per build');
            }
            this.value = value;

            return this;
        }

        public SlackButtonBuilder confirm(SlackConfirm confirm) {
            if (this.confirm != null) {
                throw new BuilderException('confirm can only be invoked once per build');
            }
            this.confirm = confirm;

            return this;
        }

        public SlackButtonBuilder accessibilityLabel(String accessibilityLabel) {
            if (this.accessibilityLabel != null) {
                throw new BuilderException('accessibility_label can only be invoked once per build');
            }
            this.accessibilityLabel = accessibilityLabel;

            return this;
        }

        // change to single style() method that takes in enum
        public SlackButtonBuilder style(SlackButtonStyle style) {
            if (this.style != null) {
                throw new BuilderException('style can only be set once per build');
            }

            switch on style {
                when PRIMARY {
                    this.style = 'primary';
                }
                when DANGER {
                    this.style = 'danger';
                }
                when else {
                    // Default: style = null
                    // Should not run
                }
            }

            return this;
        }

        private void validate() {
            checkRequriedFields();
            checkFieldLengths();
        }

        private void checkRequriedFields() {
            if (this.text == null) {
                throw new SchemaException('Text is a required field and must be populated');
            }
        }

        private void checkFieldLengths() {
            if (this.text.getText().length() > MAX_TEXT_LENGTH) {
                throw new SchemaException('Text length must be less than ' + MAX_TEXT_LENGTH + ' characters');
            }

            if (this.actionId?.length() > MAX_ACTION_ID_LENGTH) {
                throw new SchemaException('Action id must be less than ' + MAX_ACTION_ID_LENGTH + ' characters');
            }

            if (this.url?.length() > MAX_URL_LENGTH) {
                throw new SchemaException('Url must be less than ' + MAX_URL_LENGTH + ' characters');
            }

            if (this.value?.length() > MAX_VALUE_LENGTH) {
                throw new SchemaException('Value must be less than ' + MAX_VALUE_LENGTH + ' characters');
            }

            if (this.accessibilityLabel?.length() > MAX_ACCESSIBILITY_LABEL_LENGTH) {
                throw new SchemaException('Accessiblity label must be less than ' + MAX_ACCESSIBILITY_LABEL_LENGTH + ' characters');
            }
        }

        public SlackButton build() {
            validate();
            return new SlackButton(this);
        }
    }
}