function login_check() {
    var userid = document.getElementById("id");
    var userpw = document.getElementById("pw");
        if (userid.value == "") {
        var id_txt = document.querySelector(".err_id");
        id_txt.textContent = "아이디를 입력하세요.";
        userid.focus();
        return false;
    }
    if (userpw.value == "") {
        var pw_txt = document.querySelector(".err_pw");
        pw_txt.textContent = "비밀번호를 입력하세요.";
        userpw.focus();
        return false;
    }
}
