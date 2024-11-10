package service;

import dao.UserDAO;
import dto.RegisterDTO;
import exception.EmailAlreadyRegisteredException;
import exception.InvalidPasswordConfirmationException;
import model.User;
import util.DateUtil;
import util.PasswordUtil;
import vo.Email;

public class AuthenticationService {
    private final UserDAO userDAO = new UserDAO();
//    private final PasswordUtil passwordUtil = new PasswordUtil();

    public boolean register(RegisterDTO dto) throws InvalidPasswordConfirmationException, EmailAlreadyRegisteredException {
        if (!dto.getPassword().equals(dto.getPasswordConfirmation())) {
            throw new InvalidPasswordConfirmationException();
        }

        boolean emailWasRegistered = userDAO.emailWasRegistered(dto.getEmail());
        if (emailWasRegistered) {
            throw new EmailAlreadyRegisteredException();
        }

        System.out.println("RESULTADO TRUE BUGADO? " + emailWasRegistered);
        System.out.println("AQUI");

//        String hashedPassword = passwordUtil.hashPassword(dto.getPassword());

//        System.out.println("HASHED PASSWORD: " + hashedPassword);

        User user = new User(
                dto.getName(),
                new Email(dto.getEmail()),
                DateUtil.convertStringToLocalDate(dto.getBirthDate()),
                dto.getPassword()
        );

        return userDAO.createUser(user);
    }
}
