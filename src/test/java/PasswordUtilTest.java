import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import util.PasswordUtil;

public class PasswordUtilTest {
    private PasswordUtil passwordUtil;

    @BeforeEach
    public void setUp() {
        passwordUtil = new PasswordUtil();
    }

    @Test
    public void testPasswordHashingWithArgon2ShouldTransformTheGivenString() {
        String password = "@My_Unbr34k4bl3-P4ssw0rD@@";

        String hashedPassword = passwordUtil.hashPassword(password);

        Assertions.assertNotEquals(password, hashedPassword);
    }

    @Test
    public void testPasswordCanBeVerifiedAfterHashing() {
        String password = "@My_Unbr34k4bl3-P4ssw0rD@@";

        String hashedPassword = passwordUtil.hashPassword(password);

        Assertions.assertTrue(passwordUtil.verifyPassword(password, hashedPassword));
    }
}
