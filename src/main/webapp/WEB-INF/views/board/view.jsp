<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div style="width: 100%;  display: flex; justify-content: center; margin-top: 50px; border: 5px solid red;" >
  <table style="width: 50%; border: 5px solid black; text-align: center">
    <thead>
    <tr>
      <th>id</th>
      <th>제목</th>
      <th>내용</th>
      <th>작성자</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>1</td>
      <td>제목입니다</td>
      <td>내용</td>
      <td>이주환</td>
      <td><button onclick="location.href='/board/view'">게시글 확인</button></td>
      <td><button onclick="location.href='/board/delete'">삭제</button></td>
    </tr>
    </tbody>
  </table>
</div>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />