package com.its.tradeboard.Service;

import com.its.tradeboard.DTO.AdminDTO;
import com.its.tradeboard.DTO.UserDTO;
import com.its.tradeboard.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    public boolean save(UserDTO userDTO) {
        int result = userRepository.save(userDTO);

        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public UserDTO login(UserDTO userDTO) {
        UserDTO result = userRepository.login(userDTO);
        return result;
    }

    public boolean adminLogin(UserDTO userDTO) {
        AdminDTO result = userRepository.adminLogin(userDTO);

        if (result != null) {
            return true;
        } else {
            return false;
        }
    }

    public UserDTO updateForm(String loginData) {
        return userRepository.updateForm(loginData);
    }

    public boolean update(UserDTO userDTO) {
        int updateResult = userRepository.update(userDTO);

        if (updateResult > 0) {
            return true;
        } else {
            return false;
        }
    }

    public String duplicate(String saveId) {
        String result = userRepository.duplicate(saveId);

        if (result == null) {
            return "OK";
        } else {
            return "NO";
        }
    }
}
