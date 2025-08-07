package com.example.springboard.controller;

import com.example.springboard.DTO.Board;
import com.example.springboard.Mapper.BoardMapper;
import com.example.springboard.utils.PagingVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String view(@RequestParam("b_id") int b_id, Model model, PagingVO pagingVO
            , @RequestParam(value = "nowPage" , required = false) String nowPage
            , @RequestParam(value = "cntPerPage" , required = false) String cntPerPage){
        Board board = boardMapper.findBoardById(b_id);
        model.addAttribute("board", board);
        boardMapper.plusviewCount(b_id);
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("cntPerPage", cntPerPage);
        System.out.println("제목 = " + board.getB_title());
        System.out.println("작성자 = " + board.getU_name());
        return "board/view";
    }

    @GetMapping("/update")
    public String update(@RequestParam("b_id") int b_id , Model model){
        Board board = boardMapper.findBoardById(b_id);
        model.addAttribute("board", board);
        return "board/update";
    }

    @PostMapping("/update")
    public String updateBoard(@ModelAttribute Board board){
        boardMapper.updateBoard(board);
        System.out.println("ggg = "+  board.getB_id());
        return "board/view";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("b_id") int b_id){
        boardMapper.deleteBoard(b_id);
        return "redirect:/";
    }
}
