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
width:350px;
height:400px;

float: right;
margin-right: 10px;
margin-top: 20px;
padding: 10px;
background-image: url("");
border: 0px solid black;
}
.sidebox2 {
width:580px;
height:400px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top: 20px;
padding: 10px;

}
.sidebox3 {
width:520px;
height:300px;
float: right;
margin-right: 10px;
margin-top:30px;
padding: 10px;

border: 0px solid black;
}
.sidebox4 {
width:410px;
height:320px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top:10px;
padding: 10px;
background-image: url("");
}


#footer {
width: 900px;
height: 50px;
border: 1px solid black;
margin: 0 auto;
padding-left: 5px;
padding-top: 5px;
text-align: center;
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

	&nbsp; &nbsp; &nbsp; <font size="17"><b>역사와 임무</b>
	</font>
	</p>
	<div class="sidebox1">
	<img src="../image/unhc-1.PNG" width=320px height=410px;>
	</div>
	
	<div class="sidebox2">
	<p>
	<font size="5" color="#40bb04"><b>유엔난민기구 (UNHCR) 의  역사는 </b></font>
	</p>
	<br>
	
	<p class="psize1">
	러시아 혁명 이후 발생한 난민 히틀러 치하의 독일에서 발생한 난민들을 비롯 2차
	세계대전 이후 발생한 약 120만 명의 유럽 난민문제를 해결하기 위해, 유엔 의
	전신인 국제연맹(League of Nations)은 고등판무관(HighCommissioner)을 임명
	하고 난민문제를 초국가적 문제로 다루기 시작하였습니다.
	</p><br>
	<p class="psize1">
	이러한 노력의 연장선상에서, 국제연맹의 뒤를 이어 탄생한 국제연합 (United 
	Nations)은국제연합 구호 및 재건기구(UNRRA,United Nations Relief and
	Rehabilitation Administration)와 국제난민기구(IRO,International Refugee
	 Organization)를 각각 1944년,1947년에 설치하여 긴급구호,법적 보호를
         통해 난민문 제를 해결하고자 노력하였습니다. 그러나 IRO는 시대적 정치 상황과 
         맞물려 여러 국가로부터 충분한 지원을 얻지 못하였고 유엔 은 새로운 난민기구의
          필요성을 주장하기 시작하였습니다.그 결과 1949년 12월 유엔총회
           결의문 319(V)를 통해 유엔총회의 보조 기관으로 UNHCR이 설립되었습니다.
	</p>
	</div>
	
	<div  class="sidebox3" >
	<p><font size="5" color="#ff8000"><b>UNHCR 의 임무는</b></font></p><br>
	<p class="psize1">비정치적, 인도적인 차원에서 난민들에게 국제적 보호를 제공하고, 이들을 위한 영구적 해결책을 모색하는 것입니다. UNHCR의 핵심 임무는 1950년 UN총회 결의로 만들어진 UNHCR 사무소 규정에서 처음 규정되었고, 그후 UN총회 및 경제사회이사회(ECOSOC)의 결의문에 의해 확대되었습니다.
	</p>
	<br>
<p class="psize1">
이 규정에 의해 다른 유엔기구로부터 도움을 받고 있는 보호대상자들은 UNHCR의 임무 밖에 있습니다. UNHCR의 임무는 유엔총회에서 3년마다 연장되어 오다가, 2003년에 난민문제가 완전히 해결될 때까지 계속 업무를 수행하도록 승인을 받았습니다.</p>
	</div>
	<div class="sidebox4">
	<img src="../image/unhcr-2.png" width=300px height=300px;>
	</div>
</div>
</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>