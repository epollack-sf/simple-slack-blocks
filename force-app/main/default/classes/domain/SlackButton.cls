/**
 * Created by epollack@salesforce.com
 * 
 * A class representation of the Slack Text Composition Object based on the
 * specifications defined in the Slack Web API documentation. Used as a 
 * building block for Slack Blocks.
 * 
 * Schema Rules:
 * - type: 'button'
 * - text: length <= 75, can only be 'plain_text'
 * - action_id: length <= 255
 * - url: length <= 3000
 * - value: length <= 2000
 * - style: null | 'primary' | 'danger'
 * - accessibility_label: length <= 75
 * 
 * Reference: https://api.slack.com/reference/block-kit/block-elements#button
 */


public class SlackButton extends SlackBlockElement {
    private SlackText text;
    private String actionId;
    private String url;
    private String value;
    private String style;
    private SlackConfirm confirm;
    private String accessibilityLabel;
    
    public SlackButton() {
        super('button');
    }

    public SlackText getText() {
        return text;
    }

    public void setText(String text) {
        if (!(text.length() <= 75)) {
            throw new IllegalArgumentException('Button text length must be less than or equal to 75 characters.');
        }

        // delegation to text constructor works here but what about more dynamic elements?
        this.text = new SlackText('plain_text', text, null, null);
    }

    public String getActionId() {
        return actionId;
    }

    public void setActionId(String actionId) {
        if (!(actionId.length() <= 255)) {
            throw new IllegalArgumentException('Button action_id length must be less than or equal to 255 characters.');
        }

        this.actionId = actionId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl() {
        if (!(url.length() <= 3000)) {
            throw new IllegalArgumentException('Button url length must be less than or equal to 3000 characters.');
        }

        this.url = url;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        if (!(value.length() <= 2000)) {
            throw new IllegalArgumentException('Button value length must be less than or equal to 2000 characters.');
        }

        this.value = value;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        if (!(style.equals('primary') || style.equals('danger'))) {
            throw new IllegalArgumentException('Button style must be set to \'primary\' or \'danger\'');
        }

        this.style = style;
    }

    public SlackConfirm getConfirm() {
        return confirm;
    }

    public void setConfirm(SlackConfirm confirm) {
        this.confirm = confirm;
    }

    public String getAccessibilityLabel() {
        return accessibilityLabel;
    }

    public void setAccessibilityLabel(String accessibilityLabel) {
        if (!(accessibilityLabel.length() <= 75)) {
            throw new IllegalArgumentException('Button accessibility_label length must be less than or equal to 75 characters.');
        }

        this.accessibilityLabel = accessibilityLabel;
    }

    public String toJSON() {
        return null;
    }
}