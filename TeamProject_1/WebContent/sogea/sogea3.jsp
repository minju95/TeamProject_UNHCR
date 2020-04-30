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
width:420px;
height:360px;

float: right;
margin-right: 10px;
margin-top: 60px;
padding: 10px;
background-image: url("");
border: 0px solid black;
}
.sidebox2 {
width:500px;
height:400px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top: 20px;
padding: 10px;
}

.sidebox3 {
width:860px;
height:240px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top:10px;
padding: 10px;
}



.p1{
color: #58a5fa;
margin-top: 30px;

}
.psize1{
font-size:18px;

}
.p2{
margin-left: 50px;
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

	&nbsp; &nbsp; &nbsp; <font size="17"><b>조직</b> 
	</font>
	</p>
	<div class="sidebox1">
	<img src="../image/joji.PNG" width="350" height="360">
	</div>
	
	<div class="sidebox2">
	<p>
	
	<font size="5" color="#40bb04"><b>UNHCR의 운영 및 구조 </b></font>
    <br>
	<br>
	
	<p class="psize1">
	유엔난민기구는 유엔총회 및 경제사회위원회(ECOSOC)의 관리하에 있습니다. 94개 회원으로 구성된 UNHCR 집행위원회는 2년 동안의 프로그램 및 이에 따른 예산을 승인합니다. 프로그램 및 예산안은 유엔총회에서 지명된 고등판무관이 제출합니다.
	</p><br>
	<p class="psize1">
	유엔난민기구의 임무는 1950년 UNHCR 헌장에 정의되어 있습니다. 2003년 유엔총회는 "난민문제가 종결될 때까지"로 UNHCR의 임무를 연장했습니다. 고등판무관은 매년 ECOSOC과 유엔총회에 UNHCR의 업무에 대해 보고합니다.
	</p>
	<br>
	<p class="psize1">
	기구의 장으로써 고등판무관은 UNHCR의 방향성과 관리에 대해 책임을 집니다. 고등판무관은 부고등판무관 및 보호 및 운영 담당 판무관보의 도움으로 UNHCR의 업무에 대해 방향성을 제시합니다.
	</p>
	</div>
	<div class="sidebox3">
	<p class="psize1">UNHCR의 10,900명 이상 직원들은 자국에서 또는, 해외 130개국에서 근무합니다. 대부분 UNHCR의 활동은 현장에서 이루어집니다. 국제적 활동이 매우 복잡해져 신입직원 모집, 위험한 상황에서 직원들의 안위 보전, 의료품, 식품의 조달, 항공운송 등 다양한 분야를 포괄합니다. 주로 제네바 본부에 위치하는 각 부서는 운영, 보호, 대외협력, 인적자원, 재무 등 중요한 부문을 관장합니다. 다수의 지역 사무소는 해외 사무소 및 본부간 연락을 담당합니다.</p><br>
	<p class="psize1">현장에서 UNHCR의 핵심업무는 지역 사무소, 각국대표부, 현장 사무소 등에서 관리됩니다. 고등판무관의 대표부는 UNHCR이 활동하는 국가에 존재하며, 다수의 지역 대표부가 운영되고 있습니다.</p>
	</div>
</div>
</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>