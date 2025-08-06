package com.example.springboard.controller;

import com.example.springboard.DTO.Board;
import com.example.springboard.Mapper.BoardMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/delete")
    public String delete(@RequestParam("b_id") int b_id){
        boardMapper.deleteBoard(b_id);
        return "redirect:/";
    }
}
