<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.File"%>
    <%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
   <%@ include file="../include/dbcon.jsp" %>
   <%
   String unq = request.getParameter("unq");
   String name = request.getParameter("name");
   String domain = "http://localhost:8080/timproject";
   String RealPath= "C:/workspace/timproject/WebContent/";
   String sql = "SELECT title,content,imgpath from  jung where unq='"+unq+"'";
   ResultSet rs = stmt.executeQuery(sql);
   rs.next();
   String title = rs.getString("title");
   String content = rs.getString("content");
   String path = rs.getString("imgpath");
   String img1 = domain+path + "/" + name;
   
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
<style>


.sidebox1 {
width:460px;
height:400px;

float: right;
margin-right: 10px;
margin-top: 20px;
padding: 10px;
background-image: url("");
border: 0px solid black;
}
.sidebox2 {
width:460px;
height:400px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top: 20px;
padding: 10px;
}

.sidebox3 {
width:460px;
height:400px;
border: 0px solid black;
float: left;
margin-left: 10px;
margin-top:15px;
padding: 10px;
}
.sidebox4 {
width:460px;
height:400px;

float: right;
margin-right: 10px;
margin-top: 15px;
padding: 10px;
background-image: url("");
border: 0px solid black;
}


.p1{
color: #58a5fa;
margin-top: 30px;
margin-left: 200px;

}
.psize1{
font-size:15px;

}
.p2{
margin-left: 50px;
}
#img{
width: 1000px;
height: 450px;
border-left: 1px solid black;
border-right: 1px solid black;
margin: 0 auto;
background-image: url("");
background-size: contain;
background-repeat: no-repeat;
background-position: center;
}
.p3{
margin-left: 0px;
}
.p0{
text-align:center;
 font-size:18px;
   font-weight:bold;
   color: #58a5fa;
}
.a1{
color: #58a5fa;
}
input {
 
 width:350px;
 height:23px;
  font-size:15px;
}
textarea{
 width:500px;
 height:200px;
  font-size:16px;
}
.table1{
margin-top: 30px;
margin-left: 200px;
width:550px;
border:1px solid #ccc;
}
table.table1 th {
text-align:center;
font-weight:bold;
background-color:#cccccc;
border:1px solid #ccc;
height:30px;
 font-size:18px;
}
table.table1 td {
height:25px;
width:100px;
text-align:left;


}
 .button1{
      width:80px;
       height:40px;
      font-size:13px;
      font-family:맑은 고딕;
      }
      .pbutton{
      width:800px; 
    
      margin-left: 585px;
      }
</style>
<script>
function fn_submit(){
	var f = document.frm;
	if(f.title.value==""){
		alert("제목 입력해주세요.")
		f.gname.focus();
		return false;
	}
	f.submit();
}
</script>
<body>
<%@ include file = "../include/topmenu.jsp" %>
<%@ include file = "../include/leftmenu.jsp" %> 

<div id="content2">
<p class="p1">

	 <font size="17">친선대사  포토갤러리 등록
	</font>
	</p>
<form name="frm" method="post" action="jungModifySave.jsp?unq=<%=unq %>"  enctype="Multipart/form-data">
<input type="hidden" name="oldname" value="<%=name %>">
<table class="table1">
<tr>
<th>제목</th>
<td ><input type="text" name="title" value="<%=title%>"></td>
</tr>
<tr>
<th>내용</th>
<td><textarea name="content" ><%=content%></textarea></td>
</tr>
<tr>
<th >이미지</th>
<td ><input type="file" name="file" ><%
if(!"".equals(name)&& name !=null){
	
	 String path1 = domain+path+"/"+name; 
	 String path2 = RealPath +path+"/"+name; 
	 File f = new File(path2);
	 if(f.exists()) {
		 Image img = new ImageIcon(path2).getImage();
		 int w = img.getWidth(null);
		 int h = img.getHeight(null);
		
		
		 int x = (h*100) / w;
		 
%>
    <a href="<%=path1%>" target="_blank"><img src="<%=path2%>" width="100" hight="<%=x%>"></a>
    <a href="imgDelete.jsp?unq=<%=unq%>&filename=<%=path2%>">삭제</a>
<%
	 }else{
		 out.print( path2+ "<이미지 유실 됬습니다.>");
	 }
}else{
	out.print("<이미지 등록 안됨>");
	
}
%></td>
</tr>

</table>
<br>
<p class="pbutton">
  <button class="button1" type="submit" onclick="fn_submit();return false;">저장</button>
   <button  class="button1" type="reset">재작성</button> 
</p>
</form>
	
</div>
<%@ include file = "../include/footer.jsp" %> 
</body>
</html>