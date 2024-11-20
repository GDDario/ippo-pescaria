package dto;

import vo.Email;

public class LoginDTO {
    public Email email;
    public String password;

    public LoginDTO() {
    }

    public LoginDTO(Email email, String password) {
        this.email = email;
        this.password = password;
    }

    public Email getEmail() {
        return email;
    }

    public void setEmail(Email email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
