<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="card mb-3 mt-5" >
  <div class="card-body" style="display:grid; justify-items: center">
    <img src="..." class="card-img-top" alt="...">
    <h5 class="card-title">${board.b_title}</h5>
    <p class="card-text">${board.b_content}</p>
    <p class="card-text"><small class="text-body-secondary">작성자: ${board.u_name}</small></p>
    <p style="text-align: center">
      <c:if test="${user != null and user.u_id == board.id}">
        <button onclick="location='update?b_id=${board.b_id}'" class="btn btn-secondary me-0" style="justify-items: center">수정하기</button>
      </c:if>
        <button onclick="location='/?nowPage=${endPage+1 }&cntPerPage=${cntPerPage}'" class="btn btn-secondary me-0" style="justify-items: center">뒤로가기</button>
    </p>

  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />