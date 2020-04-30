<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>
<%@ page import="java.util.Calendar"%>

<%
	/* 해당 unq의 데이터 값을 출력하기 위해 불러오기 */
		String unq = request.getParameter("unq");
		
			String sql = " select name,title,content from faq2 "
					   + " where unq = '"+unq+"' ";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
				String name = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
				
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

		<link rel="stylesheet" href="../css/layout.css">
		<link rel="stylesheet" href="../css/leftmenu.css">

</head>

<style>
.a {
	font-size:13px;
	margin-left:5px;
}
.sidemain {
	font-weight:bold;
	font-size:18px;
}
.box {
	width:1000px;
	height:1000px;
	border: 0px solid black;
	margin-top: 20px;
	margin-right: 30px;
	float:right;
	padding:10px;
}
.contentMain {
	font-size:20px;
	font-weight:bold;
	padding:10px;
	text-align:center;
}

	table {
		width:600px;
		height:400px;
		margin:0 auto;
		font-size:14px;
	}
	textarea {
		width:97%;
		height:100px;
	}
	.status {
		float:left;
		
	}
	
</style>

<script>
	<%@ include file="../js/leftmenu.js"%>
</script>


<body>
<div id="header">
		<%@ include file = "../include/topmenu.jsp" %>
		<%@ include file = "../include/leftmenu.jsp" %>
<div id="content2">
	<form name="frm" method="post" action="faqSub2ModifySave.jsp">

	<div class="box">
	<div class="contentMain">게시글 수정하기</div>
		<table cellspacing="1" bgcolor="#cccccc" width="600" align="center">
			<input type="hidden" name="unq" value="<%=unq %>">
			<tr bgcolor="#ffffff">
				<th height="7%" width="100" height="150" bgcolor="skyblue">이름</th>
				<td>  
					<input type="text" name="name" value="<%=name %>" style="width:97%;padding:5px;">   <!-- 회원가입 기능 완성되면 이름 readonly -->
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="7%" bgcolor="skyblue">제목</th>
				<td><input type="text" name="title" value="<%=title %>" maxlength="50" style="width:97%;padding:5px;"></td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="49%" bgcolor="skyblue">내용</th>
				<td>
					<textarea name="content" style="height:96%;padding:5px;"><%=content %></textarea>
				</td>
			</tr>
		</table>
		<br>
			<div align="center">
				<input type="submit" value="수정" style="width:50px;height:30px;">
				&nbsp;
				<button type="button" style="width:50px;height:30px;" onclick="history.back()">뒤로</button>
			</div>
	</div>
	</form>	
</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>