package com.its.tradeboard.Service;

import com.its.tradeboard.DTO.UserDTO;
import com.its.tradeboard.Repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {
    @Autowired
    private AdminRepository adminRepository;
    public List<UserDTO> userList() {
        return adminRepository.userList();
    }

    public int userDelete(Long id) {
        return adminRepository.userDelete(id);
    }

    public boolean userStop(Long id) {
        int result = adminRepository.userStop(id);

        if (result == 1) {
            return true;
        } else {
            return false;
        }
    }

    public boolean userActive(Long id) {
        int result = adminRepository.userActive(id);

        if (result != 1) {
            return true;
        } else {
            return false;
        }
    }
}
