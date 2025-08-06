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
<div style="width: 100%; margin-top: 50px; border: 5px solid black; text-align: center; ">

  <table style="width: 50%;border: 5px solid red; text-align: center;">
    <tr>
      <th>제 목</th>
      <td> <input type="text"> </td>
    </tr>
  </table>

</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />