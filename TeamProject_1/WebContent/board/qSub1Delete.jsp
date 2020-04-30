<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<%
		// fn_delete() 에서의 unq값 받아오기
	String q_unq = request.getParameter("q_unq");
		
		String sql = " delete from question where q_unq = '"+q_unq+"' ";
			stmt.executeUpdate(sql);
%>
	<script>
		alert("삭제되었습니다.");
		location="qSub1.jsp?top=board";
	</script>