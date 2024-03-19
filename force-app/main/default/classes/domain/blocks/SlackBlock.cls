/**
 * Created by epollack@salesforce.com
 * 
 * Abstract base class for all Layout Blocks. 
 * Contains fields present in each type of Layout Block.
 * 
 * Implementation Note:
 * - The Slack API expects fields to be in snake_case instead of the standard Apex 
 *  naming convention, camelCase. All Layout Block fields that require snake_case 
 *  should be defined in snake_case in it's corresponding class representation (e.g. block_id). 
 *  While this violates Apex best practices, it allows for the serialization of the resulting
 *  structure with the OOTB JSON class. To follow Apex naming convention as closely as possible,
 *  builders will continue to use camelCase definitions and data will not be stored in snake_case variables
 *  until the resulting immutable object is instantiated.
 * 
 * Schema Rules:
 * - type: required
 * 
 * Reference: https://api.slack.com/reference/block-kit/blocks
 */

public abstract class SlackBlock {
    protected String type;
    protected String block_id;

    protected SlackBlock(String type, String blockId) {
        this.type = type;
        this.block_id = blockId;
    }

    // Safe initialization - forces children to call parameterized constructor
    private SlackBlock() {
        this(null, null);
    }
    
    public String getType() {
        return type;
    }
    
    public String getBlockId() {
        return block_id;
    }
}