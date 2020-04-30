<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!--  DB연결 -->
<%@ include file="../include/dbcon.jsp" %>

<!-- 데이터받기 -->
	<%

String userid = (String) session.getAttribute("SessionUserid");

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

		
%>

<%
if(userid==null){
	%>
	<script>
alert("잘못된접근");
history.back();
</script>
	
	
	<%
}
%>


<!-- SQL작성밑 적용 -->
<%
String sql = "UPDATE member_info SET ";
sql+= " name ='"+name+"',";
sql+= " birthday ='"+birthday+"',";
sql+= " gender ='"+gender+"',";
sql+= " phone ='"+phone+"',";
sql+= " post ='"+post+"',";
sql+= " addr ='"+addr+"',";
sql+= " email ='"+email+"',";
sql+= " pass ='"+pwd+"'";
sql+= " WHERE userid='"+userid+"'";

stmt.executeUpdate(sql); 

%>
<!-- 메세지 처리(자바스트립트) -->
<script>
alert("변경완료");
location="../main/main.jsp"
</script>



