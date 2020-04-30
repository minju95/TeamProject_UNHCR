<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="conn.ConnectDB" %>
<%@ page import="java.sql.*"%>
<%
Connection rm_conn = ConnectDB.connect();
Statement rm_stmt = rm_conn.createStatement();

String loginSsesionId = (String)session.getAttribute("SessionUserid");
String loginAdminConfirm = (String)session.getAttribute("AdminConfirm");

String rm_sql = "SELECT (select name from member_info where userid='"+loginSsesionId+"') username,"
		+ "d.cal first_cal, format(sum(d.money),0) sum_money "
	    + "FROM member_info m, donate_info d "
	    + "WHERE m.userid = d.userid and d.userid='"+loginSsesionId+"' "
	    + "ORDER BY cal asc";
ResultSet rm_rs2 = rm_stmt.executeQuery(rm_sql);

rm_rs2.next();


String rm_first_cal = rm_rs2.getString("first_cal");
String rm_sum_money = rm_rs2.getString("sum_money");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/layout.css">
<title>Insert title here</title>
</head>
<script>
<%@ include file="../js/leftmenu.js"%>

function fn_login() {
	  var f = document.rm_frm;
	  var userid = f.userid.value;
	  var pass = f.pass.value;
	  if(f.userid.value == "") {
		  alert("아이디를 입력해주세요.");
		  return false;
	  }
	  if(f.pass.value == "") {
		  alert("패스워드를 입력해주세요.");
		  return false;
	  }
	  var prev_url = window.location.href;
	  location="../member/loginSub.jsp?userid="+userid+"&pass="+pass+"&prev_url="+prev_url;
}

function fn_memberModify() {
	var url = "../member/memberModify.jsp";
	location = url;
}

function fn_logout() {
	var prev_url = window.location.href;
	var url = "../member/logout.jsp?prev_url="+prev_url;
	location = url;
}

function fn_memberWrite() {
	var url = "../member/memberWrite.jsp";
	location = url;
}

</script>
<style>
.rm_btn {
	border-radius:10px;
	margin-top:20px;
	line-height:30px;
	width:100px;
	height:30px;
	display:inline-block;
	background-color:#faeb00;
	color:black;
}
</style>
<body>
<form name="rm_frm" method="post" action="../member/loginSub.jsp">
	<div class="sidebox">
		<p style="font-size:16px; font-weight:bold; color:white; line-height:2.0;">
		<%
		if(loginSsesionId == null || "".equals(loginSsesionId)) { 
		%>
			회원 로그인<br>
			아이디 <br><input type="text" name="userid"><br>
			비밀번호 <br><input type="password" name="pass"><br>
			<a href="#" class="rm_btn" type="submit" onclick="fn_login(); return false;">로그인</a><br>
			<a href="#" class="rm_btn" type="button" onclick="fn_memberWrite();">회원가입</a>
		<%
		} else {
		%>
			<font color="ffcc66"><%=loginSsesionId %> 님 환영합니다.</font><br>
			-- 총 후원금액 --<br>
			<%
			if(rm_sum_money == null || "".equals(rm_sum_money)) {
			%>
			후원 정보 없음<br>
			<%
			} else {
			%>
				<%=rm_sum_money %>원<br>
			<%
			}
			%>
			-- 첫 후원 일자 --<br>
			<%
			if(rm_first_cal == null || "".equals(rm_first_cal)) {
			%>
			후원 정보 없음<br>
			<%
			} else {
			%>
				<%=rm_first_cal %><br>
			<%
			}
			%>
			<a href="#" class="rm_btn" type="button" name="member" onclick="fn_memberModify();">회원정보수정</a><br>
			<a href="#" class="rm_btn" type="button" name="member" onclick="fn_logout();">로그아웃</a>
		<%
		}
		%>
		</p>
	</div>
</form>
</body>
</html>