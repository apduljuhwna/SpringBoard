<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
  String msg = (String) request.getAttribute("msg");
  if(msg != null) {

%>

<script>
  alert("<%= msg%>");
</script>

<%
  }
%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login_style.css">
  <div id="login_wrap" class="wrap">
    <div>
      <h1>Login</h1>
      <form action="/user/login" method="post" class="form" id="login_form" onsubmit="return login_check()">
        <p><input type="text" name="u_id" id="id" placeholder="ID"></p>
        <span class="err_id"></span>
        <p><input type="password" name="u_password" id="pw" placeholder="Password"></p>
        <span class="err_pw"></span>
        <p><input type="submit" value="로그인" class="form_btn"></p>
        <p class="pre_btn"><a href="sign-up">회원가입</a></p>
      </form>
    </div>
  </div>

<script src="/static/js/login.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

