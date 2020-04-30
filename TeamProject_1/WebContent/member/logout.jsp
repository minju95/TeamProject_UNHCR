<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String prev_url = request.getParameter("prev_url");
session.removeAttribute("SessionUserid");
String adminConfirm = (String)session.getAttribute("AdminConfirm");
if(adminConfirm == "Y"){
session.removeAttribute("AdminConfirm");
}
%>

<script>
alert("로그아웃 되었습니다.");
location.href="<%=prev_url%>";
</script>