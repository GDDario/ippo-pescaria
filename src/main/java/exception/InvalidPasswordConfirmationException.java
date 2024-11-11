package exception;

public class InvalidPasswordConfirmationException extends Exception {
    private static final String ERROR_MESSAGE = "As senhas não coincidem!";

    public InvalidPasswordConfirmationException() {
        super(ERROR_MESSAGE);
    }
}
