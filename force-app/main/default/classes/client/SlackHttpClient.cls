// Responsible for constructing Slack HTTP requests and executing them in the context of the Slack API

public class SlackHttpClient {
    private static final String BASE_URL = 'https://slack.com/api';
    private static final Integer DEFAULT_TIMEOUT = 60000;

    private final Http client;
    
    public SlackHttpClient() {
        client = new Http();
    }

    public HttpResponse get(String apiMethod) {
        return get(apiMethod, null);
    }

    public HttpResponse get(String apiMethod, HttpRequestQueryParams params) {
        final String httpMethod = 'GET';

        return client.send(createRequest(httpMethod, apiMethod, params));
    }

    public HttpResponse post(String apiMethod, String jsonBody) {
        return post(apiMethod, null, jsonBody);
    }

    public HttpResponse post(String apiMethod, HttpRequestQueryParams params, String jsonBody) {
        final String httpMethod = 'POST';

        return client.send(createRequest(httpMethod, apiMethod, params, jsonBody));
    }

    private HttpRequest createRequest(String httpMethod, String apiMethod, HttpRequestQueryParams params) {
        return createRequest(httpMethod, apiMethod, params, null);
    }

    private HttpRequest createRequest(String httpMethod, String apiMethod, HttpRequestQueryParams params, String jsonBody) {
        String endpoint = BASE_URL + '/' + apiMethod;
        
        HttpRequest req = new HttpRequest();
        req.setTimeout(DEFAULT_TIMEOUT);
        req.setMethod(httpMethod);
        req.setEndpoint((params == null) ? endpoint : endpoint + '?' + params.expand());
        if (jsonBody != null) {
            req.setBody(jsonBody);
        }

        return req;
        
        // SlackHttpRequest req = new SlackHttpRequest(httpMethod);
        // req.setEndpoint(apiMethod, params);
        // if (jsonBody != null) {
        //     req.setBody(jsonBody);
        // }

        // return req.getHttpRequest();
    }

    
}