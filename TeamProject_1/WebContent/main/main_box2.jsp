<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="conn.ConnectDB" %>
<%@ page import="java.sql.*"%>

<%
//지역별로 구분 -> 데이터출력
Connection vb_conn = ConnectDB.connect();
Statement vb_stmt = vb_conn.createStatement();



String region = request.getParameter("region");
String select = "";
if(region == null) {
	select = "";
}
if(region != null && !"".equals(region)){
	select  = " AND v_region = '"+region+"' ";
}

//데이터 개수 출력 sql 문
String vb_sql = "SELECT count(*) cnt FROM v_board "
					+"WHERE v_state = '1' " 
					+ select;
ResultSet vb_rs = vb_stmt.executeQuery(vb_sql);
vb_rs.next();
int vb_cnt = vb_rs.getInt("cnt");




Statement vb_stmt2 = vb_conn.createStatement();
String vb_sql2 = "SELECT v_unq, v_name, "
						+"v_title, "
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
						+"v_rdate "
						+"FROM v_board "
						+"WHERE v_state='1' "
						+ select
						+"ORDER BY v_unq desc"
						+" LIMIT 6";
ResultSet vb_rs2 = vb_stmt2.executeQuery(vb_sql2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.vb_tbl a, .vb_region a{
text-decoration: none;
color: black;
}
.vb_tbl a:hover, .vb_region a:hover {
color: #0072bc;
text-decoration: underline;
}

.vb_title  {
width: 30%;
height: 20%;
text-align: center;
vertical-align: middle;
line-height: 3.0;
float: left;
font-size: 20px;
}

.vb_region {
width: 65%;
height: 20%;
text-align: center;
vertical-align: middle;
line-height: 5.0;
margin-left: 150px;
font-size: 14px;

}

.vb_info {
width: 100%;
height: 70%;
margin-top: 20px;
}

.vb_tbl {
width: 100%;
border-collapse: collapse;
text-align: center;
border-bottom: 1px solid #bcbcbc;
border-top: 1px solid #bcbcbc;
}
.vb_tbl td {
padding: 3px;
}
</style>

<body>
<div class="vb_title">
<b>봉사활동 모집</b>
</div>
<div class="vb_region">
<a href="../main/main.jsp?region=1">서울 | </a> 
<a href="../main/main.jsp?region=3">인천 | </a> 
<a href="../main/main.jsp?region=5">대전 | </a> 
<a href="../main/main.jsp?region=14">광주 | </a> 
<a href="../main/main.jsp?region=9">대구 | </a>
<a href="../main/main.jsp?region=10">울산 | </a>  
<a href="../main/main.jsp?region=11">부산 | </a> 
<a href="../volunteer/notice.jsp?top=region">더보기</a>
</div>

<div class="vb_info">
	<table class="vb_tbl">
		<tr style="border-bottom: 1px solid #bcbcbc">
			<th width="30%">봉사기관</th>
			<th width="50%">봉사활동</th>
			<th width="20%">등록일</th>
		</tr>
		<%
		if(vb_cnt ==  0 ) {
		%>
			<tr>
			<td colspan='3'>등록된 공고가 없습니다.</td>
			</tr>
		<%
		} else {
			while(vb_rs2.next()) {
				String name = vb_rs2.getString("v_name");
				String title = vb_rs2.getString("v_title");
				String rdate = vb_rs2.getString("v_rdate");
				String unq = vb_rs2.getString("v_unq");
		%>
		<tr>
		
			<td><%=name %></td>
			<td><a href="../volunteer/noticeDetail.jsp?unq=<%=unq%>"><%=title %></a></td>
			<td><%=rdate %></td>
		</tr>
		<%
			}
		}
		%>
	</table>
</div>

</body>
</html>