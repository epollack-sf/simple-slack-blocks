public class UsersLookupByEmailResponse implements SlackApiResponse {
    // ok, error, errors, warning, etc should be in every API response
    private Boolean ok;
    private String error;
    private SlackUser user;

    // Only created through deserialization
    private UsersLookupByEmailResponse() {}

    public Boolean getOk() {
        return ok;
    }

    public String getError() {
        return error;
    }

    public SlackUser getUser() {
        return user;
    }
}