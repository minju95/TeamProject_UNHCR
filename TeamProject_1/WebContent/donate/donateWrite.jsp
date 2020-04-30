<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>

<%
String userid = (String)session.getAttribute("SessionUserid");
if(userid == null) {
%>
	<script>
	var prev_url = opener.window.location.href;
	alert("로그인 후 이용 가능합니다.");
	self.close();
	opener.location = "../volunteer/login.jsp?prev_url="+prev_url;
	</script>
<%
	return;
}
String where = request.getParameter("where");
String[] title = where.split("-");

String msg = "";

if("1".equals(title[0])) msg = "가장 필요한 곳에";
else if("2".equals(title[0])) msg ="긴급 구호";
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
.dw_div1 {
	width:400px;
	height:600px;
	background-color:#0072bc;
	color:#fff;
	font-weight:bold;
	margin:5px;
}
.dw_div1_title {
	font-size:25px;
	color:#faeb00;
}
.dw_div1-1 {
	width:135px;
	height:200px; 
	font-size:14px;
	float:left; 
	margin-top:10px;
}
.dw_div1-2 {
	width:258px; 
	height:200px; 
	float:right; 
	margin-top:10px;
}
.dw_p1 {
	height:20%;
	color:#fff;
	font-size:35px;
	text-align:center;
	line-height:4.0;
}
.dw_p2 {
	font-size:15px;
	color:#fff;
	text-align:left;
}
.dw_div2 {
	height:30%;
	font-size:15px;
	text-align:center;
	margin-top:10px;
	padding:30px;
}
.btn {
	margin-top:20px;
	line-height:30px;
	width:100px;
	height:30px;
	display:inline-block;
	background-color:#faeb00;
	color:black;
}
</style>
<script>
function fn_click(money) {
	var money = document.getElementById(money).value;
	var txt = document.getElementById('txt');
	if(money != null || money != "") {
		if(money == "money") {
			txt.disabled=false;
			txt.placeholder="숫자만 입력하세요.";
		}
		else {
			txt.disabled=true;
			txt.placeholder="";
			txt.value="";
		}
	}
}

function numberFormat(inputNumber) { //숫자 세자리마다 콤마 찍기
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function fn_donate() {
	var f = document.getElementsByName("money");
	//f[0], f[1] ... f[6]
	
	var money_value = "";
	for(var i=0; i<f.length; i++) {
		if(f[i].checked) {
			if(f[4].checked) {
				money_value = f[5].value.trim();
			} else {
				money_value = f[i].value;
			}
		}
	}
	if(money_value.trim() == "") {
		alert("금액을 입력해주세요.");
		return false;
	}
	money_value = numberFormat(money_value);
	var cf_msg = "기금명 : <%=msg%> \n"
			   + "후원 금액 : " + money_value + "원\n"
			   + "후원 하시겠습니까?";
	if(confirm(cf_msg)) {
		money_value = money_value.replace(/,/g,"");
		location = "donateWriteSave.jsp?money="+money_value+"&name=<%=title[0]%>";
	}
}
</script>
<body>

<div class="dw_div1">
	<p class="dw_p1">
	<%=msg%>
	</p>
	<div style="height:50%;">
		<div class="dw_div1_title">
	<%	 if("1-1".equals(where)) {%>난민 아동 교육 캠페인<%}
	else if("1-2".equals(where)) {%>기후 변화와 난민 캠페인<%}
	else if("1-3".equals(where)) {%>안전을 찾아가는 여정 20억km<%}
	else if("2-1".equals(where)) {%>베네수엘라 긴급구호<%}
	else if("2-2".equals(where)) {%>예멘 긴급구호 캠페인<%}
	else if("2-3".equals(where)) {%>이다이 긴급구호 캠페인<%}
	%>
		</div>
		<div class="dw_div1-1">
	<%	 if("1-1".equals(where)) { 
			%>
			<h3>0일</h3>
			 지난해 350만 난민 아이들의 연간 수업일수
			<h3>100명 중 1명</h3>
			고등학교에 다닐 수 있는 
			난민 아이의 수
			<%
		}
	else if("1-2".equals(where)) {
			%>
			<h3>1초에 1명</h3>
			기후변화로 집을 떠나는사람들
			<h3>1년에 2천 5백만 명</h3>
			서울 전체 인구의 두 배가 넘는 사람들이
			기후변화로 인해
			고향을 떠나야만 했습니다
			<%
		}
	else if("1-3".equals(where)) {
			%>
			<h3>20억 킬로미터</h3>
			매년 난민들이 안전한 곳을
			찾아 떠난 총 거리
			<%
		}
	else if("2-1".equals(where)) {
			%>
			<h3>매일 5천 명</h3>
			피난길에 오르는 베네수엘라 난민들의 수
			<%
		}
	else if("2-2".equals(where)) {
			%>
			여러분의 관심으로
			예멘을 비롯한
			긴급구호 지역에서
			가장 도움이 필요한
			사람들에게
			긴급구호 물품이 전달될 수 있습니다
			<%
		}
	else if("2-3".equals(where)) {
			%>
			<h3>남반구 최악의 열대성 폭풍 사이클론</h3>
			모잠비크, 짐바브웨, 말라위 일대 
			<h3>사망자 1,000여명<br>
			        이재민 3,500명</h3>
			<%
		}
	%>
		</div>
		<div class="dw_div1-2">
			<img src="../image/<%=where %>.jpg" width="256" height="164">
		</div>
		<p class="dw_p2">
	<%	 if("1-1".equals(where)) {
			%>
			고향의 폭력과 분쟁으로 너무 
			많은 것을 잃은 난민 아이들.
			교육은 이들에게 미래의 꿈을 
			되찾아줄 수 있는 중요한 해결책입니다.
			<%
		}
    else if("1-2".equals(where)) {
	   		%>
	   		유엔난민기구와 함께
			급격한 기후 변화로
			고향을 잃고 피난길에 오른
			난민들을 도와주세요
	   		<%
    	}
    else if("1-3".equals(where)) {
	   		%>
			분쟁과 폭력을 피해
			고향을 떠나 피난길에 오른
			난민들에게
			지금 도움이 필요합니다
	   		<%
		}
    else if("2-1".equals(where)) {
	   		%>
			베네수엘라 긴급구호, 340만 난민을 지켜주세요!
	   		<%
		}
    else if("2-2".equals(where)) {
	   		%>
			많은 예멘 난민들이 머무는
			지부티와 말레이시아를
			방문한 정우성 친선대사가
			그들의 이야기를 전합니다
	   		<%
		}
    else if("2-3".equals(where)) {
	   		%>
			당신의 도움으로
			사이클론 이다이로
			절망에 빠진 사람들에게
			긴급구호 물품을
			전달할 수 있습니다
	   		<%
		}
    %>
		</p>
	</div>
	<form name="frm" method="post" action="donateWriteSave.jsp">
		<div class="dw_div2">
			후원 금액 선택<br>
			<input type="radio" name="money" id="3" value="30000" onclick="fn_click('3');" checked>3만원&nbsp;
			<input type="radio" name="money" id="5" value="50000" onclick="fn_click('5');">5만원&nbsp;
			<input type="radio" name="money" id="7" value="70000" onclick="fn_click('7');">7만원&nbsp;
			<input type="radio" name="money" id="10" value="100000" onclick="fn_click('10');">10만원<br>
			<input type="radio" name="money" id="money" value="money" onclick="fn_click('money');">직접입력
			<input style="width:120px;" type="text" name="money" id="txt"
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" disabled><br>
			
			<a class="btn" href="#" onclick="fn_donate();">후원하기</a>
		</div>
	</form>
	</div>
</body>
</html>