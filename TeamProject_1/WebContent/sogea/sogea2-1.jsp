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
height:430px;

float: right;
margin-right: 10px;
margin-top: 70px;
padding: 10px;
background-image: url();
border: 0px solid black;
}
.sidebox2 {
width:500px;
height:480px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top: 20px;
padding: 10px;

}


.sidebox3 {
width:950px;
height:230px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top:10px;
padding: 10px;
background-image: url();
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

	&nbsp; &nbsp; &nbsp; <font size="17"><b>사명</b>
	</font>
	</p>
	<div class="sidebox1">
	<img src="../image/2222b.png" width=430px height=400px;>
	</div>
	
	<div class="sidebox2">
	<p>
	<font size="5" color="#40bb04"><b> &nbsp; &nbsp;UNHCR은 유엔으로부터</b></font>
	</p>
	<br>
	
	<p class="psize1">
	범세계적 난민보호와 난민문제의 해결을 위하여 국제 적인 행동을 이끌고 조정할 의무를 부여받았습니다.<br><br>UNHCR의 주요 목표는 난민의 권리와 복지를 지키는 것입니다. 이 목표를
	 이루<br>고자 UNHCR은 모든 사람이 비호를 신청할 수 있고, 타국에서 안전한 피난처를 
	 찾 으며, 자발적으로 귀환할 권리를 누릴 수 있도록 보장 하고자 지원하고 있습
	 니다. UNHCR은 난민들이 고국 으로 돌아가거나 다른 나라에 영구 정착하는 것
	 을 도 움으로써, 난민의 어려움에 대한 영구적 해결책을 모색합니다.<br><br>

이러한 UNHCR의 노력은 조직의 규정에 명시되어 있 고, 1951년 협약과 1967년 의정서에서도 확인되고 있 습니다. 또한 국제난민법이 있어, UNHCR의 인도적 활 동에 있어서 필수적인 원칙과 기준을 제시합니다.
<br>
<br>
<font size="5" color="#ff8000"><b>UNHCR은 인종 . 종교 . 정치적 견해 . 성별</b></font>

	
	


	</p>
	</div>
	<div class="sidebox3">
			<p class="psize1">관계없이 도움이 필요한 난민과 그 밖의 보호대상자에게 보호와 지원을 제공하는 기구입니다. UNHCR은 특히 어린이들의 특수한 상황과 필요에 주의를 기울이며, 여성의 평등한 권리를 도모하고자 노력합니다.<br><br>
			 UNHCR은 난민을 보호하고 난민 문제를 해결하고자 각국 정부, 지역기구, 국제기구, 비정부기구와 협력하여 일합니다. 기구의 도움을 받는 사람들의 의견이 그들의 삶에 영향을 미치는 기구의 결정에 반영되는 것이 마땅하므로, UNHCR은 모든 활동에서 참여의 원칙을 지키고자 애씁니다.<br><br>
			 UNHCR은 또한 난민과 강제이주민을 대표하여 활동하며, 국제 평화 유지, 국가 간 우호적 관계 발전, 인권과 근본적 자유의 존중과 같은 유엔 헌장 원칙 또한 굳게 지지합니다.
			</p>
	</div>
	
	</div>
	</div>
	</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>