package com.example.springboard.controller;

import com.example.springboard.Mapper.BoardMapper;
import com.example.springboard.utils.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private BoardMapper boardMapper;

    public HomeController(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @GetMapping("/")
    public String index(Model model , PagingVO pagingVO , @RequestParam(value = "nowPage" , required = false) String nowPage
                        , @RequestParam(value = "cntPerPage" , required = false) String cntPerPage) {
        int total = boardMapper.countBoard();
        if(nowPage == null && cntPerPage == null){
            nowPage = "1";
            cntPerPage = "10";
        }else if(nowPage == null){
            nowPage = "1";
        }else if(cntPerPage == null){
            cntPerPage = "10";
        }
        pagingVO = new PagingVO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
        model.addAttribute("pagingVO",pagingVO);
        model.addAttribute("boardList",boardMapper.selectBoard(pagingVO));
        return "index";  // → /WEB-INF/views/index.jsp 로 이동
    }
}