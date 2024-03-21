public class UsersLookupByEmailRequest implements SlackApiRequest {
    private final String email;

    private UsersLookupByEmailRequest(UsersLookupByEmailRequestBuilder builder) {
        email = builder.email;
    }

    public String getEmail() {
        return email;
    }

    public static UsersLookupByEmailRequestBuilder builder() {
        return new UsersLookupByEmailRequestBuilder();
    }

    // Validate?
    // Do I want to ensure the validitiy of the request? Isn't the server already doing that?
    // On the other hand, this would change how unified the builders are and not be completely in line with my goal to prevent bad api calls
    public class UsersLookupByEmailRequestBuilder {
        private String email;

        private UsersLookupByEmailRequestBuilder() {}

        public UsersLookupByEmailRequestBuilder email(String email) {
            this.email = email;

            return this;
        }

        public UsersLookupByEmailRequest build() {
            return new UsersLookupByEmailRequest(this);
        }
    }
}