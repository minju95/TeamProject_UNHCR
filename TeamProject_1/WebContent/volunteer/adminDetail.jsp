<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<%

//관리자 세션 불러오기

String adminConfirm = (String)session.getAttribute("AdminConfirm");

if(adminConfirm == null || "".equals(adminConfirm)) {
%>	
<script>
var prev_url = window.location.href;
alert("관리자로 로그인 해주시기 바랍니다.");
location = "../volunteer/login.jsp?prev_url="+prev_url;
</script>
<%
return;
}
String unq = request.getParameter("unq");
String sql ="SELECT "
					+"v_name, "
					+"v_rdate, "
					+"v_title, "
					+"v_content, "
					+"v_sdate, "
					+"v_edate, "
					+" case "
							+" WHEN v_region='1' THEN '서울' "
							+" WHEN v_region='2' THEN '경기' "
							+" WHEN v_region='3' THEN '인천' "
							+" WHEN v_region='4' THEN '강원도' "
							+" WHEN v_region='5' THEN '대전' "
							+" WHEN v_region='6' THEN '충청북도' "
							+" WHEN v_region='7' THEN '충청남도' "
							+" WHEN v_region='8' THEN '세종' "
							+" WHEN v_region='9' THEN '대구' "
							+" WHEN v_region='10' THEN '부산' "
							+" WHEN v_region='11' THEN '울산' "
							+" WHEN v_region='12' THEN '경상북도' "
							+" WHEN v_region='13' THEN '경상남도' "
							+" WHEN v_region='14' THEN '광주' "
							+" WHEN v_region='15' THEN '전라북도' "
							+" WHEN v_region='16' THEN '전라남도' "
							+" WHEN v_region='17' THEN '제주도' "
							+" ELSE '0' "
							+"END as 'v_region', "
					+"if(v_state='1', '공개', '비공개') v_state "
			+"FROM v_board WHERE v_unq = '"+unq+"' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();
String name = rs.getString("v_name");
String rdate = rs.getString("v_rdate");
String title = rs.getString("v_title");
String content = rs.getString("v_content");
String sdate = rs.getString("v_sdate");
String edate = rs.getString("v_edate");
String state = rs.getString("v_state");
String region = rs.getString("v_region");



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
height: 60px;
margin: 0 auto;
line-height: 2.0;
margin-bottom: 50px;
}

.table1 {
width: 800px;
height: 800px;
border: 1px solid black;
margin: 0 auto;
padding: 10px;
border-collapse: collapse;
}

.v_content {
width:100%;
height:100%;
overflow-x: auto; /*가로축의 경우, 스크롤 숨김*/
overflow-y: scroll; /*세로축의 경우, 스크롤 보이게*/
}

.button_area {
width: 800px;
height: 70px;
margin: 0 auto;
}

.button_area .button {
width: 70px;
height: 35px;
float: right;
display: inline-block;
margin-top: 20px;
margin-left: 20px;
cursor: pointer;
}

</style>
<script>
function fn_delete() {
	var msg = "삭제하시겠습니까?";
	if(confirm(msg) == true) {
		location = "adminDelete.jsp?unq=<%=unq%>";
	} else {
		history.back();
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
	
	<div class="title">
		<h1>관리자 게시판</h1>
	</div>
	
	<form name="frm" method="post" action="adminModify.jsp?unq=<%=unq%>">
	<input type="hidden" name="unq" value="<%=unq %>">
 	<table class="table1" border="1">
		<tr height="10%">
			<th width="15%" style="background-color: #EEEEED;">제목</th>
			<td width="85%"><%=title%></td>
		</tr>
		<tr height="5%">
			<th style="background-color: #EEEEED;">지역</th>
			<td><%=region%></td>
		</tr>
		<tr height="5%">
			<th style="background-color: #EEEEED;">기관</th>
			<td><%=name%></td>
		</tr>
		
		<tr height="5%">
			<th style="background-color: #EEEEED;">모집기간</th>
			<td><%=sdate%> ~ <%=edate%></td>
		</tr>
		<tr height="70%">
			<th style="background-color: #EEEEED;">내용</th>
			<td colspan="2"><div class="v_content"><%=content %></div></td>
		</tr>
		<tr height="5%">
			<th style="background-color: #EEEEED;">공개 여부</th>
			<td><%=state %></td>
	</table>

	</form>	
	<div class="button_area">
		<input type="submit"  class="button" onclick="location='adminModify.jsp?top=volunteer&unq=<%=unq %>'" value="수정">
		<input type="button" class="button" onclick="fn_delete()" value="삭제">
		<input type="submit" class="button" onclick="location='adminList.jsp?top=volunteer'" value="목록">
	</div>
	
</div> 
</div>
</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>