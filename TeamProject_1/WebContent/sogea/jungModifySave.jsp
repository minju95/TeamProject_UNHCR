<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>

<%@ include file="../include/dbcon.jsp" %>

<%
String RealPath= "C:/workspace/timproject/WebContent/";
String path = "/uploadfile";
String uploadpath = request.getRealPath(path);
int maxsize = 1024 * 1024 * 10; // 10M

MultipartRequest multi = new MultipartRequest
		(request,uploadpath,maxsize,"utf-8",
					new DefaultFileRenamePolicy());
String unq = multi.getParameter("unq");
String title = multi.getParameter("title");
String content = multi.getParameter("content");
String oldname = multi.getParameter("oldname");


Enumeration files = multi.getFileNames();
int filesize = 0;


String file = (String) files.nextElement();
String orgName = multi.getFilesystemName(file); // 대

if(!"".equals(orgName)&& orgName !=null){
	String delpath = RealPath+path+oldname;
	File f = new File(delpath);
	f.delete();
}else{
	orgName = oldname;
}



String sql = "update jung set "
            + " title='"+title+"', "
            + " content='"+content+"', "
            + " title='"+title+"', "
            + " imgname='"+orgName+"', "
            + " imgpath='"+path+"' "
            + " where unq='"+unq+"'";

//out.print(sql);


stmt.executeUpdate(sql);

//out.print(sql2);

/*String sql2 = "insert into goods("+columns+") "
            + "values("
            + "  '"+code+"', "
            + "  '"+gname+"', "
            + "  '"+catecode+"', "
            + "  '"+title+"', "
            + "  '"+price+"', "
            + "  '"+maker+"', "
            + "  '"+content+"', "
            + "  '"+orgName1+"', "
            + "  '"+orgName2+"', "
            + "  '"+path+"', "
            + "  '"+path+"', "
            + "  '"+recyn+"', "
            + "  '"+state+"'  "
            + ")";*/
            
            
            
  //stmt.executeUpdate(sql2);
%>
 <script>
  alert("저장완료");
  location = "jungWrite.jsp";
 </script>



    