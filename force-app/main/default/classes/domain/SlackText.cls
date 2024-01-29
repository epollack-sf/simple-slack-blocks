/**
 * Created by epollack@salesforce.com
 * 
 * A class representation of the Slack Text Composition Object based on the
 * specifications defined in the Slack Web API documentation. Used as a 
 * building block for Slack Blocks/Block Elements.
 * 
 * Schema Rules:
 * - type: plain_text or mrkdwn --> Not currently enforced
 * - text: 1 <= length <= 3000
 * - emoji: usable with plain_text
 * - verbatim: usable with mrkdwn
 * 
 * Reference: https://api.slack.com/reference/block-kit/composition-objects#text
 */


public class SlackText extends SlackBlockComposition {
    private String text;
    private Boolean emoji;
    private Boolean verbatim;
    
    public SlackText(String type, String text, Boolean emoji, Boolean verbatim) {
        super(type);
        setText(text);
        setEmoji(emoji);
        setVerbatim(verbatim);
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        Integer length = text.length();
        if (length < 1 || length > 3000) {
            throw new SchemaException('Text length must be between 1 and 3000 characters');
        }
        
        this.text = text;
    }

    public Boolean getEmoji() {
        return emoji;
    }

    public void setEmoji(Boolean emoji) {
        if (emoji != null && !type.equals('plain_text')) {
            throw new SchemaException('Emoji field is only usable when type is plain_text.');
        }

        this.emoji = emoji;
    }

    public Boolean getVerbatim() {
        return verbatim;
    }

    public void setVerbatim(Boolean verbatim) {
        if (verbatim != null && !type.equals('mrkdwn')) {
            System.debug(type);
            throw new SchemaException('Verbatim field is only usable when type is mrkdwn.');
        }

        this.verbatim = verbatim;
    }
}