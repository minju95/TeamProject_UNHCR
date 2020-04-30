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
String sql = "SELECT name,birthday,phone,email,post,addr FROM member_info "
		   + "where userid='"+userid+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String userName = rs.getString("name");
String birthday = rs.getString("birthday");
String phone = rs.getString("phone");
String email = rs.getString("email");
String post = rs.getString("post");
String addr = rs.getString("addr");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">
<title>기본정보 조회/변경</title>
</head>
<script>
<%@ include file="../js/leftmenu.js"%>
</script>
<style>
table {
	margin-left:100px;
	margin-top:50px;
	width:80%;
	font-size:20px;
	line-height:3.0;
}
th {
	width:300px;
	text-align:left;
}
.mi_p {
	font-weight:bold;
	font-size:24px;
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
<div id="content2">
<p class="mi_p">
회원 기본정보
</p>
<table>
	<tr>
		<th>- 성명</th>
		<td><%=userName %></td>
	</tr>
	<tr>
		<th>- 생년월일</th>
		<td><%=birthday %></td>
	</tr>
	<tr>
		<th>- 연락처</th>
		<td>
	<%if(phone == null || "".equals(phone)){ out.print("정보 없음"); } 
	else {
	%>
		<%=phone %>
		<input type="checkbox">&nbsp;SMS 수신
	<%
	}
	%>

		</td>
	</tr>
	<tr>
		<th>- 이메일</th>
		<td>
	<%if(email == null || "".equals(email)){ out.print("정보 없음"); } 
	else {
	%>
		<%=email %>
		<input type="checkbox">&nbsp;이메일 수신
	<%
	}
	%>
		</td>
	</tr>
	<tr>
		<th>- 주소</th>
		<td>
	<%if(post == null || "".equals(post)){ out.print("정보 없음"); } 
	else {
	%>
		<%=post %><%=addr %>
	<%
	}
	%>
		</td>
	</tr>
	<tr>
		<th>- 우편물 수신여부</th>
		<td><input type="radio" name="post">&nbsp;수신
		<input type="radio" name="post">&nbsp;수신안함</td>
	</tr>
</table>
	<div style="text-align:right;">
		<a class="btn" href="#" onclick="location='memberModify.jsp'">회원 정보 수정</a>
	</div>
</div>
</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>