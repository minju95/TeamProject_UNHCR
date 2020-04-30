<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<%
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String sql = "insert into faq3(name,title,content) "
			   + " values ('"+name+"','"+title+"','"+content+"') ";
		stmt.executeUpdate(sql);
%>

	<script>
		if (confirm("등록하시겠습니까?")) {
			alert("등록되었습니다.");
			location="faqSub3.jsp?top=board";
		}
	</script>