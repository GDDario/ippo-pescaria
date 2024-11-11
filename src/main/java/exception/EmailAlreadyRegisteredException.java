package exception;

public class EmailAlreadyRegisteredException extends Exception {
    private static final String ERROR_MESSAGE = "Email já cadastrado no sistema.";

    public EmailAlreadyRegisteredException() {
        super(ERROR_MESSAGE);
    }
}
