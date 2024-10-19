import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import vo.Email;

public class EmailTest {
    @Test
    public void testIfEmailIsValidAndNoExceptionIsThrown() {
        String emailString = "valid@email.com";

        Assertions.assertDoesNotThrow(() -> new Email(emailString));
    }

    @Test
    public void testIfEmailIsInvalidAndAExceptionIsThrown() {
        String emailString = "invalid.com";

        Assertions.assertThrows(IllegalArgumentException.class, () -> new Email(emailString));
    }
}
