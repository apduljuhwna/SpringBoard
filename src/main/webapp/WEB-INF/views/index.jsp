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

    <div style="width: 100%; margin-top: 50px; text-align: center" >
        <div style="width: 50%; margin: 50px auto 30px auto; text-align: right;">
            <button onclick="location.href='/board/create'">글쓰기</button>
        </div>

        <table style="display:inline-table; width: 50%; text-align: center">
            <thead>
            <tr style="background-color: lightgrey; font-size: 25px">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td><a href="board/view" style="text-decoration-line: none">제목입니다</a> </td>
                <td>이주환</td>
            </tr>
            </tbody>
        </table>
    </div>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />