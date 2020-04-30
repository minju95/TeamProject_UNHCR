<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>
<% 
String userid = (String)session.getAttribute("SessionUserid");
if(userid == null) {
%>
	<script>
	var prev_url = window.location.href;
	alert("로그인 후 이용 가능합니다.");
	location="../volunteer/login.jsp?prev_url="+prev_url;
	</script>
<%
	return;
}
String sql = "SELECT name,pass FROM member_info "
		   + "where userid='"+userid+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String userName = rs.getString("name");
String pwd = rs.getString("pass");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">
<title>회원탈퇴</title>
</head>
<script>
<%@ include file="../js/leftmenu.js"%>
</script>
<style>
.mdp2_p{
	font-size:24px;
	font-weight:bold;
}
.mdp2_pwd{
	width:170px;
	height:25px;
}
table {
	padding:10px;
	margin-top:50px;
	margin-left:50px;
}
th{
	text-align:left;
	width:150px;
}
.btn {
	margin-top:50px;
	line-height:35px;
	width:120px;
	height:40px;
	display:inline-block;
	background-color:#888888;
	color:white;
	font-weight:bold;
	border-radius:10px;
}
</style>
<script>
function fn_delete() {
	var pass = document.getElementById("pwd").value;
	if(pass == null || pass == "") {
		alert("비밀번호를 입력해주세요.");
		return false;
	} else if(pass != "<%=pwd%>") {
		alert("비밀번호가 맞지 않습니다.")
		return false;
	}
	var cnt = "";
	var chk = document.getElementsByName("chk");
	for(var i=0; i<chk.length; i++) {
		if(chk[i].checked == true) {
			cnt += chk[i].value;
		}
	}
	if(cnt == "") {
		alert("회원탈퇴사유 항목을 선택해주세요.")
		return false;
	}
	if(confirm("정말 탈퇴 하시겠습니까?")) {
		location="memberDelete.jsp?userid=<%=userid%>";
	}
}

</script>
<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id="container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<%@ include file = "../include/rightmenu.jsp" %>
<div>
<div id="content2">
	<p class="mdp2_p">
	탈퇴 요청 정보
	</p>
	<table style="width:900px; height:600px;">
		<tr>
			<th>비밀번호</th>
			<td colspan="2"><input type="password" class="mdp2_pwd" id="pwd"></td>
		</tr>
		<tr>
			<th>회원탈퇴사유</th>
			<td style="line-height:3.0;">
			<input type="checkbox" name="chk" value="1">&nbsp;경제적 부담<br>
			<input type="checkbox" name="chk" value="2">&nbsp;개인사정<br>
			<input type="checkbox" name="chk" value="3">&nbsp;회원혜택 불만<br>
			<input type="checkbox" name="chk" value="4">&nbsp;운영관리 미흡
			</td>
			<td style="line-height:3.0;">
			<input type="checkbox" name="chk" value="5">&nbsp;해외유학 및 이주<br>
			<input type="checkbox" name="chk" value="6">&nbsp;군입대<br>
			<input type="checkbox" name="chk" value="7">&nbsp;사망<br>
			<input type="checkbox" name="chk" value="8">&nbsp;기타
			</td>
		</tr>
		<tr>
			<th>남기고 싶은 말씀</th>
			<td colspan="2"><textarea style="width:650px; height:130px;"></textarea></td>
		</tr>
		<tr>
			<th>탈퇴 요청 안내</th>
			<td colspan="2" style="font-size:14px; line-height:2.0;">
				* 탈퇴를 요청하는 기능일 뿐 실시간 탈퇴가 되지는 않습니다. (담당자에게 자동 전달)<br>
				* 탈퇴처리가 완료되면 모든 후원이 중단되며 홈페이지 로그인이 불가합니다.<br>
				* 탈퇴가 아닌 후원만 중단 원하시는 경우(남기고 싶은 말씀)에 "후원 중단 요청" 이라고 남겨주시기 바랍니다.<br>
				* 업무일 기준으로 출금일 전일 또는 출금일 당일에 탈퇴 요청을 하시는 경우, 해당월까지는 출금이 진행될 수 있습니다.
			</td>
		</tr>
	</table>
	<div style="text-align:right;">
		<a class="btn" style="background-color:#0072bc;" href="#" onclick="fn_delete(); return false;">탈퇴 요청</a>&nbsp;&nbsp;
		<a class="btn" href="#" onclick="history.back();">취소</a>
	</div>
</div>
</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>