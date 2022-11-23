package com.its.tradeboard.Controller;

import com.its.tradeboard.DTO.UserDTO;
import com.its.tradeboard.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @GetMapping("/user/save")
    public String saveForm() {
        return "user_save";
    }

    @PostMapping("/user/save")
    public String save(@ModelAttribute UserDTO userDTO,
                       Model model) {
        boolean saveResult = userService.save(userDTO);
        model.addAttribute("newSave", saveResult);
        return "index";
    }

    @PostMapping("/user/login")
    public String login(@ModelAttribute UserDTO userDTO,
                        Model model,
                        HttpSession session) {
        boolean result = userService.login(userDTO);
        boolean adminResult = userService.adminLogin(userDTO);

        if (result) {
            model.addAttribute("userLogin", userDTO.getUserId());
            session.setAttribute("userLogin", userDTO.getUserId());
            return "redirect:/item/mainPaging";
        } else if (adminResult) {
            model.addAttribute("adminLogin", userDTO.getUserId());
            session.setAttribute("adminLogin", userDTO.getUserId());
            return "admin";
        } else {
            return "index";
        }
    }

    @GetMapping("/user/logout")
    public String userLogout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @GetMapping("/user/myPage")
    public String userMyPage() {
        return "user_myPage";
    }

    @GetMapping("user/toUpdate")
    public String userMyUpdateForm(Model model,
                                   HttpSession session) {
        String loginData = (String) session.getAttribute("userLogin");
        UserDTO result = userService.updateForm(loginData);
        model.addAttribute("myPage", result);
        return "user_myUpdate";
    }

    @PostMapping("/user/myUpdate")
    public String userMyUpdate(@ModelAttribute UserDTO userDTO) {
        boolean result = userService.update(userDTO);

        if (result) {
            return "user_myPage";
        } else {
            return "index";
        }
    }

}
