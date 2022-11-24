package com.its.tradeboard.Controller;

import com.its.tradeboard.DTO.UserDTO;
import com.its.tradeboard.Service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/admin/userDelete")
    public String userDelete(@RequestParam("id") Long id,
                             Model model) {
        int userDelete = adminService.userDelete(id);
        model.addAttribute("userDelete", userDelete);
        return "redirect:/admin/userControl";
    }

    @GetMapping("/admin/userStop")
    public String userStop(@RequestParam("id") Long id) {
        boolean result = adminService.userStop(id);

        if (result) {
            return "redirect:/admin/userControl";
        } else {
            return "admin";
        }
    }

    @GetMapping("/admin/userActive")
    public String userActive(@RequestParam("id") Long id) {
        boolean result = adminService.userActive(id);

        if (result) {
            return "admin";
        } else {
            return "redirect:/admin/userControl";
        }
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
