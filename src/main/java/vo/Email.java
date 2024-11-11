package vo;

import java.util.regex.Pattern;

public class Email {
    private final String value;

    public Email(String value) {
        validate(value);
        this.value = value;
    }

    /**
     * @param value The email to be validated
     */
    private void validate(String value) throws IllegalArgumentException {
        if (!Pattern.compile("^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
                        + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$")
                .matcher(value)
                .matches()) {
            throw new IllegalArgumentException("Email inválido.");
        }
    }

    @Override
    public String toString() {
        return value;
    }
}
