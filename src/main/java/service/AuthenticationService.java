package service;

import dao.UserDAO;
import dto.LoginDTO;
import dto.RegisterDTO;
import exception.EmailAlreadyRegisteredException;
import exception.InvalidEmailException;
import exception.InvalidPasswordConfirmationException;
import model.User;
import util.DateUtil;
import util.PasswordUtil;
import vo.Email;

public class AuthenticationService {
    private final UserDAO userDAO = new UserDAO();

    public boolean register(RegisterDTO dto) throws InvalidPasswordConfirmationException, EmailAlreadyRegisteredException {
        PasswordUtil passwordUtil = new PasswordUtil();

        if (!dto.getPassword().equals(dto.getPasswordConfirmation())) {
            throw new InvalidPasswordConfirmationException();
        }

        boolean emailWasRegistered = userDAO.emailWasRegistered(dto.getEmail());
        if (emailWasRegistered) {
            throw new EmailAlreadyRegisteredException();
        }

        String hashedPassword = passwordUtil.hashPassword(dto.getPassword());

        User user = new User(
                dto.getName(),
                new Email(dto.getEmail()),
                DateUtil.convertStringToLocalDate(dto.getBirthDate()),
                hashedPassword
        );

        return userDAO.createUser(user);
    }

    public String login(LoginDTO dto) throws InvalidEmailException {

        if (!userDAO.emailWasRegistered(dto.getEmail().toString())) {
            throw new InvalidEmailException();
        }

        return userDAO.verifyCredentials(dto);
    }
}
