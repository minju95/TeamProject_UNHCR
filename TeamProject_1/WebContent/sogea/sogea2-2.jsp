<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">
</head>
<script>
<%@ include file="../js/leftmenu.js"%>
</script>
<style>


.sidebox1 {
width:310px;
height:210px;
border: 0px solid black;
float: right;
margin-left: 10px;
margin-top:0px;
padding: 10px;
background-image: url();
}
.sidebox2 {
width:965px;
height:320px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top: 20px;
padding: 10px;

}


.sidebox3 {
width:965px;
height:410px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top:10px;
padding: 10px;
background-image: url();
}


.p1{
color: #58a5fa;
margin-top: 30px;

}
.psize1{
font-size:18px;

}


</style>
<body>

<%@ include file = "../include/new_topmenu.jsp" %>
<div id = "container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<%@ include file = "../include/rightmenu.jsp" %>
<div>
<div id="content2">

<p class="p1">

	&nbsp; &nbsp; &nbsp; <font size="17"><b>UNHCR 규정</b>
	</font>
	</p>
	
	
	<div class="sidebox2">
<p><font size="5" color="#40bb04"><b>1951년 1월 1일 UNHCR 설립 결정</b></font></p><br>
<p class="psize1">유엔 총회는 1949년 12월 3일 결의문 319 (Ⅳ)에서, 1951년 1월 1일부로 난민고등판무관 사무소를 설립할 것을 결 정하였습니다. 유엔 난민고등판무관 사무소 규정은 결의문 428 (Ⅴ)의 부속서로서 1950년 12월 14일 유엔 총회에서 채택되었습니다. 유엔 총회는 결의문에서 유엔 회원국 정부가 사무소의 권한에 속하는 난민 관련 임무를 수행할 때 고등판무관과 협력할 것을 요청하였습니다. 이 규정에 따르면, 고등판무관의 임무는 인도적, 사회적이며 전적으로 비정치적입니다. 고등판무관의 임무는 이 규정과 유엔 총회의 후속 결의문에 따라 규정됩니다.
</p><br>
<p>
<font size="5" color="#ff8000"><b>난민 고등판무관은 경제사회이사회를 통하여 유엔총회에 연차 보고를 합니다.</b></font></p><br>
<p class="psize1">
이 규정 제4항에 의하여, 난민에 관한 자문위원회가 경제사회 이사회(1951년 9월 10일 결의문 393 (XIII) B)에 의하여 설치되었고, 이후 이 위원회는 유엔난민기금(UNREF) 집행위원회로 재구성되었습니다. (1954년 10월 21일 유엔총회 결의문 832 (IX)에 의하여 채택된 1955년 3월 31일 경제사회이사회 결의문 565 (XIX)).
</p>
	</div>
	<div class="sidebox3">
	<div class="sidebox1">
	<img src="../image/unhcrgu.PNG" width=320px height=220px;>
	</div>
	<p class="psize1">
	유엔난민기금 집행위원회는 1958년 고등판무관 업무계획 집행위원회로 대체되었습니다.
	 (1957년 11월 26일 유엔총회 결의문 1166 (XII) 및 1958년 4월30일 경제사회이사회 결의
	 문 672 (XXV)). 위원회의 권 한으로 집행위원회는 고등판무관 사무소의 실질적인 원조사
	 업을 승인하고 감독하며, 이 규정에 따른 임무를 수행 함에 있어서 요청이 있으면 고등판
	 무관을 자문하는 역할을 하고 있습니다.
	</p>
	<br>
	
	<p  class="psize1">
	최초 집행위원회는 25개국으로 구성되었습니다. 1963년에 위원국 수가 30개국으로 늘었
	고(1963년 12월 12일 유엔 총회 결의문 1958 (XVIII)), 1967년에는 가능한 한 폭넓은 지리
	적 안배를 위해 31개국으로 늘어났습니다. (1967년 12월 11일 유엔총회 결의문 2294
	(XXII)). 고등판무관 사무소는 처음 에는 3년간 존속될 예정으로 설치되었습니다.
	</p>
	<br>
	
	<p  class="psize1">
	그 후 1953년 10월 23일 유엔총회 결의문 727 (VIII), 1957년 11월 26일 결의문 1165 (XII)
	1962년 12월 7일 결의문 1783 (XVII), 1967년 12월11일 결의문 2294 (XXII), 1972년 12월
	12일결의문 2957 (XXVII), 1977년 12월 8일 결의문 32/68, 1982년 12월 18일 결의문 37/196, 1987년 12월 7일 42/108, 1992년 12월 16일 결의문 47/104 등으로 임기가 5년씩 연장되 었고, 난민문제가 완전히 해결될 때까지 계속 업무를 수행하도록 2003년 승인을 받았습니다.
	</p>
	
	
	
	</div>
	</div>
	</div>
	</div>
	
<%@ include file = "../include/footer.jsp" %>
</body>
</html>