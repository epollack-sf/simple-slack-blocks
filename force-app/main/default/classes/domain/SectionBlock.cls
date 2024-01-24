// Rename interface to SerializableSlackMessageComponent
public class SectionBlock extends SlackBlock {
    private SlackBlockElement accessory;
    
    public SectionBlock() {
        super('section', null);
    }

    public SlackBlockElement getAccessory() {
        return accessory;
    }

    public void setAccessory(SlackBlockElement accessory) {
        this.accessory = accessory;
    }

    public override void add(SlackBlockElement accessory) {
        // check if accessory is an instance of a supported type, else throw IllegalArgumentException
        
        
        
        super.add(accessory);
    }
    
    public String toJSON() {
        System.debug(JSON.serialize(this, true));
        
        return 'Hi';
    }
}