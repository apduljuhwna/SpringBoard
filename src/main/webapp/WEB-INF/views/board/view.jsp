<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  com.example.springboard.DTO.User user = (com.example.springboard.DTO.User) session.getAttribute("user");
%>
<div style="width: 100%; display: flex; justify-content: center; margin-top: 50px">
  <div style="width: 50%;">
    <div style="text-align: center;">
      <h1 style="margin-top: 30px;">${board.b_title}</h1>
    </div>

    <div style="text-align: right;">
      <p>작성자: ${board.u_name}</p>
    </div>

    <div style="text-align: center;">
      <p>내용</p>
      <p style="margin-top: 30px;">${board.b_content}</p>

      <c:if test="${user != null and user.u_id == board.id}">
        <button onclick="location='update?b_id=${board.b_id}'">수정하기</button>
      </c:if>
      <button type="button" onclick="location='/'">뒤로가기</button>
    </div>
  </div>
</div>








<jsp:include page="/WEB-INF/views/common/footer.jsp" />