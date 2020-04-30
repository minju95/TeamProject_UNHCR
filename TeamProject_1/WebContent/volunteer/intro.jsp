<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원봉사 - 모집 공고</title>
</head>
<link rel="stylesheet"href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">

<script>
<%@ include file="../js/leftmenu.js"%>
</script>

<style>
.title{
width: 400px;
height: 40px;
padding: 20px;
margin-top: 50px;
padding: 5px;

}

.sub {
width: 300px;
height: 800px;
margin-top: 20px;
margin-bottom: 40px;
float:left;
margin-left: 30px;
text-align: justify;

}

.picture {
width: 300px;
height: 250px;
float: left;
}

.sub > .subTitle {
width: 300px;
positon: relative;
margin-top: 280px;
padding-bottom: 10px;
margin-bottom: 20px;
border-bottom: 1px solid  #0072bc;
color:  #0072bc;
}

.sub > .subContent {
width: 300px;
font-size: 15px;
line-height: 2.0;
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
	<h1>자원봉사</h1>
	</div>
	
	<div class="sub">
		<img class="picture" src="translation.GIF">
		<div class="subTitle">
		<h2>1. 번역 봉사</h2></div>
		
		<div class="subContent">
		<p>
			E-mail을 통해 본부나 지역 사무소에서 오는 문서를 한글로 번역하거나 후원자가 아동에게 보내는 편지를 영어로 번역하는 플랜티어입니다.
		</p><br>
		
		<p>
			1년에 2번 상·하반기 모집하고 있으며, 모집기간 이외에는 신청을 받지 않습니다. (모집공지는 공지사항에 업데이트 됩니다.)
		</p>
		</div>
	</div>
	
	<div class="sub">
		<img class="picture" src="office.GIF">
		<div class="subTitle">
		<h2>2. 사무 봉사</h2></div>
		
		<div class="subContent">
		사무실에서 번역 및 사무를 도와주는 플랜티어입니다. 3개월 이상 주 1회(하루 5시간 이상) 이상 봉사하게 됩니다.
		<br><br>
		- 일반사무: 아동자료 준비, DB 입력, 자료 발송<br>
		- 번역: 플랜의 후원자들에게 보내지는 문서 번역, 웹사이트 및 플랜코리아가 발간하는 자료 번역<br>
		- 봉사가능시간: 월~금 9시~18시<br>
		</div>
	</div>
	
	<div class="sub">
		<img class="picture" src="talent.GIF">
		<div class="subTitle">
		<h2>3. 재능 봉사</h2></div>
		
		<div class="subContent">
		<p>
		본인이 가진 다양한 재능을 활용하여 플랜의 업무를 도와주는 플랜티어입니다.
		</p><br>
		<ul style="list-style: inside;">
			<li>- 사진, 영상촬영 및 편집</li>
			<li>- 웹, 문서편집 디자인 등</li>
			<li>- 각종 이벤트 전문가: 페이스 페인팅, 캐리커처 등</li>
		</ul>
		
		</div>
	</div>

	
</div> 
</div>
</div>

<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>

</div>
</body>
</html>