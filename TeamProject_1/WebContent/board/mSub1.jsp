<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@ include file="../include/dbcon.jsp" %>

<%
		String sessionid = (String)session.getAttribute("SessionUserid");
		String admin = (String)session.getAttribute("AdminConfirm"); 
		

		/* 제목,작성자 선택에 따른 데이터 서치  */
		
		
		String searchValue = request.getParameter("search");
			String search = "";
		String keyword = request.getParameter("keyword");
		if 	("searchtitle".equals(searchValue)) {
			if (keyword != null && !"".equals(keyword)) {
				search = " and title like '%"+keyword+"%' ";
			} 
		} else if ("searchname".equals(searchValue)) {
			if (keyword != null && !"".equals(keyword)) {
				search = " and name like '%"+keyword+"%' ";
			}
		}
%>

<%
		/* 게시글 토탈 개수 얻기*/
		String totalSql = " select count(*) cnt from member where 1=1 "+search+" ";
			ResultSet rs2 = stmt2.executeQuery(totalSql);
			rs2.next();
			int total = rs2.getInt("cnt");
			
			/* 페이징 */
			int unit = 10;
				String pageNo = request.getParameter("pageNo");
					if (pageNo == null) {
						pageNo = "1";
					}
					
					int totalPage = (int)Math.ceil((double)total/unit);
					int startNo = (Integer.parseInt(pageNo)-1)*unit;
					int count = total - startNo;
%>


		
	
     
<%
			// select 문을 통한 member 데이터 값 가져오기 
		
	String sql = " select unq,userid,name,title,date,hit from member "
			   + " where 1=1 "+search+" "
			   + " order by unq desc "
			   + " limit "+startNo+", "+unit+" ";
		ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

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
/*
.box {
	width:1000px;
	height:1000px;
	border: 1px solid black;
	margin-top: 20px;
	margin-right: 30px;
	padding:10px;
	background-color:red;
}
*/
.contentMain {
	font-size:20px;
	font-weight:bold;
	color:brown;
	padding:10px;
}

</style>
<script>

<%@ include file="../js/leftmenu.js"%>

	function fn_action() { /* 글쓰기 화면으로 이동하는 함수처리 */
		location="mSub1Write.jsp?top=board";
	}
	
	function fn_list() { /* 목록 버튼을 누르면 mSub1.jsp?top=board로 이동하는 함수 처리 */
		location="mSub1.jsp?top=board";
		
	}
	
	
</script>
<body>
	<%@ include file = "../include/topmenu.jsp" %>
	<%@ include file = "../include/leftmenu.jsp" %>
<div>
<div id="content2" style="">
	<form name="frm" method="post" action="<%request.getRequestURL();%>">
			

				<div class="contentMain" style="text-align:center;color:#0072bc;">자유게시판</div>
					<span style="font-size:12px;color:red;">(*글쓰기는 로그인 후 가능합니다.)</span>
			<div style="float:right;">
				<select name="search">
					<option value="searchtitle">제목</option>
					<option value="searchname">작성자</option>
				</select>
			<input type="text" name="keyword">
			<button type="submit" style="width:40px;height:20px;margin-right:25px;">검색</button>
			</div>
		
			<div style="margin-top:30px;">
			<table border="0" cellspacing="1" bgcolor="#cccccc" width="950" height="50" align="center">
				<tr bgcolor="#ffffff" style="text-align:center;background-color:skyblue;font-size:15px;">
					<th style="width:40px;padding:5px;height:50px;">번호</th>
					<th style="width:65px;padding:5px;">작성자</th>
					<th>제목</th>
					<th style="width:100px;padding:5px;">날짜</th>
					<th style="width:45px;padding:5px;">조회수</th>
				</tr>
				<%
					while (rs.next()) {
						String unq = rs.getString("unq");
						String userid = rs.getString("userid");
						String name = rs.getString("name");
						String title = rs.getString("title");
						String hit = rs.getString("hit");
						String date = rs.getString("date");
					
						
				%>
				<tr bgcolor="#ffffff" align="center">
					<td style="height:25px;"><%=count %></td>
					<td><%=name %></td>
					<td><a href="mSub1Detail.jsp?top=board&unq=<%=unq %>&date=<%=date %>"><%=title %></a></td>
					<td><%=date %></td>
					<td><%=hit %></td>
				</tr>
				<%
							count--;
						}
				%>
			</table>
			<div style="width:300px;float:left;">
				<button type="button" onclick="fn_list()" style="margin-left:25px;margin-top:10px;width:60px;height:25px;">목록</button>
			</div>
				<div style="width:300px;float:right;text-align:right;">
					<input type="button" value="글쓰기" style="margin-right:25px;margin-top:10px;width:60px;height:25px;"
								onclick="fn_action()">
				</div>
			</div>
			<br>
		<p style="width:100%; text-align:center;">
			<%
				for (int i=1; i<=totalPage; i++) {
			%>
				<a href="mSub1.jsp?top=board&pageNo=<%=i %>"><%=i %></a>
			<%
				}
			%>
		</p>
	</form>	
</div>
</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>