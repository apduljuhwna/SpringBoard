package com.example.springboard.controller;

import com.example.springboard.DTO.User;
import com.example.springboard.Mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    private UserMapper userMapper;

    public UserController(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @GetMapping("/login")
    public String login() {
        return "/user/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute User user, HttpSession session, HttpServletRequest request ) {
        System.out.println("입력받은 ID: " + user.getU_id());
        System.out.println("입력받은 PW: " + user.getU_password());

        User dbUser = userMapper.findById(user.getU_id());
        System.out.println(": " + dbUser.getU_id());

        if (dbUser != null && dbUser.getU_password().equals(user.getU_password())) {
            session.setAttribute("user", dbUser);
            session.setAttribute("msg", "로그인 성공!");
            return "redirect:/"; // 🔥 redirect로 이동
        } else {
            request.setAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
            return "/user/login";
        }
    }

    @GetMapping("/sign-up")
    public String signup() {
        return "/user/sign-up";
    }

    @PostMapping("/sign-up")
    public String signup(@ModelAttribute User user, HttpServletRequest request) {
        userMapper.insertUser(user);
        request.setAttribute("msg","성공하셨습니다");
        return "/user/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        session.invalidate();

        return "redirect:/";
    }
}
