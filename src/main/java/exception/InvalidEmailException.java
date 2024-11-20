package exception;

public class InvalidEmailException extends Exception {
    private static final String ERROR_MESSAGE = "Email não cadastrado.";

    public InvalidEmailException() {
        super(ERROR_MESSAGE);
    }
}
