<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp"%>

<%
//관리자 세션 불러오기
String adminConfirm = (String)session.getAttribute("AdminConfirm");

if(adminConfirm == null || "".equals(adminConfirm)) {
%>
<script>
var prev_url = window.location.href;
alert("관리자로 로그인 해주시기 바랍니다.");
location = "../volunteer/login.jsp?prev_url="+prev_url;
</script>
<%	
}
String unq = request.getParameter("unq");

String sql ="DELETE v_board FROM v_board WHERE v_unq='"+unq+"' ";
stmt.executeUpdate(sql);
%>
<script>
	alert("삭제되었습니다.");
	location = "adminList.jsp";
</script>

