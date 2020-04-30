<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원 완료 메세지</title>
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
padding: 10px;
line-height: 2.0;
}
.blank {
width: 800px;
height: 100px;
margin: 0 auto;
border-left: 1px solid black;
border-right: 1px solid black;
border-top: 1px solid black;
padding: 10px;
border-top-right-radius: 10px;
border-top-left-radius: 10px;
background: #0072bc;

}

.message {
width: 800px;
height: 200px;
margin: 0 auto;
text-align: center;
line-height: 2.2;
font-size: 28px;
padding: 10px;
border-left: 1px solid black;
border-right: 1px solid black;
background: #0072bc;
color: white;
}
.button_box {
width: 800px;
height: 100px;
margin: 0 auto;
text-align: center;
padding: 10px;
border-left: 1px solid black;
border-right: 1px solid black;
border-bottom: 1px solid black;
border-bottom-left-radius: 10px;
border-bottom-right-radius: 10px;
background: #0072bc;
}
.button {
width: 100px;
height: 50px;
font-size: 25px;
border: 1px solid black;
border-radius: 5px;
cursor: pointer;
}
</style>

<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id="container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<%@ include file = "../include/rightmenu.jsp" %>

<div>

<div id="content2">
	
	<div class="title">
		<h1>자원봉사 참여</h1>
		전국각지에서 자원봉사자 여러분의 참여를 기다립니다.
	</div>
	<div class="blank"></div>
	<div class= "message">
		<p>
		자원봉사 신청이 완료되었습니다.<br>
		참여해주셔서 감사합니다.
		</p>
	</div>
	<div class="button_box"><input type="button" value="확인" onclick="location='../main/main.jsp'" class="button"></div>
			
</div>
</div>
</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>