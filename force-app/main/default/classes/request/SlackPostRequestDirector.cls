public class SlackPostRequestDirector {
    private SlackPostRequestBuilder builder;
    
    public SlackPostRequestDirector() {
        builder = new SlackPostRequestBuilder();
    }

    public SlackPostRequest constructFunFact() {
        SlackBlock divider = new DividerBlock();

        SlackButton button = new SlackButton();
        button.setText('click me');
        
        return builder
            .toChannel('finsouTest')
            .withText('Hello, I am backup text')
            .withBlocks(new List<SlackBlock> {
                SectionBlock.builder()
                    .text('Test')
                    .field('Field1')
                    .field('Field2')
                    .field('Field3')
                    .field('Field4')
                    .field('Field5')
                    .field('Field6')
                    .field('Field7')
                    .field('Field8')
                    .accessory(button)
                    .build(),
                divider,
                SectionBlock.builder()
                    .text('Test2')
                    .build()
            })
            .build();
    }
}