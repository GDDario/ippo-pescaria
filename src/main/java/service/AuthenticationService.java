package service;

import dao.UserDAO;
import dto.RegisterDTO;
import exception.EmailAlreadyRegisteredException;
import exception.InvalidPasswordConfirmationException;
import model.User;
import util.DateUtil;
import vo.Email;

public class AuthenticationService {
    private final UserDAO userDAO = new UserDAO();

    public void register(RegisterDTO dto) throws InvalidPasswordConfirmationException, EmailAlreadyRegisteredException {
        if (!dto.getPassword().equals(dto.getPasswordConfirmation())) {
            throw new InvalidPasswordConfirmationException();
        }

        if (userDAO.emailWasRegistered(dto.getEmail())) {
            throw new EmailAlreadyRegisteredException();
        }

        User user = new User(
                dto.getName(),
                new Email(dto.getEmail()),
                DateUtil.convertStringToLocalDate(dto.getBirthDate())
        );

        userDAO.createUser(user);
    }
}
