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

    public class UsersLookupByEmailRequestBuilder {
        private String email;

        private UsersLookupByEmailRequestBuilder() {}

        public UsersLookupByEmailRequestBuilder email(String email) {
            this.email = email;

            return this;
        }

        // Check if valid email with regex
        private void validate() {

        }

        public UsersLookupByEmailRequest build() {
            validate();
            return new UsersLookupByEmailRequest(this);
        }
    }
}