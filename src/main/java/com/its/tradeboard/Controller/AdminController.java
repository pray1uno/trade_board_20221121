package com.its.tradeboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
    @GetMapping("/user/admin")
    public String admin() {
        return "admin";
    }

    @GetMapping("/admin/login")
    public String adminLoginForm() {
        return "redirect:/user/admin";
    }

    @GetMapping("/admin/userControl")
    public String userControlForm() {
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
