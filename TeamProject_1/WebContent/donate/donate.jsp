<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userid = (String)session.getAttribute("SessionUserid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">
<title>후원하기</title>
</head>
<script>
<%@ include file="../js/leftmenu.js"%>
</script>

<style>
.text_div {
	width:100%;
	height:450px;
}
.p1 {
	font-size:30px;
	color:#0072bc;
}
.p1-1{
	font-weight:bold;
	font-size:15px;
	color:#0072bc;
}
.p2 {
	font-size:30px;
	color:#d60000;
}
.p2-1{
	font-weight:bold;
	font-size:15px;
	color:#d60000;
}
.space {
	margin-top:30px;
}
.img_div {
	text-align:center;
	height:300px;
}
.img_div_1 {
	width:28%;
	height:100%;
	float:left;
	margin-left:38px;
	border:0px solid #ccc;
}
.donate_img {
	vertical-align:top;
	width:214px; 
	height:137px;
}
.donate_button {
	width:80px;
	height:25px;
}
.btn {
	line-height:34px;
	width:110px;
	height:35px;
	display:inline-block;
	background-color:#888888;
	color:white;
	font-weight:bold;
	border-radius:10px;
}
</style>
<script>
function popup(num) {
	var width = "412";
	var height = "640";
	var url = "donateWrite.jsp?where="+num;
	var name = "후원 하기";
	var left = Math.ceil((window.screen.width - width)/2);
	var top = Math.ceil((window.screen.height - height)/2);
	window.open(url,'name',' width='+width+',height='+height+',left='+left+',top='+top+' ');
	return false;
}
</script>
<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id="container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<%@ include file = "../include/rightmenu.jsp" %>
<div>
<div id="content2">
	<p style="font-size:40px; margin-bottom:40px;">
	후원하기
	</p>
	<div class="text_div">
		<div style="height:150px;">
		<p class="p1">
		가장 필요한 곳에
		</p>
		<p class="space">
		유엔난민기구는 난민, 비호 신청자, 국내 실향민, 무국적자 등의 생존에 필수적인 식수, 
		위생시설, 보건의료 서비스, 임시거처, 가정용품, 식품 등의 긴급 지원은 물론, 난민 등록, 
		비호신청 지원 및 자문, 교육, 법률상담 등을 제공합니다.
		</p>
		</div>
		<div class="img_div">
			<div class="img_div_1">
				<a href="popup.html" onclick="popup('1-1'); return false;"><img class="donate_img" src="../image/1-1.jpg"></a>
				<a href="popup.html" onclick="popup('1-1'); return false;"><p class="p1-1">
				난민 아동 교육 캠페인
				</p></a>
				<a href="popup.html" onclick="popup('1-1'); return false;"><p style="height:100px;"><br>
				이미 너무 많은 것을 잃은 난민 아이들에게 교육은 미래의 꿈을 되찾아 줄 중요한 해결책입니다
				</p></a>
			<a href="#" class="btn" onclick="popup('1-1'); return false;">후원 하기</a>
				
			</div>
			<div class="img_div_1">
				<a href="popup.html" onclick="popup('1-2'); return false;"><img class="donate_img" src="../image/1-2.jpg"></a>
				<a href="popup.html" onclick="popup('1-2'); return false;"><p class="p1-1">
				기후변화와 난민 캠페인
				</p></a>
				<a href="popup.html" onclick="popup('1-2'); return false;"><p style="height:100px;"><br>
				1초에 1명
				기후 변화로 피난길에 
				오르는 사람들
				</p></a>
			<a href="#" class="btn" onclick="popup('1-2'); return false;">후원 하기</a>
				
			</div>
			<div class="img_div_1">
				<a href="popup.html" onclick="popup('1-3'); return false;"><img class="donate_img" src="../image/1-3.jpg"></a>
				<a href="popup.html" onclick="popup('1-3'); return false;"><p class="p1-1">
				안전을 찾아가는 여정 20억km
				</p></a>
				<a href="popup.html" onclick="popup('1-3'); return false;"><p style="height:100px;"><br>
				분쟁과 폭력을 피해
				피난길에 오른 난민들에게
				지금 도움이 필요합니다
				</p></a>
			<a href="#" class="btn" onclick="popup('1-3'); return false;">후원 하기</a>
			</div>

		</div>
	</div>
	<div class="text_div">
		<div style="height:150px;">
		<p class="p2">
		긴급 구호
		</p>
		<p class="space">
		유엔난민기구는 72시간 이내에 60만명 이상을 지원하는 것을 목표로 전 세계 긴급구호 현장에서 활동합니다. 
		긴급구호 발생 시 전 세계 7개 물류 창고의 전략적 네트워크를 바탕으로 대규모 사태에 효율적이고 발빠르게 대응하고 있습니다.
		</p>
		</div>
		<div class="img_div">
			<div class="img_div_1">
				<a href="popup.html" onclick="popup('2-1'); return false;"><img class="donate_img" src="../image/2-1.jpg"></a>
				<a href="popup.html" onclick="popup('2-1'); return false;"><p class="p2-1">
				베네수엘라 긴급구호
				</p></a>
				<a href="popup.html" onclick="popup('2-1'); return false;"><p style="height:100px;"><br>
				매일 5천 명, 340만 베네수엘라 난민들이 피난길에 오릅니다
				</p></a>
			<a href="#" class="btn" onclick="popup('2-1'); return false;">후원 하기</a>
				
			</div>
			<div class="img_div_1">
				<a href="popup.html" onclick="popup('2-2'); return false;"><img class="donate_img" src="../image/2-2.jpg"></a>
				<a href="popup.html" onclick="popup('2-2'); return false;"><p class="p2-1">
				예멘 긴급구호 캠페인
				</p></a>
				<a href="popup.html" onclick="popup('2-2'); return false;"><p style="height:100px;"><br>
				많은 예멘 난민들이 머무는 지부티와
				말레이시아를 방문한 정우성 친선대사가
				그들의 이야기를 전합니다
				</p></a>
			<a href="#" class="btn" onclick="popup('2-2'); return false;">후원 하기</a>
				
			</div>
			<div class="img_div_1">
				<a href="popup.html" onclick="popup('2-3'); return false;"><img class="donate_img" src="../image/2-3.jpg"></a>
				<a href="popup.html" onclick="popup('2-3'); return false;"><p class="p2-1">
				이다이 긴급구호 캠페인
				</p></a>
				<a href="popup.html" onclick="popup('2-3'); return false;"><p style="height:100px;"><br>
				사이클론 이다이로 삶의 터전을 잃고
				절망에 빠진 사람들이 당신의 도움을
				기다립니다
				</p></a>
			<a href="#" class="btn" onclick="popup('2-3'); return false;">후원 하기</a>
				
			</div>
		</div>
	</div>

	</div>


</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>