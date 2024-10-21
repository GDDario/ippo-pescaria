package exception;

public class InvalidPasswordConfirmationException extends Exception {
    private static final String ERROR_MESSAGE = "Passwords do not match!";

    public InvalidPasswordConfirmationException() {
        super(ERROR_MESSAGE);
    }
}
