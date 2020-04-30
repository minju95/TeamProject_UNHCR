<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/dbcon.jsp"%>
 <%
 String domain = "http://localhost:8080";
 String RealPath= "C:/workspace/shopping/WebContent/";
 
 %>
 
 
 <%
 String unq = request.getParameter("unq");
String filename = request.getParameter("filename");

 String path = RealPath+"/uploadfiles/"+filename;
 File f = new File(path);
 f.delete();
 
 String sql = "UPDATE jung SET "	 
	        + "imgname='',imgpath='' "
            + " WHERE unq='"+unq+"'";
 //out.print(sql);
  stmt.executeUpdate(sql);
 
 
 %>
 <script>
 location = "jungModify.jsp?unq=<%=unq%>";
 
 </script>