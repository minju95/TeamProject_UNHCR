<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<%
		// fn_delete() 에서의 unq값 받아오기
	String unq = request.getParameter("unq");
		
		String sql = " delete from member where unq = '"+unq+"' ";
			stmt.executeUpdate(sql);
%>
	<script>
		alert("삭제되었습니다.");
		location="mSub1.jsp";
	</script>