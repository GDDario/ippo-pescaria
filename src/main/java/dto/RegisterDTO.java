package dto;

public class RegisterDTO {
    public String name;
    public int age;
    public String email;
    public String password;

    private RegisterDTO(Builder builder) {
        this.name = builder.getName();
        this.age = builder.getAge();
        this.email = builder.getEmail();
        this.password = builder.getPassword();
    }

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        private String name;
        private int age;
        private String email;
        private String password;

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setAge(int age) {
            this.age = age;
            return this;
        }

        public Builder setEmail(String email) {
            this.email = email;
            return this;
        }

        public Builder setPassword(String password) {
            this.password = password;
            return this;
        }

        public String getName() {
            return name;
        }

        public int getAge() {
            return age;
        }

        public String getEmail() {
            return email;
        }

        public String getPassword() {
            return password;
        }

        public RegisterDTO build() {
            return new RegisterDTO(this);
        }
    }
}
