package com.example.springboard.controller;

import com.example.springboard.DTO.Board;
import com.example.springboard.Mapper.BoardMapper;
import com.example.springboard.utils.PagingVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

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
    public String createBoard(@ModelAttribute Board board,Model model
                                , @RequestParam(value = "nowPage" , required = false) String nowPage
                                , @RequestParam(value = "cntPerPage" , required = false) String cntPerPage
                                , @RequestParam(value = "image", required = false) MultipartFile image
                                , HttpServletRequest request) throws IOException {
        if (image != null && !image.isEmpty()) {
            // 1) 웹앱 내부 저장 경로 (view에서 /static/** 로 접근)
            String relPath = "/static/upload"; // ← 실제 폴더명과 일치시켜요
            String realPath = request.getServletContext().getRealPath(relPath);

            File dir = new File(realPath);
            if (!dir.exists()) {
                boolean ok = dir.mkdirs();              // ★ 폴더 생성
                if (!ok) throw new IOException("업로드 폴더 생성 실패: " + dir.getAbsolutePath());
            }

            // 2) 파일 저장
            String original = image.getOriginalFilename();
            String saveName = System.currentTimeMillis() + "_" + (original == null ? "file" : original);
            File dest = new File(dir, saveName);
            image.transferTo(dest);

            // 3) 브라우저에서 쓸 경로(DB에는 웹 경로로 저장)
            board.setImage_path(relPath + "/" + saveName);  // 예: /static/upload/123.png
        }

        System.out.println("입력받은 제목: " + board.getB_title());
        System.out.println("입력받은 내용: " + board.getB_content());
        System.out.println("입력받은 아이디: " + board.getId());
        boardMapper.insertBoard(board);
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("cntPerPage", cntPerPage);
        return "redirect:/board/view?b_id=" + board.getB_id();
    }
    @GetMapping("/view")
    public String view(@RequestParam("b_id") int b_id, Model model,
                       @RequestParam(value="nowPage", required=false) String nowPage,
                       @RequestParam(value="cntPerPage", required=false) String cntPerPage) {

        Board board = boardMapper.findBoardById(b_id);
        if (board == null) {
            System.out.println("[view] not found b_id=" + b_id);
            return "redirect:/?msg=notfound"; // 혹은 에러 페이지
        }

        // 조회수 증가는 여기서
        boardMapper.plusviewCount(b_id);

        model.addAttribute("board", board);
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
