package com.its.tradeboard.Service;

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

    public boolean login(UserDTO userDTO) {
        UserDTO result = userRepository.login(userDTO);

        if (result != null) {
            return true;
        } else {
            return false;
        }
    }
}
