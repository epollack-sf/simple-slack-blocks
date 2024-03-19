/**
 * Created by epollack@salesforce.com
 * 
 * An immutable class representation of the Slack Text Composition Object based on the
 * specifications defined in the Slack Web API documentation. Used as a 
 * building block for Image Blocks/Elements.
 * 
 * Schema Rules:
 * - Only one attribute (url or id) can be populated, otherwise the payload gets rejected
 * - The user posting must have access to the spcified resource
 * - Only the following file types are supported: png, jpg, jpeg, and gif
 * 
 * Reference: https://api.slack.com/reference/block-kit/composition-objects#slack_file
 */

public class SlackFile implements SlackBlockComposition {
    private final String url;
    private final String id;

    private SlackFile(String url, String id) {
        this.url = url;
        this.id = id;
    }

    public static SlackFile fromUrl(String url) {
        return new SlackFile(url, null);
    }

    public static SlackFile fromId(String id) {
        return new SlackFile(null, id);
    }
}