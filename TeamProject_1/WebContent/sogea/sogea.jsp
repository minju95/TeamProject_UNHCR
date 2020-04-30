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
width:400px;
height:250px;
border: 0px solid black;
float: right;
margin-right: 10px;
margin-top: 20px;
padding: 10px;
background-image: url("../image/unhcr1t.png");
}
.sidebox2 {
width:530px;
height:250px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top: 20px;
padding: 10px;
}
.sidebox3 {
width:540px;
height:245px;
float: right;
margin-right: 10px;
margin-top:10px;
padding: 10px;

border: 0px solid black;
}
.sidebox4 {
width:385px;
height:245px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top:10px;
padding: 10px;
background-image: url("../image/unhcr2.PNG");
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

	&nbsp; &nbsp; &nbsp; <font size="17"><b>UNHCR 이란?</b>
	</font>
	</p>
	<div class="sidebox1">
	</div>
	
	<div class="sidebox2">
	<p>
	<font size="5" color="#40bb04"><b>유엔난민 기구는 전세계적으로 난민을 보호할</b></font><font size="4"><b>임무를</b></font>
	
	<font size="4"><b>부여받은</b></font><font size="5" color="#40bb04"><b>UN</b></font><font size="4"><b>입니다.</b></font>
	</p>
	<br>
	<p  class="psize1">
	1949년 12월 3일 유엔총회에서 창설된 UNHCR은 난
	민을 보호하고 난민 문제를 해결하기 위해 국제적
	인 조치를 주도하고 조정할 권한을 부여받았습니
	다. UNHCR의 활동은 난민의 권리와 복지를 보호하
	는 데 주요 목표를 두고 있습니다. 누구나 비호를 
	신청할 권리를 누리고, 자발적 본국 귀환, 현지 동
	화 혹은 제3국 재정착의 방법으로 다른 나라에서 안
	전한 피난처를 보장 받을 수 있도록 UNHCR 은 앞
	장서고 있습니다.
	</p>
	</div>
	<div class="sidebox3">
	<p>
	<font size="5" color="#ff8000"><b>1954년.1981년 두차례 노벨평화상</b></font><font size="4"><b>을
	 수상하였습니다.</b></font>
	</p>
	<br>
	<p class="psize1">
	유엔난민기구는 1951년 1월 33명의 직원과 미화 30만 불의 예산으로 출범한 이래 지난 60여 년 동안 국제적 활동을 이 끄는 단체로 거듭났습니다.
	</p>
	<br>
	<p class="psize1">
	2019년 현재 134개국에서 근무하는 16,803명의 직원들이 7,080만명에 달하는 난민과 보호대상자를 돕고 있으며 난민보호 의 공로로 1954년, 1981년 두 차례 노벨평화상을 수상하였습니다.
	</p>
	</div>
	<div class="sidebox4">
	
	</div>
	</div>
	</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>