<%@ page import="util.DBSql" %>
<%@ page import="util.ImgLink" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.login {
    padding: 50px 10px;
    color: #1B1B1B;
background: #ee9ca7;  /* fallback for old browsers */
background: -webkit-linear-gradient(to top, #ffdde1, #ee9ca7);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to top, #ffdde1, #ee9ca7); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}
.login_txt {
    text-align:center;
        color: #fff;
}
.login_txt header {
    font-size: 30px;
    line-height: 1.4;
    font-weight: bold;
    margin-bottom: 10px;
    
}
.a {
text-align : center;
    border: none;
    vertical-align: top;
}
#member_id{
    display: block;
    width: 251px;
    margin: 0 0 8px;
    border-radius: 2px;
    height: 40px;
    line-height: 28px;
    padding: 2px 2px 2px 7px;
    margin: 0 auto;
}
#member_passwd{
    width: 251px;
    margin: 0 0 8px;
    border-radius: 2px;
    height: 40px;
    line-height: 28px;
    padding: 2px 2px 2px 7px;
    margin: 0 auto;
        margin-top: 15px;
}
.btnLogin{
    width: 30%;
    height: 42px;
    line-height: 42px;
    background: #333333;
        display: inline-block;
    box-sizing: border-box;
    font-size: 12px;
    font-weight: bold;
    text-decoration: none;
    color: #fff;
}
.b{
width: 124px;
    position: relative;
    bottom: 635px;
    left: 290px;
}
.c{
position: relative;
    left: 650px;
    top: 100px;
}
.link{
text-decoration: none;
background-color: #e091a9;
     color: white;
     padding: 15px 25px;
     text-align: center;
     text-decoration: none;
     display: inline-block;
     float:right;
}


link:hover, link:active{
 background-color: #FF4500;
}
</style>
</head>
<body>

<%= request.getAttribute("LoginErrMsg") == null ?
		"" : request.getAttribute("LoginErrMsg")%>



<script>
function validateForm(form) {
	if(!form.user_id.value) {
		alert("아이디를 입력하세요.");
		return false;
	}
	
	if(form.user_pw.value == "") {
		alert("패스워드를 입력하세요.");
		return false;
	}
}
</script>
<div class="login">
		<div class="login_txt">
			
<header><h2>연예인 인기투표 로그인 페이지</h2></header>
		</div>
        <div class = "a">
        <form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
           <div><input id="member_id" name="user_id" fw-filter="isFill" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="아이디" value="" type="text"></div>
            <input id="member_passwd" name="user_pw" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="패스워드" fw-msg="" autocomplete="off" value="" type="password" placeholder="비밀번호">
            <p class="security">
              <img src="//img.echosting.cafe24.com/design/skin/default/member/ico_access.gif" alt="보안접속"> 보안접속             </p>
            <input class ="btnLogin" type = "submit" value="로그인하기" />
            </form>
        </div>
</div>	
<img class = "c" src="img/2.png">
<img class = "b" src="img/3.png">

</body>
</html>