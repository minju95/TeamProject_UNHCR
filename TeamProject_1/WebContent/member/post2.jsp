<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>

<% 
String dong = request.getParameter("dong");
if(dong == null) {
%>
	<script>
	alert("동을 입력해 주세요.");
	history.back();
	return;
	</script>
<%
}
String totSql = "select count(*) total ";
	   totSql+= "from post ";
	   totSql+= "where dong like '%"+dong+"%' or ri like '%"+dong+"%' ";
ResultSet totRs = stmt.executeQuery(totSql);
totRs.next();
int total = totRs.getInt("total");

String sql = "select * ";
	   sql+= "from post ";
	   sql+= "where dong like '%"+dong+"%' or ri like '%"+dong+"%' ";

ResultSet rs1 = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>
</head>

<style>
.div1 {
	width:370px;
	height:120px;
	border:1px solid #777777;
	margin:3px;	 /*외부간격*/
	padding:5px; /*내부간격*/
	text-align:center;
	vertical-align:middle;
	line-height:1.6;
	font-size:15px;
	font-family:맑은 고딕;
	color:#333333;
}


</style>
<script>
function fn_action() {
	var f = document.frm;
	var value = f.address.value;
	var array = value.split(" ");
	var post = array[0];
	post = post.replace('[','');
	post = post.replace(']','');
	var address = value.replace(array[0],'');
	
	opener.frm.post.value = post;
	opener.frm.addr.value = address;
	
	self.close();
}
</script>

<body>

<div class="div1">
	<p>
		<%=total %>개 검색되었습니다.
	</p>
<form name="frm" method="post" action="">
<select name="address">
	<%
	while(rs1.next()) {
		String a1 = rs1.getString("post");
		String a2 = rs1.getString("sido");
		String a3 = rs1.getString("sigun");
		String a4 = rs1.getString("dong");
		String a5 = rs1.getString("ri");
		String a6 = rs1.getString("bunji");
		String a7 = rs1.getString("others");
		String addr = "["+a1+"] "+a2+" "+a3+" "+a4+" "+a5+" "+a6+" "+a7;
	%>
	<option value="<%=addr %>"><%=addr %></option>
	<%
	}
	%>
</select>
<button type="button" onclick="fn_action()">적용</button>
</form>
</div>

</body>
</html>