package com.example.springboard.Mapper;

import com.example.springboard.DTO.Board;
import com.example.springboard.utils.PagingVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardMapper {
    void insertBoard(Board board);
    void deleteBoard(int b_id);
    Board findBoardById(int b_id);
    void updateBoard(Board board);
    List<Board> selectBoard(PagingVO pagingVO);
    void plusviewCount(int b_id);
    int countBoardWithSearch(PagingVO vo);      // 내부에서 keyword 없으면 전체 count
    List<Board> selectBoardWithSearch(PagingVO vo); // 내부에서 keyword 없으면 전체 목록
}
