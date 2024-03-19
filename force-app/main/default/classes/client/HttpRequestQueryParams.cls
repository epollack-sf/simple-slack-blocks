public class HttpRequestQueryParams {
    private Map<String, String> params;
    
    public HttpRequestQueryParams() {
        params = new Map<String, String>();
    }

    public void setParam(String key, String value) {
        params.put(key, value);
    }

    public String getParam(String key) {
        return params.get(key);
    }

    public String expand() {
        String result = '';

        for (String key : params.keySet()) {
            result += key + '=' + params.get(key) + '&';
        }

        return result.removeEnd('&');
    }
}