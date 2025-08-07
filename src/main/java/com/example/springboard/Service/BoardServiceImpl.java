package com.example.springboard.Service;

import com.example.springboard.DTO.Board;
import com.example.springboard.Mapper.BoardMapper;
import com.example.springboard.utils.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl{

    @Autowired
    BoardMapper boardMapper;

    public int countBoard() {
        return boardMapper.countBoard();
    }

    public List<Board> selectBoard(PagingVO pagingvo){
        return boardMapper.selectBoard(pagingvo);
    }
}
