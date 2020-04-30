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
width:800px;
height:250px;
border: 0px solid black;
float: center;
margin-left: 10px;
margin-top: 20px;
padding: 10px;
background-image: url("");
}
.sidebox2 {
width:800px;
height:100px;
float: center;
margin-left: 10px;
margin-top:10px;
padding: 10px;

border: 0px solid black;
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

	&nbsp; &nbsp; &nbsp; <font size="17"><b>UNHCR 로고</b>
	</font>
	</p>
	
	
	<div class="sidebox1">
<img src="../image/akak.PNG" width="800" height="260">
	</div>
	
	<div class="sidebox2">
	<p>
	<font size="5" color="#ff8000"><b>&nbsp; UNHCR 의 공식 로고에서 월계수잎 모양은</b></font>
	</p>
	
	<br>
	<p >
	<font size="5"><b> &nbsp;&nbsp;UNHCR이 유엔기구임을, 두 손은 보호를, 중앙의 사람 형상은 <br>&nbsp;&nbsp;UNHCR의<font size="5" color="#40bb04"> 보호대상자</font>를 의미합니다.</b></font>
	</p>
	</div>
</div>
</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>