package com.example.springboard.controller;

import com.example.springboard.DTO.Board;
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
    public String index(Model model , PagingVO pagingVO ,
                        @RequestParam(value="nowPage", required=false) String nowPage,
                        @RequestParam(value="cntPerPage", required=false) String cntPerPage,
                        @RequestParam(value="keyword", required=false) String keyword,
                        @RequestParam(value="searchType", required=false) String searchType) {

        if (nowPage == null) nowPage = "1";
        if (cntPerPage == null) cntPerPage = "10";

        // 1) 먼저 검색조건 세팅
        pagingVO.setSearchType(searchType);
        pagingVO.setKeyword(keyword);

        // 2) 검색 반영해서 total 계산
        int total = boardMapper.countBoardWithSearch(pagingVO);

        // 3) 페이징 계산 + 검색조건 유지
        pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        pagingVO.setSearchType(searchType);
        pagingVO.setKeyword(keyword);

        // 4) 검색 + 페이징 결과로 화면에 뿌리기
        List<Board> list = boardMapper.selectBoardWithSearch(pagingVO);

        model.addAttribute("pagingVO", pagingVO);
        model.addAttribute("boardList", list); // ✅ 검색결과 사용
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        return "index";
    }
}