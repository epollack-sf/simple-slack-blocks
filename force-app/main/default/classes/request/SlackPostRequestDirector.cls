public class SlackPostRequestDirector {
    private SlackPostRequestBuilder builder;
    
    public SlackPostRequestDirector() {
        builder = new SlackPostRequestBuilder();
    }

    public SlackPostRequest constructFunFact() {
        
        // Accessory
        SlackButton button = new SlackButton();
        button.setText('click me');

        // Elements
        SlackButton helpfulNo = new SlackButton();
        helpfulNo.setText('No');
        helpfulNo.setStyle('danger');

        SlackButton helpfulYes = new SlackButton();
        helpfulYes.setText('Yes');
        helpfulYes.setStyle('primary');
        
        return builder
            .channel('finsouTest')
            .text('Hello, I am backup text')
            .blocks(new List<SlackBlock> {
                HeaderBlock.builder()
                    .text(new SlackText('plain_text', 'This is a header', null, null))
                    .build(),
                DividerBlock.builder().build(),
                SectionBlock.builder()
                    .text(new SlackText('mrkdwn', '~Test~', null, true))
                    .field(new SlackText('plain_text', 'Field1', null, null))
                    .field(new SlackText('plain_text', 'Field1', null, null))
                    .field(new SlackText('plain_text', 'Field1', null, null))
                    .field(new SlackText('mrkdwn', '*Field1*:\n_test_', null, null))
                    .field(new SlackText('plain_text', 'Field1', null, null))
                    .field(new SlackText('plain_text', 'Field1', null, null))
                    .field(new SlackText('plain_text', 'Field1', null, null))
                    .field(new SlackText('plain_text', 'Field1', null, null))
                    .accessory(button)
                    .build(),
                DividerBlock.builder().build(),
                ImageBlock.builder()
                    .title(new SlackText('plain_text', 'Image Title', true, null))
                    .altText('Test Image')
                    .imageUrl('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnm163IvLzBVh86TlKZil3q4O3rMxUBQvodw&usqp=CAU')
                    .build(),
                DividerBlock.builder().build(),
                ActionsBlock.builder()
                    .element(helpfulNo)
                    .element(helpfulYes)
                    .build()
            })
            .build();
    }
}