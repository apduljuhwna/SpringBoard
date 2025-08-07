package com.example.springboard.utils;

public class PagingVO {
    // 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
    private int nowPage,startPage,endPage,total,cntPerPage,lastPage,start,end;
    private int cntPage = 5; //페이지 가 몆인지 보여줄지 보여준다.

    public PagingVO(){
    }
    public PagingVO(int total, int nowPage, int cntPerPage) {
        setNowPage(nowPage);
        setCntPerPage(cntPerPage);
        setTotal(total);
        calcLastPage(getTotal(),getCntPerPage());
        calcStartEndPage(getNowPage(),cntPage);
        calcStartEnd(getNowPage(),getCntPerPage(),getNowPage());
    }
    // 약 현재 67개의 데이터가 있다고 가정
    //total = 67 , cntPerPage = 10
    //lastPage = 6.7 -> (ceil) -> 7
    // 제일 마지막 페이지 계산 전체 페이지 / 페이지당 글 갯수
    public void calcLastPage(int total, int cntPerpage) {
        setLastPage((int) Math.ceil((double)total / (double) cntPerpage));
    }

    //시작, 끝 페이지 계산
    //nowPage = 6 , cntPage = 5 가정
    public void calcStartEndPage(int nowPage, int cntPage){
        //현재보고있는페이지 = 6 / 5 = 1.2 -> (ceil) -> 2 * 5 = 10 -> endPage = 10
        setEndPage(((int)Math.ceil((double)nowPage / (double) cntPage)) * cntPage);
        if(getLastPage() < getEndPage()){ //만약 7 < 10 True
            setEndPage(getLastPage()); // endPage = 7
        }
        //StartPage = 7 - 5 + 1 -> 3 StartPage = 3
        setStartPage(getEndPage() - cntPage + 1);
        if(getStartPage() < 1){
            setStartPage(1);
        }
    }

    //DB 쿼리에서 사용할 start, end 값 계산
    //nowPage = 6 , cntPerPage = 10
    public void calcStartEnd(int nowPage, int cntPerPage , int getNowPage){
        setEnd(nowPage * cntPerPage); //End = 60
        if(getNowPage() == 1) setStart(getEnd() - cntPerPage);
        else setStart(getEnd() - cntPerPage +1); //51
        //즉 6페이지에서 보여줄 게시글 번호는 51번~60번
    }

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getCntPerPage() {
        return cntPerPage;
    }

    public void setCntPerPage(int cntPerPage) {
        this.cntPerPage = cntPerPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getCntPage() {
        return cntPage;
    }

    public void setCntPage(int cntPage) {
        this.cntPage = cntPage;
    }

    @Override
    public String toString() {
        return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
                + ", cntPerpage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
                + ", cntPage=" + cntPage +"]";
    }
}
