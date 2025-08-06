package com.example.springboard.controller;

import com.example.springboard.DTO.Board;
import com.example.springboard.Mapper.BoardMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {
    private BoardMapper boardMapper;

    public HomeController(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @GetMapping("/")
    public String index(Model model) {
        List<Board> boardList = boardMapper.findAllBoard();
        model.addAttribute("boardList", boardList);
        return "index";  // → /WEB-INF/views/index.jsp 로 이동
    }
}