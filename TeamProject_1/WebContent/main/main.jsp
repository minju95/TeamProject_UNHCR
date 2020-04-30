<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>
<%
String ssesionId = (String)session.getAttribute("SessionUserid");
String adminConfirm = (String)session.getAttribute("AdminConfirm");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">
<title>Main</title>
</head>
<script>
<%@ include file="../js/leftmenu.js"%>
</script>
<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div>
<div id="container">
	<%@ include file = "main_img.jsp" %>
	<div id="content2" style="margin-left:30%;">
	
		<%@ include file = "../include/rightmenu.jsp" %>
		<div class="donate_box1">
				<%@ include file = "main_box1.jsp" %>
		</div>
		<div class="donate_box1" style="height:300px;">
				<%@ include file = "main_box2.jsp" %>
		</div>
		<div class="donate_box1" style="height:300px;">
				<%@ include file = "main_box3.jsp" %>
		</div>

	</div>
	<div>
	<%@ include file = "../include/footer.jsp" %>
	</div>
</div>
</div>

</body>
</html>