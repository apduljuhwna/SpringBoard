package com.example.springboard.Mapper;

import com.example.springboard.DTO.Board;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
    void insertBoard(Board board);
}
