<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/dbcon.jsp"%>

 
 
 <%
 String unq = request.getParameter("unq");


 
 String sql = "delete from jung where unq='"+unq+"'";
 //out.print(sql);
  stmt.executeUpdate(sql);
 
 
 %>
 <script>
 alert("삭제완료");
 location = "jungList.jsp";
 
 </script>