<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>
<%@ page import="java.util.Calendar"%>



<%

String sessionid = (String)session.getAttribute("SessionUserid");
String admin = (String)session.getAttribute("AdminConfirm");
	
		// 제목을 누르면 그에 해당하는 unq 불러오기
	String unq = request.getParameter("unq");
		
				/* 제목을 클릭한 해당 unq의 데이터들 불러오기 */
		String sql = " select name,title,content from faq4 "
				   + " where unq = '"+unq+"' ";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
			String name = rs.getString("name");
			String title = rs.getString("title");
			String content = rs.getString("content");
			
			content = content.replaceAll("\n","<br>");

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 탭 상세화면</title>
</head>

	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/leftmenu.css">
	
<script>

		<%@ include file="../js/leftmenu.js"%>

	function fn_modify() {
		var url = "faqSub4Modify.jsp?top=board&unq=<%=unq %>";
		location= url;
	}
	function fn_delete() {
		var url = "faqSub4Delete.jsp?unq=<%=unq %>";
			if (confirm("삭제하시겠습니까?")) {
				location = url;
			}
	}

</script>



<body>
<div id="header">
	<%@ include file = "../include/topmenu.jsp" %>
	<%@ include file = "../include/leftmenu.jsp" %>
		
<div id="content2">
	
	
	<!-- 
								        등록 UI 출력
								        번호 : 출력만 되게 함
								        이름 : 출력만 되게 함
								        날짜 : 출력만 되게 함
								        제목 : 직접 작성 (100자 이내)
								        내용 : 직접 작성 (2000자 이내)
								        공개/비공개 : select문으로 택1
					      						-->
	<div class="box">								
	<br><br>
	
	<div class="contentMain">수정하기</div>
		<table cellspacing="1" bgcolor="#cccccc" width="600" align="center">
		<input type="hidden" name="unq" value="<%=unq %>">
			<tr bgcolor="#ffffff">
				<th height="7%" width="100" height="150" bgcolor="skyblue">이름</th>
				<td  class="con" style="padding:5px;"><%=name %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="7%" bgcolor="skyblue">제목</th>
				<td  class="con" style="padding:5px;"><%=title %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="49%" bgcolor="skyblue">내용</th>
				<td class="con" style="vertical-align:top;padding:5px;"><%=content %></td>
			</tr>

		</table>
		<br>
			<div align="center">
			<%
				if (sessionid != null && admin != null) {
			%>
				<button type="button" style="width:50px;height:30px;" onclick="fn_modify()">수정</button>
				&nbsp;
				<button type="button" style="width:50px;height:30px;" onclick="fn_delete()">삭제</button>
				&nbsp;
			<%
				}
			%>
				<button type="button" style="width:50px;height:30px;" onclick="history.back()">뒤로</button>
			</div>			
	</div>



</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>