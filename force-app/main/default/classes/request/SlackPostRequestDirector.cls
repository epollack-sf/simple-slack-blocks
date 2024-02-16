public class SlackPostRequestDirector {
    private SlackPostRequestBuilder builder;
    
    public SlackPostRequestDirector() {
        builder = new SlackPostRequestBuilder();
    }

    public SlackPostRequest constructFunFact() {
        return builder
            .channel('finsouTest')
            .text('Hello, I am backup text')
            .blocks(new List<SlackBlock> {
                HeaderBlock.builder()
                    .text(new SlackPlainTextObject('Header'))
                    .build(),
                DividerBlock.builder().build(),
                // add .fields additional to .field
                SectionBlock.builder()
                    .text(new SlackPlainTextObject('Test'))
                    .field(new SlackPlainTextObject('Field1', true))
                    .field(new SlackPlainTextObject('Field1', true))
                    .field(new SlackPlainTextObject('Field1', true))
                    .field(new SlackMrkdwnTextObject('*Field1*:\n_test_', true))
                    .field(new SlackPlainTextObject('Field1', true))
                    .field(new SlackPlainTextObject('Field1', true))
                    .field(new SlackPlainTextObject('Field1', true))
                    .field(new SlackPlainTextObject('Field1', true))
                    .accessory(
                        SlackButton.builder()
                            .text(new SlackPlainTextObject('Click Me!'))
                            .build()
                    )
                    .build(),
                DividerBlock.builder().build(),
                ImageBlock.builder()
                    .title(new SlackPlainTextObject('Intense Cow'))
                    .altText('Alt text')
                    .imageUrl('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnm163IvLzBVh86TlKZil3q4O3rMxUBQvodw&usqp=CAU')
                    .build(),
                DividerBlock.builder().build(),
                ActionsBlock.builder()
                    .element(
                        SlackButton.builder()
                            .text(new SlackPlainTextObject('Yes'))
                            .style(SlackButtonStyle.PRIMARY)
                            .build()
                    )
                    .element(
                        SlackButton.builder()
                            .text(new SlackPlainTextObject('No'))
                            .style(SlackButtonStyle.DANGER)
                            .build()
                    )
                    .build()
            })
            .build();
    }
}