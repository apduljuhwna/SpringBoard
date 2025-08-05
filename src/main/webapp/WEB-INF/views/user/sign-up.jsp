<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login_style.css">



<div id="regist_wrap" class="wrap" style="margin-top: 100px;">
  <div>
    <h1>Join</h1>
    <form action="/user/sign-up" method="post" name="regiform" id="regist_form" class="form" onsubmit="return sendit()">
      <p><input type="text" name="u_name" id="username" placeholder="Name (한글, 영어)"></p>
      <p><input type="text" name="u_id" id="userid" placeholder="ID">
        <input type="hidden" name="decide_id" id="decide_id">
      </p>
      <p><span id="decide" style='color:red; font-size:13px;'>* ID 중복 여부를 확인해주세요.&nbsp;</span>
        <input type="button" id="check_button" value="ID 중복체크" onclick="checkId();">
      </p>
      <p><input type="password" name="u_password" id="userpw" placeholder="Password"></p>
      <p><input type="password" name="u_password_ch" id="userpw_ch" placeholder="Password Check"></p>
      <p><input style="width:210px;" type="text" name="u_email" id="useremail" placeholder="Email">@
        <select style="width:165px; height:40px; border: 1px solid #d9d9d9; border-radius: 10px;font-size: 14px;" name="emadress">
          <option value="naver.com">naver.com</option>
          <option value="gmail.com">gmail.com</option>
          <option value="daum.net">daum.net</option>
        </select>
      </p>
      <p><input type="text" name="u_phone" id="userphone" placeholder="Phone Number"></p>
      <p><span style='color:red; font-size:13px; float:left;'>&nbsp;&nbsp;&nbsp;"-" 없이 11자리 숫자만 입력</span>
        <input type="submit" value="회원가입" id="join_button" class="form_btn">
      </p>
      <p><a href="login" style="color: gray; font-size:13px;">로그인</a></p>
    </form>
  </div>
</div>

<script src="/static/js/sign-up.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

