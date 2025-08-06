<%@ page import="com.example.springboard.DTO.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style rel="/static/css/board.css"></style>

<%
    String msg = (String) session.getAttribute("msg");
    if(msg != null) {
%>

<script>
    alert("<%= msg%>");
</script>

<%
    session.removeAttribute("msg"); // 보여준 뒤 제거
    }
%>

<%
    com.example.springboard.DTO.User user = (com.example.springboard.DTO.User) session.getAttribute("user");

%>

<div style="width: 100%; margin-top: 50px; text-align: center;">
    <div style="width: 50%; margin: 50px auto 30px auto; text-align: right;">
        <%
            if (user != null) {
        %>
        <button onclick="location.href='/board/create'">글쓰기</button>
        <%
        } else {
        %>
        <button onclick="alert('로그인을 해야 글을 쓰실 수 있습니다.'); location.href='/user/login';">글쓰기</button>
        <%
            }
        %>
    </div>
        <table style="display:inline-table; width: 50%; text-align: center">
            <thead>
            <tr style="background-color: lightgrey; font-size: 25px">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th> </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${boardList}">
            <tr>
                <td><c:out value="${board.b_id}"></c:out> </td>
                <td><a href="/board/view?b_id=${board.b_id}" style="text-decoration-line: none"><c:out value="${board.b_title}"></c:out> </a> </td>
                <td><c:out value="${board.u_name}"></c:out> </td>
                <c:if test="${user != null and user.u_id == board.id}">

                    <td><button onclick="location='board/delete?b_id=${board.b_id}'; alert('정말 삭제를 하시겠습니까?')">삭제</button></td>
                </c:if>
                <c:if test="${user == null or user.u_id != board.id}">
                    <td> </td>
                </c:if>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />