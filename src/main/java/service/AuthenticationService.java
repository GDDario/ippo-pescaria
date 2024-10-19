package service;

import dto.RegisterDTO;
import vo.Email;

public class AuthenticationService {
    public void register(RegisterDTO dto) {
        var test = RegisterDTO.builder().setAge(1).build();
    }
}
