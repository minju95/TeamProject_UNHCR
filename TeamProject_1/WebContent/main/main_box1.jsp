<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="conn.ConnectDB" %>
<%@ page import="java.sql.*"%>
<%
Connection mb1_conn = ConnectDB.connect();
Statement mb1_stmt = mb1_conn.createStatement();

String mb1_sql = "select count(*) cnt from donate_info";
ResultSet mb1_rs = mb1_stmt.executeQuery(mb1_sql);
mb1_rs.next();
int cnt = mb1_rs.getInt("cnt");

mb1_sql = "select a.*,format(m,0) money from ( "
		   + "select "
		   + "rpad(left(userid,2),length(userid),'*') userid,"
		   + "cal,sum(money) m "
		   + "from donate_info "
		   + "group by userid "
		   + "order by m desc limit 0,5"
		   + ") a ";
mb1_rs = mb1_stmt.executeQuery(mb1_sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.mb1_div {
float:left; 
margin:5px; 
width:65%
}
.mb1_p_empty {
width:100%; 
text-align:center; 
font-size:30px; 
font-weight:bold; 
line-height:7.5;
}
.mb1_p {
text-align:center;
font-size:30px;
}
.mb1_table {
width:100%; 
text-align:center; 
margin-top:10px; 
line-height:1.7;
}
.mb1_table th {
width:30%;
}
</style>

<body>
<div class="mb1_div">
<%
if(cnt == 0) {
%>
	<p class="mb1_p_empty">후원 내역이 없습니다.</p>
<%
} else {
%>
	<p class="mb1_p">희망을 보내주신 분들</p>
	<table class="mb1_table">
		<tr>
			<th>아이디</th>
			<th>후원 금액</th>
			<th>후원 생일</th>
		</tr>
	<%
	while(mb1_rs.next()) {
	String mb1_userid = mb1_rs.getString("userid");
	String mb1_money = mb1_rs.getString("money");
	String mb1_cal = mb1_rs.getString("cal");
	%>
		<tr>
			<td><%=mb1_userid %></td>
			<td><%=mb1_money %>원</td>
			<td><%=mb1_cal %></td>
		</tr>
	<%	
	}
	%>
	</table>
<%
}
%>

</div>
<div style="float:right; margin:5px; width:30%">
	<a href="../donate/donate.jsp?top=donate"><img src="../image/box1.png"></a>
</div>
</body>
</html>