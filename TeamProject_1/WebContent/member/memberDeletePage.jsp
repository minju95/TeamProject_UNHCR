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

String sql = "SELECT name FROM member_info "
		   + "where userid='"+userid+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String userName = rs.getString("name");
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
.mdp_div1{
	margin-top:100px;
	font-weight:bold;
	font-size:24px;
	color:#444444;
}
.mdp_div2{
	margin-top:100px;
	font-weight:bold;
	font-size:16px;
	color:#444444;
}
.mdp_p{
	color:#0072bc; 
	display:inline-block;
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
<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id="container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<%@ include file = "../include/rightmenu.jsp" %>
<div>
<div id="content2" style="text-align:center;">
	<div class="mdp_div1">
		<p class="mdp_p"><%=userName %></p> 후원자님, <br><br>
		탈퇴에 앞서 후원자님을 통해 미래를 꿈구고 있는 많은<br>
		난민들을 위해 다시 한번 고민을 부탁 드립니다.
	</div>
	<div class="mdp_div2">
		<p class="mdp_p" style="font-weight:bold; font-size:20px;">유엔난민기구의 회원을 탈퇴하고 모든 후원을 중단하겠습니다.</p><br><br>
		업무일 기준으로 출금일 전일 또는 출금일 당일에 탈퇴 요청을 하시는 경우,<br>
		해당월까지는 출금이 진행될 수 있습니다.
	</div>
	<a class="btn" href="memberDeletePage2.jsp">회원탈퇴신청</a>
</div>
</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>