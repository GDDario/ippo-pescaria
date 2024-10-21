package exception;

public class EmailAlreadyRegisteredException extends Exception {
    private static final String ERROR_MESSAGE = "Email already registered, log-in.";

    public EmailAlreadyRegisteredException() {
        super(ERROR_MESSAGE);
    }
}
