// Inspired by MethodsClientImpl.java from Slack SDK for Java
// Responsible for setting up the request and parsing the response
public class SlackApiClient {
    private SlackHttpClient slackHttpClient;
    private String token;

    public SlackApiClient(String token) {
        this.token = token;
        slackHttpClient = new SlackHttpClient();
    }

    public UsersLookupByEmailResponse usersLookupByEmail(UsersLookupByEmailRequest req) {
        final String method = 'users.LookupByEmail';
        HttpRequestQueryParams params = new HttpRequestQueryParams();
        params.setParam('email', req.getEmail());
        HttpResponse res = slackHttpClient.get(method, params);

        return (UsersLookupByEmailResponse) JSON.deserialize(res.getBody(), UsersLookupByEmailResponse.class);
    }

    public ChatPostMessageResponse chatPostMessage(ChatPostMessageRequest req) {
        final String method = 'chat.postMessage';
        HttpResponse res = slackHttpClient.post(method, JSON.serialize(req));

        return (ChatPostMessageResponse) JSON.deserialize(res.getBody(), ChatPostMessageResponse.class);
    }
}