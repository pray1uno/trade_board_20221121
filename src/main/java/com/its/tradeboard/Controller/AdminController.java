package com.its.tradeboard.Controller;

import com.its.tradeboard.DTO.UserDTO;
import com.its.tradeboard.Service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    @GetMapping("/user/admin")
    public String admin() {
        return "admin";
    }

    @GetMapping("/admin/login")
    public String adminLoginForm() {
        return "redirect:/user/admin";
    }

    @GetMapping("/admin/userControl")
    public String userControlForm(Model model) {
        List<UserDTO> userDTOList = adminService.userList();
        model.addAttribute("userControl", userDTOList);
        return "admin_userControl";
    }

    @GetMapping("/admin/salesItemControl")
    public String salesItemControlForm() {
        return "admin_salesItemControl";
    }

    @GetMapping("/admin/tradeListControl")
    public String tradeListControlForm() {
        return "admin_tradeListControl";
    }
}
