<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  com.example.springboard.DTO.User user = (com.example.springboard.DTO.User) session.getAttribute("user");
%>


<form action="/board/update?b_id=${board.b_id}" method="post">
  <input type="hidden" name="id" value="<%=user.getU_id()%>">
  <div style="width: 60%; margin: 50px auto 0 auto; ">
    <table style="width: 100%;">
      <tr>
        <td style="width: 80px;">제 목</td>
        <td>
          <input type="text" name="b_title" placeholder="제목을 적어주세요" style="width: 100%; " value="${board.b_title}">
        </td>
      </tr>
      <tr>
        <td>내 용</td>
        <td>
          <textarea name ="b_content" rows="10" cols="50" style="width: 100%;">${board.b_content}</textarea>
        </td>
      </tr>
      <tr>
        <td>작 성 자</td>
        <td><input type="text" disabled value="<%=user.getU_name()%>"></td>
      </tr>
    </table>
    <div style="text-align: center; margin-top: 10px">
      <div>

        <button type="submit">수정하기</button>
      </div>
    </div>
  </div>
</form>
<button>뒤로가기</button>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />