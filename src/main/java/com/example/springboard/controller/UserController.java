package com.example.springboard.controller;

import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    @GetMapping("/login")
    public String login() {
        return "/user/login";
    }

    @GetMapping("/sign-up")
    public String signup() {
        return "/user/sign-up";
    }

    @PostMapping("/sign-up")
    public String signup(SecurityProperties.User user) {
        return "/user/sign-up";
    }
}
