package com.example.springboard.Mapper;

import com.example.springboard.DTO.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

@Mapper
public interface UserMapper {
    void insertUser(User user);
    User findById(String user);
    String checkid(String u_id);
}
