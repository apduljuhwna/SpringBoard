package com.example.springboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardController {
    @GetMapping("/create")
    public String create(HttpSession session){

        return "/board/create";
    }
    @GetMapping("/view")
    public String view(HttpSession session){
        return "board/view";
    }
}
