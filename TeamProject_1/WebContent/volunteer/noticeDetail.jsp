<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>
<%

String userid = (String)session.getAttribute("SessionUserid");
if(userid == null) {
%>
<script>
function fn_apply1() {
	var prev_url = window.location.href;
	alert("로그인 후 이용해주시기 바랍니다.");
	location = "../volunteer/login.jsp?prev_url="+prev_url;
	return false;
}
</script>
<%	
} else {
%>
<script>
function fn_apply1() {
	location = "../volunteer/applyCompletion.jsp";
}
</script>	
<%
}
String unq = request.getParameter("unq"); //notice.jsp에서 받아옴

String sql = "SELECT v_title, v_rdate, v_name, v_sdate, v_edate, v_content "
				+"FROM v_board  "
				+"WHERE v_unq='"+unq+"' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();
String title = rs.getString("v_title");
String rdate = rs.getString("v_rdate");
String name = rs.getString("v_name");
String sdate = rs.getString("v_sdate");
String edate = rs.getString("v_edate");
String content = rs.getString("v_content");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원봉사 - 모집 상세보기</title>
</head>
<link rel="stylesheet"href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">

<script>
<%@ include file="../js/leftmenu.js"%>
</script>

<style>
.title {
width: 800px;
height: 10%;
margin: 0 auto;
line-height: 2.0;
margin-bottom: 50px;
}

.table1 {
width: 800px;
height: 800px;
margin:auto;
border: 1px solid #495057;
border-collapse: collapse;
}
.v_content {
width:96.5%;
height:100%;
overflow-x: auto; /*가로축의 경우, 스크롤 숨김*/
overflow-y: scroll; /*세로축의 경우, 스크롤 보이게*/
padding: 15px;
}
.apply {
width: 800px;
height: 50px;
margin: 0 auto;
margin-top: 30px;
}

.line {
border-bottom: 1px solid #bcbcbc;
padding-left: 15px;
}

</style>


<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id="container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<%@ include file = "../include/rightmenu.jsp" %>

<div>


<div id="content2">
	
	<div class="title">
			<h1>자원봉사 신청</h1>
			전국 각지에서 자원봉사자 여러분의 참여를 기다립니다.
	</div>
	
	<form name="frm" method="post" action="">
	<table class="table1">
		<tr height="5%">
			<th colspan="2" style="font-size: 20px"><%=title %></th>
		<tr height="3%">		
			<td colspan="2" class="line">등록일 <%=rdate %></td>
		</tr>
		<tr height="5%">
			<td class="line">기관 <%=name %></td>
			<td class="line">모집기간 <%=sdate %> ~ <%=edate %></td>
		</tr>
		<tr height="60%">
			<td colspan="2"><div class="v_content" class="line"><%=content %></div></td>
		</tr>
		</table>
		
		<div class="apply">
			<input type="button" name="apply" style="width: 200px;height: 40px; margin-left: 300px; cursor: pointer;"
					value="자원봉사 지원하기" onclick="fn_apply1();">
			<input type="button" name="list" style="width: 80px; height: 40px; float: right; cursor: pointer;"
					value="목록" onclick="location='../volunteer/notice.jsp'">
		</div>
	</form>


	
	
</div> 
</div>
</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>