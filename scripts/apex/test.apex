// Create client
SlackApiClient client = new SlackApiClient();

// Get User Id
UsersLookupByEmailRequest idReq = UsersLookupByEmailRequest.builder()
    .email('epollack@salesforce.com')
    .build();
UsersLookupByEmailResponse idRes = client.usersLookupByEmail(idReq);

String slackUserId = idRes?.getUser()?.getId();

// Construct Blocks
List<SlackBlock> blocks = new List<SlackBlock> { 
    HeaderBlock.builder()
        .text(new SlackPlainTextObject('Hi'))
        .build(),
    DividerBlock.builder()
        .build(),
    SectionBlock.builder()
        .text(new SlackMrkdwnTextObject('This is from Apex ' + Md.emoji('celebrate')))
        .field(new SlackMrkdwnTextObject(Md.bold('Hello World') + '\n' + 
                Md.code('System.out.println("Hello World");') + '\n' + 
                Md.user(slackUserId)))
        .build()
};

// Construct message
ChatPostMessageRequest messageReq = ChatPostMessageRequest.builder()
    // FwF-Test channel id
    .channel('C06LD62CYBT')
    .text('test text')
    .blocks(blocks)
    .build();

ChatPostMessageResponse messageRes = client.chatPostMessage(messageReq);
System.debug(messageRes);