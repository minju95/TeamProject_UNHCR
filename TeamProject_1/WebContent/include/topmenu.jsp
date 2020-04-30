<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<style>
.tm_home_div {
position:absolute; 
margin-left:17%; 
width:171px; 
height:64px; 
fload:left; 
padding-top:10px;
}
</style>
<body>
<div id="header">
<!--<a href="../main/main.jsp"><img src="../image/unhcr.png" width=60px height=100%></a> -->
</div>
<div id="nav">
<div class="tm_home_div">
<a href="../main/main.jsp"><img src="../image/main_home.png"></a>
</div>
<ul class="mainmenu">
	<li><a href="../sogea/sogea.jsp?top=sogea">소개</a>
		<ul class="submenu">
			<li><a href="../sogea/sogea.jsp?top=sogea">UNHCR 이란?</a></li>
			<li><a href="../sogea/sogea2.jsp?top=sogea">역사와임무</a></li>
			<li><a href="../sogea/sogea3.jsp?top=sogea">조직</a></li>
			<li><a href="../sogea/sogea4.jsp?top=sogea">연락처 및 위치</a></li>
			<li><a href="../sogea/sogea5.jsp?top=sogea">친선대사 정우성</a></li>
		</ul>
	</li>
	<li><a href="../volunteer/intro.jsp?top=volunteer">봉사활동</a>
		<ul class="submenu">
			<li><a href="../volunteer/intro.jsp?top=volunteer">봉사활동 안내</a></li>
			<li><a href="../volunteer/notice.jsp?top=volunteer">모집 공고</a></li>
			<li><a href="../volunteer/adminList.jsp?top=volunteer">관리자 게시판</a></li>
		</ul>
	</li>
	<li><a href="../donate/donate.jsp?top=donate">후원</a>
		<ul class="submenu">
			<li><a href="../donate/donate.jsp?top=donate">후원하기</a></li>
			<li><a href="../donate/donate_info.jsp?top=donate">후원정보</a></li>
			<li><a href="../member/memberInfo.jsp?top=donate">회원정보</a></li>
		</ul>
	</li>
	<li><a href="../board/mSub1.jsp?top=board">고객센터</a>
		<ul class="submenu">
			<li><a href="../board/mSub1.jsp?top=board">통합게시판</a></li>
			<li><a href="../faq1/faqSub1.jsp?top=board">FAQ</a></li>
		</ul>
	</li>
</ul>
</div>
</body>
</html>