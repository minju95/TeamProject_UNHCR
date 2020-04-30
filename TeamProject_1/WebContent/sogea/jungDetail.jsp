<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>
<%
String userid = (String)session.getAttribute("SessionUserid");
String admin = (String)session.getAttribute("AdminConfirm");

String unq = request.getParameter("unq");
String name = request.getParameter("name");
String domain = "http://localhost:8080/Project";
String sql = "SELECT title,content,imgpath from  jung where imgname='"+name+"' and unq='"+unq+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String title = rs.getString("title");
String content = rs.getString("content");
String path = rs.getString("imgpath");
String img = domain+path + "/" + name;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">
</head>
<script>
<%@ include file="../js/leftmenu.js"%>
</script>
<script>

function fn_Modify(){
	location = "../sogea/jungModify.jsp?name=<%=name%>&&unq=<%=unq%>";
	
}
function fn_Delete(){
	location = "../sogea/jungDelete.jsp?unq=<%=unq%>";
	
}
</script>
<style>
.sidebox1 {
border-radius:10px;
width:800px;
height:40px;
border: 1px solid #c8c8c8;
float: left;
margin-left: 130px;
margin-top: 20px;
padding: 10px;
background-image: url("../image/titleD.PNG");
}

.sidebox2 {
width:800px;
height:600px;
border: 0px solid black;
float: left;
margin-left: 130px;
margin-top: 20px;
padding: 10px;
background-image: url("");
}


.sidebox3 {
width:810px;
height:150px;

float: left;
margin-left: 130px;
margin-top: 5px;
padding: 5px;
background-image: url("");
border: 1px solid black;
}

.p1{
color: #58a5fa;
margin-top: 30px;
margin-left: 220px;

}
.psize1{
font-size:18px;

}
.p2{
margin-left: 50px;
}
.a1{
color: #58a5fa;
}
 .button1{
      width:80px;
       height:50px;
      font-size:13px;
      font-family:맑은 고딕;
      float: right;
      margin-right: 5px;
  margin-top: 10px;
      }

</style>
<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id = "container">

<div>
<div id="content2">
<p class="p1">
	 <font size="17"><b>친선대사 정우성 포토갤러리</b></font>
	 <%
	 if(admin != null && userid != null){
	 %>
	 <button class="button1" type="button" onclick="fn_Delete()">삭제</button>
	  <button class="button1" type="button" onclick="fn_Modify()">수정</button>
	  <%
	 }
	  %>
	</p>
	
	
	
<div class="sidebox1">
<font  size="5" color=" #0770a7"><%=title %></font>
</div>
	
	<div class="sidebox2">
	<img src="<%=img %>" width="800"  height="600">
	</div >
	
	<div  class="sidebox3">
	<font  size="5"><%=content %><a class="a1" href="../sogea/jungList.jsp">▷포토갤러리로</a></font>
	</div>
</div>
</div>
</div>
<%@ include file = "../include/footer.jsp" %>


</body>
</html>