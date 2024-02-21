public class SlackHttpClient {
    private static final String BASE_URL = 'https://slack.com/api';
    
    private final Http client;
    
    public SlackHttpClient() {
        client = new Http();
    }

    public HttpResponse get(String apiMethod) {
        return get(apiMethod, null);
    }

    public HttpResponse get(String apiMethod, HttpRequestQueryParams params) {
        final String httpMethod = 'GET';
        HttpRequest req = getBaseRequest(httpMethod);
        setRequestEndpoint(req, apiMethod, params);

        return client.send(req);
    }

    public HttpResponse post(String apiMethod, Object jsonBody) {
        return post(apiMethod, null, jsonBody);
    }

    public HttpResponse post(String apiMethod, HttpRequestQueryParams params, String jsonBody) {
        final String httpMethod = 'POST';
        HttpRequest req = getBaseRequest(httpMethod);
        setRequestEndpoint(req, apiMethod, params);
        req.setBody(jsonBody);

        return client.send(req);
    }

    private HttpRequest getBaseRequest(String httpMethod) {
        HttpRequest req = new HttpRequest();
        req.setMethod(httpMethod);
        req.setTimeout(60000);
    }

    private void setRequestEndpoint(HttpRequest req, String apiMethod, HttpRequestQueryParams params) {
        String endpoint = BASE_URL + '/' + apiMethod;
        if (params != null) {
            req.setEndpoint(endpoint + '?' + params.expand());
        } else {
            req.setEndpoint(endpoint);
        }
    }

    
}