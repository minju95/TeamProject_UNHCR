<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

	<!-- 
			- DB연결
			- qSub1Write의 데이터 값 request.getParameter로 가져오기
			- SQL insert 처리
			- 자바스크립트로 메시지창 출력 후 qSub1.jsp (리스트)로 이동
	 -->

<%

		String sessionid = (String)session.getAttribute("SessionUserid");


	String name = request.getParameter("q_name");
	String date = request.getParameter("q_date");
	String title = request.getParameter("qtitle");
	String content = request.getParameter("q_content");
	
	String sql = "insert into question(q_name,q_date,qtitle,q_content,q_userid) "
			   + " values ('"+name+"','"+date+"','"+title+"','"+content+"','"+sessionid+"') ";
		stmt.executeUpdate(sql);
		//out.print(sql);
%>

	<script>
		if (confirm("등록하시겠습니까?")) {
			alert("등록되었습니다.");
			location="qSub1.jsp?top=board";
		}
	</script>