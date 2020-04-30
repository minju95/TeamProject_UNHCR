<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

	<!-- 
			- DB연결
			- mSub1Write의 데이터 값 request.getParameter로 가져오기
			- SQL insert 처리
			- 자바스크립트로 메시지창 출력 후 mSub1.jsp (리스트)로 이동
	 -->

<%

	String sessionid = (String)session.getAttribute("SessionUserid");

	String name = request.getParameter("name");
	String date = request.getParameter("date");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String sql = "insert into member(name,date,title,content,userid) "
			   + " values ('"+name+"','"+date+"','"+title+"','"+content+"','"+sessionid+"') ";
		stmt.executeUpdate(sql);
%>

	<script>
		if (confirm("등록하시겠습니까?")) {
			alert("등록되었습니다.");
			location="mSub1.jsp?top=board";
		}
	</script>