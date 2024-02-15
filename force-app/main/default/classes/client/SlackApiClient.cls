// Slack API Config

public class SlackApiClient {
    private Http httpClient;
    private String token;

    public SlackApiClient(String token) {
        this.token = token;
        httpClient = new Http();
    }

    // Why queueable?
    public void usersLookupByEmail(String email) {
        String endpoint
        
        HttpRequest req = new HttpRequest();
        // req.setEndpoint(base)

    }

    public void chatPostMessage() {
        
    }
}