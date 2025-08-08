<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
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
<div style="width: 100%; margin-top: 50px; text-align: center;">
    <div style="width: 50%; margin: 50px auto 30px auto; text-align: right;">
        <%
            if (user != null) {
        %>
        <button onclick="location.href='/board/create'">글쓰기</button>
        <%
        } else {
        %>
        <button onclick="alert('로그인을 해야 글을 쓰실 수 있습니다.'); location.href='/user/login';" class="btn btn-secondary me-5">글쓰기</button>
        <%
            }
        %>
    </div>
        <table style="display:inline-table; width: 50%; text-align: center">
            <thead>
            <tr style="background-color: lightgrey; font-size: 25px">
                <th style="width: 100px;">번호</th>
                <th style="text-align: left">제목</th>
                <th>작성자</th>
                <th> </th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${boardList}">
            <tr style="border-bottom: 1px solid black">
                <td><c:out value="${board.b_id}"></c:out> </td>
                <td style="text-align: left"><a href="/board/view?b_id=${board.b_id}&nowPage=${pagingVO.nowPage}&cntPerPage=${pagingVO.cntPerPage}" style="text-decoration-line: none"><c:out value="${board.b_title}"></c:out> </a> </td>
                <td><c:out value="${board.u_name}"></c:out> </td>
                <c:if test="${user != null and user.u_id == board.id}">

                    <td><button onclick="location='board/delete?b_id=${board.b_id}'; alert('정말 삭제를 하시겠습니까?' )" class="btn btn-secondary me-5">삭제</button></td>
                </c:if>
                <c:if test="${user == null or user.u_id != board.id}">
                    <td> </td>
                </c:if>
                <td>${board.b_view}</td>
            </tr>
            </c:forEach>

            </tbody>
        </table>
        <div style="display: block; text-align: center;">
		<c:if test="${pagingVO.startPage != 1 }">
			<a href="/?nowPage=${pagingVO.startPage - 1 }&cntPerPage=${pagingVO.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="p">
			<c:choose>
				<c:when test="${p == pagingVO.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != pagingVO.nowPage }">
					<a href="/?nowPage=${p }&cntPerPage=${pagingVO.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${pagingVO.endPage != pagingVO.lastPage}">
			<a href="/?nowPage=${pagingVO.endPage+1 }&cntPerPage=${pagingVO.cntPerPage}">&gt;</a>
		</c:if>
	</div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />