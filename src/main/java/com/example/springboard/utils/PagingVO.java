package com.example.springboard.utils;

public class PagingVO {
    // 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
    private int nowpage,startPage,endPage,total,cntPerpage,lastPage,start,end;
    private int cntPage = 5;

    public PagingVO(){
    }
    public PagingVO(int total, int nowPage, int cntPerpage) {
        setNowPage(nowPage);
    }

    private void setNowPage(int nowPage) {
    }
}
