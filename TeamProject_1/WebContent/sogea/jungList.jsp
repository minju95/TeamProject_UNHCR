<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/dbcon.jsp" %>
<%
String userid = (String)session.getAttribute("SessionUserid");
String admin = (String)session.getAttribute("AdminConfirm");

int unit = 12;
String domain = "http://localhost:8080/Project";
String pageNo = request.getParameter("pageNo");
if(pageNo==null){
	pageNo="1";
}
String search = "";
String keyword = request.getParameter("keyword");
String column =  request.getParameter("column"); //title, content

if(keyword==null){
	keyword="";
	column="";
}


if(keyword !=null && !"".equals(keyword)){
 search = " where "+column+" like '%"+keyword+"%'";
}

String sqlTotal="select count(*) cnt from jung";
       sqlTotal+= search;
ResultSet rsTotal =stmt.executeQuery(sqlTotal);
rsTotal.next();
int total =rsTotal.getInt("cnt");



//12/10 -> ceil(1.2) -> 2
int totalpage = (int)(Math.ceil((double)total/unit)); //1.2
//pageNo => 1:0 ,2:10 , 3:20 ===> (pageNo-1)*10
int startNo = (Integer.parseInt(pageNo)-1)*unit;




int count = total- startNo; //행번호
                                                                          
             
                                   
       
                                                                                       
String sql="select "; 
       sql+="unq,  ";
       sql+="imgpath,"; 
       sql+= "title,";
       sql+= "imgname,";
       //sql+="left(rdate10) rdate,";
       sql+="rdate ";
      
       sql+="from ";
       sql+="jung ";
       sql+= search ;
       sql+="order by rdate  desc ";
       sql+=" LIMIT "+startNo+","+unit; //index 번호, 출력개수
ResultSet rs = stmt.executeQuery(sql);
%>
<%
String sessionId = (String)session.getAttribute("SessionUserid");
String adminConfirm = (String)session.getAttribute("AdminConfirm");
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
margin-top: 40px;
margin-left: 220px;

}
.psize1{
font-size:18px;

}
.p2{
margin-left: 50px;
}
#img1{
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

.p0{
text-align:center;
 font-size:18px;
   font-weight:bold;
   color: #58a5fa;
}
.a1{
color: #58a5fa;
}
.a2{
color: #000000;
}
.table1{
margin-top: 10px;
margin-left: 0px;
 

border:0px solid #ccc;
}
.td1 {

padding: 2px;
text-align:left;
 border: 0px solid black;

}
.p3{
height:20px;
margin-top: 1px;
text-align:center;
 border: 0px solid black;
}
.pt{
width:240px;
height:85px;
 border: 0px solid black;
}
.such{
 width:990px;
 height:30px;
 border: 0px solid black;
}
.input2 {
	height:25px;
	font-size:15px;
}
select{
height:30px;

}
 .button1{
     width:60px;
 height:30px;
      font-size:13px;
      font-family:맑은 고딕;
      float: right;
      margin-right: 40px;
  margin-top: 0px;
      }
</style>
<script>
function fn_Write(){
	location = "../sogea/jungWrite.jsp";
	
}
</script>
<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id = "container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<%@ include file = "../include/rightmenu.jsp" %>

<div id="img1">
	<p class="p3"><iframe width="1000" height="450" src="https://www.youtube.com/embed/gMm6CHVxryM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>
</div>

<div id="content2">

<p class="p1">

	 <font size="17"><b>친선대사 정우성 포토갤러리</b>
	</font>
	</p>
	<br>

	 <div class="such">
	  <%
	 if(admin != null && userid != null){
	 %>
	 	<button class="button1" type="button" onclick="fn_Write()">사진등록</button>
	 	<%
	 }
	 	%>
       <form name="frm" method="post" action="jungList.jsp">
       <select name="column">
              <option value="title">제목</option>
              <option value="content">내용</option>
       </select>
       <input class="input2" type="text" name="keyword">
       <input class="input2" type="submit" value="검색"> 
      <input class="input2" type="button"  value="목록" onclick="location='<%=request.getRequestURL() %>'">
               </form>
               
       </div>
	<table class="table1">
<tr>
<%  
int cn = 1;
while(rs.next()){
	String rdate = rs.getString("rdate");
String title = rs.getString("title");
String name = rs.getString("imgname");
String path = rs.getString("imgpath");
String unq = rs.getString("unq");
String img = domain+path + "/" + name;
 
%>
<%
if(!"".equals(name)||!"".equals(path)) {
	
%>
<td class="td1">
    <a  href="../sogea/jungDetail.jsp?name=<%=name%>&unq=<%=unq%>"><img src="<%=img %>" width="240" height="185" border="0"></a> <br>
   <p class="pt"><a class="a1" href="../sogea/jungDetail.jsp?name=<%=name%>&unq=<%=unq%>"> <%=title %></a><br>
   <a class="a2" href="../sogea/jungDetail.jsp?name=<%=name%>&unq=<%=unq%>">   작성자 : UN난민기구</a><br>
<a class="a2" href="../sogea/jungDetail.jsp?name=<%=name%>&unq=<%=unq%>">     등록일 : <%=rdate %></a><p>
   </td>
<%
if(cn%4 == 0){
	  out.print("</tr><tr>");
}
cn++; 
} 
}        

          %>

</tr>

</table>
	 <p  class="p3">
               <%
               for(int i =1; i<=totalpage; i++){
            	   %>
            	   <a class="a1" href="jungList.jsp?pageNo=<%=i%>"><%=i %></a>
            	   
            	   <%
               }
               %>
      </p>
	</div>




	<%@ include file = "../include/footer.jsp" %>
	</div>

</body>
</html>