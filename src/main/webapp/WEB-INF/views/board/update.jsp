<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<form action="/board/update?b_id=${board.b_id}" method="post" onclick="return check()">
  <input type="hidden" name="id" value="<%=user.getU_id()%>">
  <div style="width: 100%; display: flex; justify-content: center; margin-top: 50px">
    <div style="width: 30%; margin: 50px auto 0 auto; ">
      <div style="color: black; font-size: 25px; text-align: left">Title</div>
      <input type="text" name="b_title" placeholder="제목을 적어주세요" style="width: 100%; border: 3px solid lightblue" value="${board.b_title}">
      <div style="color: black; font-size: 25px; text-align: left">내용</div>
      <textarea name ="b_content" rows="10" cols="50" style="width: 100%; border: 3px solid lightblue;">${board.b_content}</textarea>
      <div style="color: black; font-size: 25px; text-align: left">작성자</div>
      <input type="text" disabled value="<%=user.getU_name()%>">
      <div style="text-align: center; margin-top: 10px">
        <div>
          <button type="button" onclick="location='/'">뒤로가기</button>
          <button type="submit">수정하기</button>
        </div>
      </div>
    </div>
  </div>
</form>
<script>
  function check(){
    var b_title = $('#b_title').val();
    var b_content = $('#b_content').val();
    if(b_title === ""){
      alert("제목을 입력해주세요");
      return false;
    }
    if(b_content === ""){
      alert("내용을 입력해주세요");
      return false;
    }
    return true; // 함수 안으로 들어와야 함!
  }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />