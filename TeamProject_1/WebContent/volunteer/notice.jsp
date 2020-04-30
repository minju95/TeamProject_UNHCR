<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>
<%
//모집중, 모집종료 구분
String open =request.getParameter("open");
String select2 = "";

if(open == null) {
	select2 = "";
}

if("y".equals(open)) {
	select2 = "AND v_sdate <= curdate() AND v_edate >= curdate() ";			
}

if("n".equals(open)) {
	select2 = "AND v_sdate < curdate() AND v_edate <= curdate() ";			
}


//지역별 분류
String region = request.getParameter("region");
String select = "";
if(region == null) {
	region = "";
}
if(region != null && !"".equals(region)) {
	select = "AND v_region = '"+region +"' ";
}


//페이징
int unit = 10; //한 페이지에 보여줄 행 개수
String pageNo = request.getParameter("pageNo");
if(pageNo == null) {
	pageNo = "1";
}

//검색 기능
String search = ""; //SQL문 조건부(WHERE절)
String keyword = request.getParameter("keyword"); 
String column = request.getParameter("column"); //컬럼명
if(keyword == null ) {
	keyword="";
	column="";
}
if(keyword!= null && !"".equals(keyword)) {
	search= " AND " +column+" LIKE '%" +keyword+ "%' ";
}

String sql2 = "SELECT count(*) count FROM v_board "
			+ "WHERE v_state = '1' "
			+ select 
			+ select2
			+ search;

Statement stmt3 = conn.createStatement(); 
ResultSet rs2 = stmt3.executeQuery(sql2);
rs2.next();
int total = rs2.getInt("count");


int totalPage = (int) (Math.ceil((double)total/unit));

int startNo = (Integer.parseInt(pageNo)-1)*unit;


//리스트로 출력
String sql = "SELECT v_unq, "
			+"v_name, "
			+"v_title, "
			+"v_rdate, "
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
					+"END as 'v_region' "
			+"FROM v_board "
			+"WHERE v_state = '1' "
			+ select
			+ select2 
			+ search 
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
height: 10%;
margin: 0 auto;
padding: 10px;
line-height: 2.0;
}

.table1 {
width: 900px;
height: 80px;
margin: 0 auto;
padding: 10px;
text-align: center;
margin-bottom: 40px;
margin-top: 20px;
border-collapse: collapse;
background-color: #EEEEED;
border: 0.5px solid black;
}

.searchWrap1 {
width: 150px;
height: 30px;
margin: 0 auto;
position:relative;
left: 50px;
margin-bottom: 10px;
display: inline-block;
text-align: center;
}

.searchWrap2 {
width: 300px;
height: 30px;
margin: 0 auto;
position:relative;
left: 500px;
margin-bottom: 10px;
display: inline-block;
margin-left: 155px;
margin-bottom: 40px;
}

.table2 {
width: 900px;
margin: 0 auto;
text-align: center;
border-collapse: collapse;
border-bottom: 1px solid #495057;
border-top: 2.5px solid #495057;
}
.table2 tr:nth-child(even) {
	background-color: #EEEEED;
}
.td1 {
padding:10px;
}
.td2 {
padding:10px;
}

.number {
width: 900px;
height: 35px;
margin: 0 auto;
text-align: center;
line-height: 2.0;
}


</style>

<script>
function fn_over() {
	this.style.background='skyblue';
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
			<h1>모집공고</h1>
			전국 각지에서 자원봉사자 여러분의 참여를 기다립니다.
	</div>
	
		<table class="table1" border="1">
		<colgroup>
			<col width="11%" />
			<col width="11%" />
			<col width="11%" />
			<col width="11%" />
			<col width="11%" />
			<col width="11%" />
			<col width="11%" />
			<col width="11%" />
			<col width="11%" />
			
		</colgroup>
		<tr>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=" class="r1">전체</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=1">서울</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=2">경기</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=3">인천</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=4">강원도</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=5">대전</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=6">충청북도</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=7">충청남도</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=8">세종</a>
				</td>
		</tr>
			<tr>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=9">대구</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=10">부산</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=11">울산</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=12">경상북도</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=13">경상남도</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=14">광주</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=15">전라북도</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=16">전라남도</a>
				</td>
				<td onmouseover="this.style.background='skyblue'" onmouseout="this.style.background='#F2F2F2'">
					<a href="notice.jsp?top=volunteer&region=17">제주도</a>
				</td>
			</tr>
		</table>
		
		
	<div class="searchWrap1">
		<a href="notice.jsp?top=volunteer&open=y" >모집중</a> | <a href="notice.jsp?top=volunteer&open=n">모집종료</a>	
	</div>	
	<form name="frm" method="post" action="notice.jsp">
		<div class="searchWrap2">
			<select name="column" style="width: 80px; height: 25px; " >
				<option value="v_title">제목</option>
				<option value="v_content">내용</option>
			</select>
			<input type="text"  name="keyword" style="width: 160px; height: 25px;">
			<input type="submit" style="width: 40px; height: 30px; cursor: pointer;" value="검색">
		</div>	
	</form>
	
		<table class="table2">
			<tr style="border-bottom: 1px solid #495057;">
				<th width="10%" class="td1">지역</th>
				<th width="20%" class="td1">기관명</th>
				<th width="55%" class="td1">제목</th>
				<th width="15%" class="td1">등록일</th>
			</tr>
			<% if(total == 0) {
			%>
				<tr>
					<td width="15%" class="td1" colspan="4">모집공고가 없습니다.</td>
				</tr>
			<%
			} else { 
			while(rs.next()) {
				region = rs.getString("v_region");
				String name = rs.getString("v_name");
				String title = rs.getString("v_title");
				String rdate = rs.getString("v_rdate");
				String unq= rs.getString("v_unq");
			%>
			<tr>
				<td class="td2"><%=region %></td>
				<td class="td2"><%=name %></td>
				<td class="td2"><a href="noticeDetail.jsp?top=volunteer&unq=<%=unq%>" class="userHover"><%=title %></a></td>
				<td class="td2"><%=rdate %></td>
			</tr>
				<%

				}
			}
			
				%>
			
		</table>
			<div class="number">
				<p>
					<%
					for(int i=1; i<=totalPage; i++) {
					%>
					<a href="<%=request.getRequestURL() %>?pageNo=<%=i %>&keyword=<%=keyword%>&column=<%=column%>"><%=i %></a>
       		<!-- 자기 자신을 호출시, request.getRequestURL() 메소드 사용 -->
			<!-- pageNo라는 이름으로 i가 이동-->
			<%
					}
					%>
				</p>
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