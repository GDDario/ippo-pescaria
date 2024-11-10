import dto.RegisterDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import service.AuthenticationService;

import java.time.LocalDate;

public class AuthenticationServiceTest {
    private AuthenticationService authenticationService;

    @BeforeEach
    public void setUp() {
        authenticationService = new AuthenticationService();
    }

    @Test
    public void testRegisterWillBeSuccessfull() {
        RegisterDTO registerDTO = RegisterDTO
                .builder()
                .setName("Gabriel")
//                .setBirthDate()
                .setEmail("email@test.com")
                .setPassword("@Easy_Password_12344321")
                .build();

//        authenticationService.register(registerDTO);
    }
}
