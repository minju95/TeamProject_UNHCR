<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<%

	String sessionid = (String)session.getAttribute("SessionUserid");

	/*
		댓글 작성한 데이터 불러오기
	*/
	
		
		String runq = request.getParameter("runq"); // fid 값이 될 unq
		
		String rname = request.getParameter("rname");
		String rdate = request.getParameter("rdate");
		String rcontent = request.getParameter("rcontent");
		
		
		/*
			INSERT SQL 쿼리
		*/
		
			String sql = " insert into member_reply(rname,rdate,rcontent,rfid,ruserid) "
			           + " values('"+rname+"',now(),'"+rcontent+"','"+runq+"','"+sessionid+"') ";
	stmt.executeUpdate(sql);
	//out.print(sql);
%>
	<script>
		alert("댓글이 등록되었습니다.");
		self.close();
	</script>
	


