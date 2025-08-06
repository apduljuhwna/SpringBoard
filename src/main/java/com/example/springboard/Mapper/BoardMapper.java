package com.example.springboard.Mapper;

import com.example.springboard.DTO.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    void insertBoard(Board board);
    List<Board> findAllBoard();
    void deleteBoard(int b_id);
    Board findBoardById(int b_id);
    void updateBoard(Board board);
}
