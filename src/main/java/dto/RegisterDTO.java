package dto;

import java.time.LocalDate;

public class RegisterDTO {
    private String name;
    private String birthDate;
    private String email;
    private String password;
    private String passwordConfirmation;

    private RegisterDTO(Builder builder) {
        this.name = builder.getName();
        this.birthDate = builder.getBirthDate();
        this.email = builder.getEmail();
        this.password = builder.getPassword();
        this.passwordConfirmation = builder.getPasswordConfirmation();
    }

    public String getName() {
        return name;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getPasswordConfirmation() {
        return passwordConfirmation;
    }

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        private String name;
        private String birthDate;
        private String email;
        private String password;
        private String passwordConfirmation;

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setBirthDate(String birthDate) {
            this.birthDate = birthDate;
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

        public Builder setPasswordConfirmation(String passwordConfirmation) {
            this.passwordConfirmation = passwordConfirmation;
            return this;
        }

        public String getName() {
            return name;
        }

        public String getBirthDate() {
            return birthDate;
        }

        public String getEmail() {
            return email;
        }

        public String getPassword() {
            return password;
        }

        public String getPasswordConfirmation() {
            return passwordConfirmation;
        }

        public RegisterDTO build() {
            return new RegisterDTO(this);
        }
    }
}
