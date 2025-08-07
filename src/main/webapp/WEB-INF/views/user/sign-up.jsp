<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login_style.css">

<div id="regist_wrap" class="wrap" style="margin-top: 100px;">
  <div>
    <h1>Join</h1>
    <form action="/user/sign-up" method="post" name="regiform" id="regist_form" class="form" onsubmit="return sendit()">
      <p>
        <input type="text" name="u_name" id="username" placeholder="Name (한글, 영어)">
        <span id="decide_font"></span>
      </p>
      <p><input type="text" name="u_id" id="userid" placeholder="ID">

        <span id="decide_font0"></span>

      </p>
      <p><span id="decide" style='color:red; font-size:13px;' >* ID 중복 여부를 확인해주세요.&nbsp;</span>
        <input type="button" id="check_button" value="ID 중복체크" onclick="checkId();">
      </p>
      <p><input type="password" name="u_password" id="userpw" placeholder="Password">
        <span id="decide_font1"></span>
      </p>
      <p>
        <input type="password" name="u_password_ch" id="userpw_ch" placeholder="Password Check">
        <span id="decide_font2"></span>
        <span id="pwch"></span>
      </p>
      <p>
        <input style="width:210px;" type="text" name="u_email" id="useremail" placeholder="Email">@
        <select style="width:165px; height:40px; border: 1px solid #d9d9d9; border-radius: 10px;font-size: 14px;" name="emadress">
          <option value="naver.com">naver.com</option>
          <option value="gmail.com">gmail.com</option>
          <option value="daum.net">daum.net</option>
        </select>
        <span id="decide_font3"></span>
      </p>
      <p>
        <input type="text" name="u_phone" id="userphone" placeholder="Phone Number">
        <span id="decide_font4"></span>
      </p>
      <p>
        <span style='color:red; font-size:13px; float:left;'>&nbsp;&nbsp;&nbsp;"-" 없이 11자리 숫자만 입력</span>
        <input type="submit" value="회원가입" id="join_button" class="form_btn">
      </p>
      <p><a href="login" style="color: gray; font-size:13px;">로그인</a></p>
    </form>
  </div>
</div>
<script>
  function sendit(){
    var username = $('#username').val();
    var userpw = $('#userpw').val();
    var userpw_ch = $('#userpw_ch').val();
    var useremail = $('#useremail').val();
    var userphone = $('#userphone').val();
    var isValid = true;
    var decide_font0 = $('#decide_font0').text();
    if(username === ""){
      $('#decide_font').text("이름을 입력해주세요").css("color", "red");
      isValid = false;
    } else {
      $('#decide_font').text(""); // 성공 시 초기화
    }

    if(userpw === ""){
      $('#decide_font1').text("비밀번호를 입력해주세요").css("color", "red");
      isValid = false;
    } else {
      $('#decide_font1').text("");
    }

    if(userpw_ch === ""){
      $('#decide_font2').text("비밀번호 확인을 입력해주세요").css("color", "red");
      isValid = false;
    } else {
      $('#decide_font2').text("");
    }

    if(userpw !== userpw_ch){
      $('#pwch').text("비밀번호가 일치하지 않습니다.").css("color", "red");
      isValid = false;
    } else {
      $('#pwch').text("");
    }

    if(useremail === ""){
      $('#decide_font3').text("이메일을 입력해주세요").css("color", "red");
      isValid = false;
    } else {
      $('#decide_font3').text("");
    }

    if(userphone === ""){
      $('#decide_font4').text("폰번호를 입력해주세요").css("color", "red");
      isValid = false;
    } else {
      $('#decide_font4').text("");
    }
    if(decide_font0 === "이미 아이디가 존재합니다." || decide_font0 === ""){
      alert("아이디 중복확인을 눌러주세요");
      return false;
    }
    return isValid;
  }
  function checkId(){
    var inputed = $('#userid').val();
    var decide_font0 = $('#decide_font0');
    if(inputed === ""){
      decide_font0.text("아이디를 입력해주세요");
      decide_font0.css("color","red");
      return false;
    }
    $.ajax({
      type:"GET",
      url : "checkid", //data를 checkid url에 보냄 (Controller에서 받아 처리한다, 중복이 되면 1, 아니면 0을 반환하는 함수를 구현했다.)
      data : { u_id : inputed  },//입력한 값을 u_id 에 담음
      dataType:"text",
      success : function (data){
        if(parseInt(data) === 1){
          decide_font0.text("이미 아이디가 존재합니다.");
          decide_font0.css("color","red");
        }else{
          decide_font0.text("사용 가능한 아이디 입니다.");
          decide_font0.css("color","red");
        }
      },
    });
  }


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

