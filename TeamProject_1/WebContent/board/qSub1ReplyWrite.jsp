<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<%
	String sessionid = (String)session.getAttribute("SessionUserid");

	if (sessionid == null) {
%>
	<script>
		alert("로그인 후 이용해주세요.");
		history.back();
	</script>
<%
		return;
	}
%>



<%
	String q_unq = request.getParameter("q_unq");

%>

<%
	Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH)+1;
		int d = cal.get(Calendar.DATE);
		
			cal.set(y,m,d);
		
		String yy = Integer.toString(y);
		String mm = Integer.toString(m);
		String dd = Integer.toString(d);
		
		String rdate = yy + "-" + "0" +  mm + "-" +  dd; 
		
		
		String sql = " select name from member_info where userid = '"+sessionid+"' ";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			String name = rs.getString("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>
	function fn_ply() {
		var f = document.frm;
		
		if (f.rcontent.value == "") {
			alert("내용을 확인해주세요.");
			f.rcontent.focus();
			return false;
		}
		if (confirm("등록하시겠습니까?")) {
			f.submit();
		}
	}
</script>

<body>
	<form name="frm" method="post" action="qSub1ReplySave.jsp">
	<br>
	<div  style="text-align:center;color:#0072bc;font-weight:bold;font-size:18px;">댓글 달기</div>
	<br>
	<br>
	<table align="center" border="0" cellspacing="1" bgcolor="#cccccc" width="500">
	  <input type="hidden" name="qunq" value="<%=q_unq %>">
	  <input type="hidden" name="quserid" value="<%=sessionid %>">
		<tr bgcolor="#ffffff">
			<th width="100">이름</th>
			<td>
				<input type="hidden" name="qname" value="<%=name %>" size="10"><%=name %> /
				<input type="hidden" name="qdate" value="<%=rdate %>"><%=rdate %>
			</td>
		</tr>
		<tr bgcolor="#ffffff">
			<th height="200">내용</th>
			<td>
				<textarea name="qcontent" placeholder="욕설 및 비방글은 삼가해주세요."
				 style="width:97%;height:200px;padding:5px;"></textarea>
			</td>
		</tr>
	</table>
	
		<p align="center">
			<input type="submit" value="등록" onclick="fn_ply(); return false;">
			&nbsp;
			<input type="reset" value="재작성">
		</p>
	
	</form>
</body>
</html>