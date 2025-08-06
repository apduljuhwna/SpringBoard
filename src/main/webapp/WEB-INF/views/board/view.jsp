<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  com.example.springboard.DTO.User user = (com.example.springboard.DTO.User) session.getAttribute("user");
%>

<h1>${board.b_title}</h1>
<p>${board.b_content}</p>
<p>작성자: ${board.u_name}</p>

<c:if test="${user != null and user.u_id == board.id}">
  <button onclick="location='update?b_id=${board.b_id}'">수정하기</button>
</c:if>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />