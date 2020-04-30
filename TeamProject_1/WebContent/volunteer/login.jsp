<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String prev_url = request.getParameter("prev_url");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원봉사 - 모집 상세보기</title>
</head>
<link rel="stylesheet"href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">

<script>
<%@ include file="../js/leftmenu.js"%>
</script>

<style>
a {
text-decoration: none;
color: black;
}
.title {
width: 800px;
height: 100px;
margin: 0 auto;
line-height: 2.0;
margin-bottom: 20px;
}

.box {
width: 800px;
height: 400px;
margin: 0 auto;
line-height: 2.0;
}

.img {
width: 380px;
height: 300px;
float: left;
margin-top: 50px;


}
.login{
width: 380px;
height: 400px;
float: right;
}


.id{
height: 50px;
text-align: center;
margin-top: 100px;
}
.password{
height: 50px;
text-align: center;
}
.search {
height: 50px;
text-align: right;
padding-right: 60px;
}
.button {
height: 50px;
text-align: center;
}
.textbox {
width: 200px;
height: 20px;
padding: 5px;
}
.loginBtn {
width: 300px;
height: 50px;
font-size: 17px;
font-weight: bolder;
}
</style>

<script>
function fn_click() {
var f = document.frm;
	if(f.userid.value == "") {
	alert("아이디를 입력해주세요.");
	return false;
	}
	if(f.pass.value == "") {
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	f.submit();
}
</script>


<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id="container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<div>

	<div id="content">
		<div class="title">
		<h1>로그인</h1>
		홈페이지의 다양한 후원자 서비스를 경험하세요.
		</div>
		
		<form name="frm" method="post" action="../member/loginSub.jsp?prev_url=<%=prev_url%>">
		<div class="box">
			<img src="unhcr_logo.JPG" class="img">
			<div class="login">
				<div class="id">
					아이디&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="userid" class="textbox">
				</div>
				<div class="password">
					비밀번호&nbsp;
					<input type="password" name="pass" class="textbox">
				</div>
				<div class="search"><a href="#">아이디/비밀번호 찾기</a></div>
				<div class="button">
					<input type="submit" name="login" class="loginBtn" value="로그인" onclick="fn_click()">
					</div>
			</div>
		</div>
		</form>
	</div> 	
	</div>
	</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>