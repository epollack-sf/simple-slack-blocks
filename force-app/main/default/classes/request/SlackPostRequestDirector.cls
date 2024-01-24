public class SlackPostRequestDirector {
    private SlackPostRequestBuilder builder;
    
    public SlackPostRequestDirector() {
        builder = new SlackPostRequestBuilder();
    }

    public SlackPostRequest constructFunFact() {
        // need builders for blocks

        // Need add/remove on all SlackBlocks
        SlackBlock section1 = new SectionBlock();
        section1.add(new SlackField('plain_text', 'Hi, I am text field'));
        section1.add(new SlackField('mrkdwn', 'Hi, I am markdown text field'));

        SlackBlock divider = new DividerBlock();

        SlackBlock section2 = new SectionBlock();
        section2.add(new SlackField('plain_text', 'test'));
        
        return builder
            .toChannel('finsouTest')
            .withText('Hello, I am backup text')
            .withBlocks(new List<SlackBlock> {
                section1,
                divider,
                section2
            })
            .build();
    }


    
}