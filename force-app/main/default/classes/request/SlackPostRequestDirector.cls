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
                    .title(new SlackPlainTextObject('Text'))
                    .altText('Intense Cow')
                    .imageUrl('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnm163IvLzBVh86TlKZil3q4O3rMxUBQvodw&usqp=CAU')
                    .build(),
                DividerBlock.builder().build(),
                ActionsBlock.builder()
                    .element(
                        SlackButton.builder()
                            .text(new SlackPlainTextObject('Yes'))
                            .primary()
                            .build()
                    )
                    .element(
                        SlackButton.builder()
                            .text(new SlackPlainTextObject('No'))
                            .danger()
                            .build()
                    )
                    .build()
            })
            .build();
    }
}