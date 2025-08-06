<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  com.example.springboard.DTO.User user = (com.example.springboard.DTO.User) session.getAttribute("user");
%>



<form action="/board/update?b_id=${board.b_id}" method="post">
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





<jsp:include page="/WEB-INF/views/common/footer.jsp" />