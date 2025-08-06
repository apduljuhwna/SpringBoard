package com.example.springboard.DTO;

public class Board {
    private int b_id;
    private String b_title;
    private String b_content;
    private String u_name; // 작성자 이름
    //폴인키
    private String id;


    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public String getB_title() {
        return b_title;
    }

    public void setB_title(String b_title) {
        this.b_title = b_title;
    }

    public String getB_content() {
        return b_content;
    }

    public void setB_content(String b_content) {
        this.b_content = b_content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
