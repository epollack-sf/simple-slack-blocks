// Keeping in case use case comes up. Not currently in use
public class SlackHttpRequest {
    private static final String BASE_URL = 'https://slack.com/api';
    
    private final HttpRequest request;
    
    public SlackHttpRequest(String httpMethod) {
        request = getBaseRequest(httpMethod);
    }

    private HttpRequest getBaseRequest(String httpMethod) {
        HttpRequest req = new HttpRequest();
        req.setMethod(httpMethod);
        req.setTimeout(60000);
    }

    public void setEndpoint(String apiMethod, HttpRequestQueryParams params) {
        String endpoint = BASE_URL + '/' + apiMethod;
        if (params != null) {
            request.setEndpoint(endpoint + '?' + params.expand());
        } else {
            request.setEndpoint(endpoint);
        }
    }

    public void setBody(String body) {
        request.setBody(body);
    }

    public void getHttpRequest() {
        return request;
    }
}