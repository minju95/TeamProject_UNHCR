<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp"%>
 
<%
String userid = request.getParameter("userid");
String pwd = request.getParameter("pass");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birthday = request.getParameter("birthday");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String phone = phone1+"-"+phone2+"-"+phone3;
if(phone1 == null || "".equals(phone1) ||
   phone2 == null || "".equals(phone2) ||
   phone3 == null || "".equals(phone3)) {
	
	phone = "";
}
String post = request.getParameter("post");
String addr = request.getParameter("addr");
String email = request.getParameter("email1")+
			   "@"+
			   request.getParameter("email2");

String sql = "INSERT INTO member_info( "
		   + " userid,pass,name,gender,birthday,phone,post,addr,email )"
		   + " VALUES( "
		   + " '"+userid+"', "
		   + " '"+pwd+"', "
		   + " '"+name+"', "
		   + " '"+gender+"', "
		   + " '"+birthday+"', "
		   + " '"+phone+"', "
		   + " '"+post+"', "
		   + " '"+addr+"', "
		   + " '"+email+"' )";
stmt.executeUpdate(sql);
%>
<script>
	alert("가입 완료");
	location="../main/main.jsp";
</script>