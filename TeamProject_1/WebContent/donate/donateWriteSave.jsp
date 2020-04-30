<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/dbcon.jsp"%>

<%
String userid = (String)session.getAttribute("SessionUserid");
String name = request.getParameter("name");
if("1".equals(name)) name = "가장 필요한 곳에";
else if("2".equals(name)) name ="긴급 구호";

String money = request.getParameter("money");

String sql = "INSERT INTO donate_info(userid,name,cal,money) "
		   + "VALUES( "
		   + "'"+userid+"', "
		   + "'"+name+"', "
		   + "now(), "
		   + "'"+money+"' "
		   + ")";
stmt.executeUpdate(sql);
%>
<script>
alert("후원이 완료 되었습니다.");
self.close();
opener.location = "../donate/donate_info.jsp?top=donate";
</script>