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


.sidebox2 {
width:880px;
height:400px;
border: 0px solid black;
float: left;
margin-left: 50px;
margin-top: 20px;
padding: 10px;
background-image: url("../image/map2.PNG");
}

.sidebox3 {
width:860px;
height:140px;
border: 0px solid black;
float: left;
margin-left: 40px;
margin-top:10px;
padding: 10px;
}


.p1{
color: #58a5fa;
margin-top: 30px;
margin-left: 250px;

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

	 <font size="17"><b>연락처 . 찾아오시는길</b>
	</font>
	</p>
	
	
	<div class="sidebox2">
	
	</div>
	<div class="sidebox3">
	<p class="psize1">
	주소:(04523) 서울특별시 중구 무교로 6 금세기빌딩 7층   <br>
	전화:02)773-7011  팩스:02)773-7014&nbsp;<font  color="#58a5fa"><b>02)773-7272(후원문의)</b></font> <br>
         이메일:unhcr@unhcr.or.kr <font  color=" #58a5fa"><b> withyou@unhcr.or.kr (후원문의)</b></font><br>
	</p>
	<br>
	<p class="psize1">
	1호선 서울시청역 도보 5분 거리 5번 출구 나오셔서 50m 직진 후 횡단보도 건너편 건물입니다.<br>
2호선 을지로입구역 도보 2분 거리 1번 출구 나오셔서 100m 직진하시면 있는 건물입니다

	
	</p>
	</div>
</div>
</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>