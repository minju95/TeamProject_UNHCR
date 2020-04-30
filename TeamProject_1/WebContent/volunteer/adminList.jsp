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

String search = ""; //SQL문 조건부(WHERE절)
String keyword = request.getParameter("keyword"); 
String column = request.getParameter("column"); //컬럼명
if(keyword == null ) {
	keyword="";
	column="";
}
if(keyword!= null && !"".equals(keyword)) {
	search= " WHERE " +column+ " LIKE '%"+keyword+ "%' ";
}

String sql2 = "SELECT count(*) count FROM v_board "
				+search;

Statement stmt3 = conn.createStatement(); 
ResultSet rs2 = stmt3.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt("count");

int unit = 10;

String pageNo = request.getParameter("pageNo");
if(pageNo == null) {
	pageNo = "1";
}

int totalPage = (int) Math.ceil((double)cnt/unit);

int startNo = (Integer.parseInt(pageNo)-1)*unit;


String sql = "SELECT v_unq, "
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
					
				+"v_name, "
				+"v_title, "
				+"v_rdate, "
				+"if(v_state='1','공개','비공개') v_state "
				+"FROM v_board "
				+search
			+" ORDER BY v_unq desc "
			+" LIMIT "+startNo+", " +unit;
ResultSet rs = stmt.executeQuery(sql);
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원봉사 - 모집 공고</title>
</head>
<link rel="stylesheet"href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">

<script>
<%@ include file="../js/leftmenu.js"%>
</script>

<style>
a {
text-decoration: none;
color: black;
}

a:hover {
color: #0072bc;
text-decoration: underline;
}

.title {
width: 800px;
height: 60px;
margin: 0 auto;
line-height: 2.0;
margin-top: 20px;
margin-bottom: 20px;
}

.searchWrap {
width: 300px;
height: 30px;
margin: 0 auto;
margin-left: 600px;
margin-bottom: 40px;
}
.table2 {
width: 800px;
margin: 0 auto;
border-collapse: collapse;
text-align: center;
font-size: 13px;
border-bottom: 1px solid black;
border-top: 1px solid black;
}
.td1 {
padding:10px;
}
.td2 {
padding:10px;
}

.paging {
width: 800px;
height: 70px;
margin: 0 auto;

}
.number {
width: 300px;
height: 35px;
margin: 0 auto;
display: inline-block;
margin-top: 20px;
margin-left: 200px;
text-align: center;
line-height: 2.0;
}

.paging .button {
width: 70px;
height: 35px;
float: right;
display: inline-block;
margin-top: 20px;
cursor: pointer;
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
		<h1>관리자 게시판</h1>
	</div>
	<form name="frm" method="post" action="adminList.jsp">
	<div class="searchWrap">
		<select name="column" style="width: 80px; height: 25px;" >
			<option value="v_title">제목</option>
			<option value="v_content">내용</option>
		</select>
		<input type="text" name="keyword" style="width: 160px; height: 25px;">
		<input type="submit" style="width: 40px; height: 30px; cursor: pointer;" value="검색">
	</div>
	</form>
	<table class="table2">
			<tr height="10%" style="background-color: #EEEEED; border-bottom: 1px solid black;">
				<th width="13%" class="td1">지역</th>
				<th width="20%" class="td1">기관명</th>
				<th width="42%" class="td1">제목</th>
				<th width="15%" class="td1">작성일</th>
				<th width="10%" class="td1">상태</th>
			</tr>
			<%
				int count = 1;
			while(rs.next()) {
				String region = rs.getString("v_region");
				String name = rs.getString("v_name");
				String title = rs.getString("v_title");
				String rdate = rs.getString("v_rdate");
				String unq = rs.getString("v_unq");
				String state = rs.getString("v_state");

			%>
			<tr style="border-bottom: 1px solid #bcbcbc">
				<td class="td2"><%=region %></td>
				<td class="td2"><%=name %></td>
				<td class="td2"><a href="adminDetail.jsp?top=volunteer&unq=<%=unq%>"><%=title %></a></td>
				<td class="td2"><%=rdate %></td>
				<td class="td2"><%=state %></td>
			</tr>
			<%
			count++;
			}
			%>
	</table>
	

	<div class="paging">
		<div class="number">
		<%
			for(int i=1; i<=totalPage; i++) {
		%>
			<a href="<%=request.getRequestURL() %>?top=volunteer&pageNo=<%=i %>&keyword=<%=keyword%>&column=<%=column%>"><%=i %></a>
		<%
			}
		%>
		</div>
		
		<input type="button" class="button" onclick="location='adminWrite.jsp?top=volunteer'" value="글쓰기">
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