package util;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

public class PasswordUtil {
    private static final Argon2 argon2 = Argon2Factory.create();

    public String hashPassword(String password) {
        return argon2.hash(2, 65536, 1, password.toCharArray());
    }

    public boolean verifyPassword(String password, String hashedPassword) {
        return argon2.verify(hashedPassword, password.toCharArray());
    }
}
