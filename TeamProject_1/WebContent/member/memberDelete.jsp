<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>
<% 
String userid = request.getParameter("userid");

String sql = "DELETE FROM member_info WHERE "
		   + "userid = '"+userid+"' ";
stmt.executeUpdate(sql);

session.removeAttribute("SessionUserid");
%>
<script>
alert("탈퇴 하였습니다.");
location="../main/main.jsp";
</script>