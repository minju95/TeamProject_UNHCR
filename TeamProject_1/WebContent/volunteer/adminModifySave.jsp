<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@ include file="../include/dbcon.jsp" %>
    
<%
String unq = request.getParameter("unq");

String name = request.getParameter("v_name");
String rdate = request.getParameter("v_rdate");
String title = request.getParameter("v_title");
String content = request.getParameter("v_content");
String sdate = request.getParameter("v_sdate");
String edate = request.getParameter("v_edate");
String state = request.getParameter("v_state");
String region = request.getParameter("v_region");


content= content.replaceAll("\n","<br>"); // 줄바꿈처리
content= content.replaceAll("'","&#39;"); // 작은 따옴표

//봉사 모집 시작일
Calendar cal1 = Calendar.getInstance();
String[] str1 = sdate.split("-");
int y1 = Integer.parseInt(str1[0]);
int m1 = Integer.parseInt(str1[1]);
int d1 = Integer.parseInt(str1[2]);

cal1.set(y1,m1,d1);

//봉사 모집 종료일
Calendar cal2 = Calendar.getInstance();
String[] str2 = edate.split("-");
int y2 = Integer.parseInt(str2[0]);
int m2 = Integer.parseInt(str2[1]);
int d2 = Integer.parseInt(str2[2]);

cal2.set(y2,m2,d2);

int result = cal1.compareTo(cal2); //cal1>cal2(1), cal1=cal2(0), cal1<cal2 (-1)


if(result>0) {
%>
<script>
alert("날짜 설정이 잘못되었습니다.");
history.back();
</script>
<%
return;
}
String sql ="UPDATE v_board SET "
			+"v_name='"+name+"', "
			+"v_rdate= curdate(), "
			+"v_title='"+title+"', "
			+"v_content='"+content+"', "
			+"v_sdate='"+sdate+"', "
			+"v_edate='"+edate+"', "
			+"v_state='"+state+"', "
			+"v_region='"+region+"' "
			+"WHERE v_unq = '"+unq+"' ";
stmt.executeUpdate(sql);
%>
<script>
alert("게시글 수정을 완료하였습니다.");
location="adminList.jsp"
</script>
