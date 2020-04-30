<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>


<%
	
	String runq = request.getParameter("runq");
	String rfid = request.getParameter("rfid");
	
	String gubun = request.getParameter("gubun");
	
	if ("D".equals(gubun)) {
		String sql = " delete from member_reply where rfid = '"+rfid+"' and runq = '"+runq+"' ";
		
			stmt.executeUpdate(sql);
		//out.print(sql);		
%>
	<script>
		alert("삭제 완료");
		location = "mSub1.jsp?top=board";
	</script>
	
<%
	}
%>