package com.example.springboard.controller;

import com.example.springboard.DTO.Board;
import com.example.springboard.DTO.User;
import com.example.springboard.Mapper.BoardMapper;
import com.example.springboard.Mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardController {

    private BoardMapper boardMapper;

    public BoardController(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @GetMapping("/create")
    public String create(HttpSession session){

        return "/board/create";
    }

    @PostMapping("/create")
    public String createBoard(@ModelAttribute Board board){
        System.out.println("입력받은 제목: " + board.getB_title());
        System.out.println("입력받은 내용: " + board.getB_content());
        System.out.println("입력받은 아이디: " + board.getId());
        boardMapper.insertBoard(board);
        return "redirect:/";
    }
    @GetMapping("/view")
    public String view(HttpSession session){
        return "board/view";
    }
}
