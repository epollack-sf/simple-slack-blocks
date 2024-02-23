// Inspired by MethodsClientImpl.java from Slack SDK for Java
// Responsible for setting up the request and parsing the response
public class SlackApiClient {
    private SlackHttpClient slackHttpClient;
    private String token;

    public SlackApiClient(String token) {
        this.token = token;
        httpClient = new SlackHttpClient();
    }

    public UsersLookupByEmailResponse usersLookupByEmail(UsersLookupByEmailRequest req) {
        final String method = 'users.LookupByEmail';
        HttpRequestQueryParams params = new HttpRequestQueryParams();
        params.addParam('email', req.getEmail());
        HttpResponse res = slackHttpClient.get(method, params);

        return JSON.deserialize(res.getBody(), UsersLookupByEmailResponse.class);
    }

    public ChatPostMessageResponse chatPostMessage(ChatPostMessageRequest req) {
        final String method = 'chat.postMessage';
        HttpResponse res = slackHttpClient.post(method, JSON.serialize(req));

        return JSON.deserialize(res.getBody(), ChatPostMessageResponse.class);
    }
}