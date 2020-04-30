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
height:280px;

float: right;
margin-right: 10px;
margin-top: 20px;
padding: 10px;
background-image: url("");
border: 0px solid black;
}
.sidebox2 {
width:965px;
height:130px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top: 20px;
padding: 10px;
}
.sidebox3 {
width:330px;
height:213px;
float: right;
margin-right: 10px;
margin-top:10px;
padding: 10px;
background-image: url("");
border: 0px solid black;
}
.sidebox4 {
width:600px;
height:450px;
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

	&nbsp; &nbsp; &nbsp; <font size="17"><b>친선대사 정우성 임명</b>
	</font>
	</p>
	
	<div class="sidebox2">
	<p>
	<font size="5" color="#40bb04"><b>2014년 5월 15일 유엔난민기구 한국대표부는 배우 정우성<br>씨를 명예사절로 임명했습니다. </b></font>
	</p>
	<br>
	<p class="psize1">
	2014년 5월 15일 유엔난민기구 한국대표부는 배우 정우성 씨를 기구의 첫 한국인 명예사절로 임명했습니다. 임명 후 정우성 씨는 유엔난민기구의 대중 및 언론 홍보와 모금을 위한 활동에 적극적으로 참여하여 왔습니다.
	</p><br>
	<p class="psize1">
	
	</p>
	</div>
	
	<div  class="sidebox3" >
<img src="../image/jung1.PNG" width=340px height=220px;>
	</div>
	<div class="sidebox4">
	<p class="psize1">2014년 11월 정우성 씨는 유엔난민기구와의<font size="4" color="#ff8000"><b> 첫번째 미션</b></font>지인 네팔로 떠나 부탄, 소말리아, 파키스탄 등 다양한 곳에서 온 난민들을 만나 교감하였습니다.<br><br> 2015년 5월 정우성 씨는 남수단으로<font size="4" color="#ff8000"><b> 두번째 미션</b></font>을 떠났으며, 현지 언론 및 한국 언론을 통해 난민의 어려움과 유엔난민기구의 활동에 대한 본인의 소신을 밝혀 한 단계 성장한 모습을 보여주었습니다.
	<br><br>
유엔난민기구는 두번의 미션을 통해 정우성 씨가 보여준 난민에 대한 진중한 고민과 결심을 높이 평가하여<br><br><font size="4" color="#40bb04"><b> 2015년 6월 17일그를 기구의 공식 친선대사로 승격하였습니다.</b></font></p><br>
<p class="psize1">
유엔난민기구는 정우성 씨의 배우로서의 인지도와 난민에 대한 애정이 전 세계 6천 만 명에 달하는 난민 및 실향민을 보호하고 이들에게 안전한 피난처를 찾아주는 데 큰 도움이 될 것으로 기대하고 있습니다.<br><br>

정우성 유엔난민기구 친선대사의 활동 관련 사진 자료는 하단의 폴더에서 확인하실 수 있습니다.
</p>
	</div>
	
	<div  class="sidebox3" >
<img src="../image/jung2.PNG" width=340px height=220px;>
	</div>
	</div>
	</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>