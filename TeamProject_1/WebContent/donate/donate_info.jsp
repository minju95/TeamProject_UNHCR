<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>
<%
String userid = (String)session.getAttribute("SessionUserid");
if(userid == null) {
%>
	<script>
	var prev_url = window.location.href;
	alert("로그인 후 이용 가능합니다.");
	location="../volunteer/login.jsp?prev_url="+prev_url;
	</script>
<%
	return;
}
String sql1 = "SELECT name,cal,format(money,0) money FROM donate_info "
		   + "where userid='"+userid+"' ";
Statement stmt1 = conn.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);

String sql2 = "SELECT (select name from member_info where userid='"+userid+"') username,"
			+ "d.cal first_cal,format(sum(d.money),0) sum_money "
		    + "FROM member_info m, donate_info d "
		    + "WHERE m.userid = d.userid and d.userid='"+userid+"' "
		    + "ORDER BY cal asc";
ResultSet rs2 = stmt2.executeQuery(sql2);

rs2.next();

String userName = rs2.getString("username");
String first_cal = rs2.getString("first_cal");
String sum_money = rs2.getString("sum_money");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">
<title>후원하기</title>
</head>
<script>
<%@ include file="../js/leftmenu.js"%>
</script>
<style>
.di_div1{
	margin-top:100px;
	width:100%;
	height:150px;
	font-size:20px;
}
.di_table{
	width:100%;
	border:0px solid #ccc;
	line-height:2.0;
}
.di_table td {
	text-align:center;
	border:0px solid #ccc;
}
</style>
<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id="container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<%@ include file = "../include/rightmenu.jsp" %>
<div>
<div id="content2">
	<div class="di_div1">
	<%
	if (first_cal == null || "".equals(first_cal)) {
	%>
		- <p style="font-weight:bold; display:inline-block;"><%=userName %></p> 님은 후원 이력이 없습니다.
	<%
	} else {
	%>
		- <p style="font-weight:bold; display:inline-block;"><%=userName %></p> 님의 후원생일은
		<p style="color:blue; display:inline-block;"><%=first_cal %></p> 이며 총 
		<p style="color:blue; display:inline-block;">후원 금액은 <%=sum_money %>원</p> 입니다. <br>
		- 유엔난민기구는 <%=userName %>님과 함께 7,080만 난민들에게 희망을 전달합니다.
	<%
	}
	%>
	</div>
	<div>
	<h1>진행중인 후원</h1>

	</div>
	<div style="margin-top:20px; height:150px; border:0px solid black; ">
		<table class="di_table">
			<colgroup>
				<col width="10%" />
				<col width="30%" />
				<col width="40%" />
				<col width="20%" />
			</colgroup>
			<tr>
				<th>번호</th>
				<th>납부일</th>
				<th>기금명</th>
				<th>금액</th>
			</tr>
			<%
			int num = 1;
			while(rs1.next()) {
				String name = rs1.getString("name");
				String cal = rs1.getString("cal");
				String money = rs1.getString("money");
			%>
			<tr>
				<td><%=num %></td>
				<td><%=cal %></td>
				<td><%=name %></td>
				<td><%=money %>원</td>
			</tr>
			<%
				num++;
			}
			%>
		</table>
	</div>
</div>
</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>