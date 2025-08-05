package com.example.springboard.Mapper;

import com.example.springboard.DTO.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    void insertUser(User user);
}
