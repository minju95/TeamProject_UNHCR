<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<%

	String sessionid = (String)session.getAttribute("SessionUserid");

	/*
		댓글 작성한 데이터 불러오기
	*/
	
		
		String qunq = request.getParameter("qunq"); // fid 값이 될 unq
		
		String qname = request.getParameter("qname");
		String qdate = request.getParameter("qdate");
		String qcontent = request.getParameter("qcontent");
		
		
		/*
			INSERT SQL 쿼리
		*/
		
			String sql = " insert into question_reply(qname,qdate,qcontent,qfid,quserid) "
			           + " values('"+qname+"',now(),'"+qcontent+"','"+qunq+"','"+sessionid+"') ";
	stmt.executeUpdate(sql);
	//out.print(sql);
%>
	<script>
		alert("댓글이 등록되었습니다.");
		self.close();
	</script>
	


