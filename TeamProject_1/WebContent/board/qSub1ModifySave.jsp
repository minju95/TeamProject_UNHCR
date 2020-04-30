<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<%
				/* 수정 처리를 위한 unq값의 데이터들 얻어오기 */
	String q_unq = request.getParameter("q_unq");
	String q_name = request.getParameter("q_name");
	String q_date = request.getParameter("q_date");
	String qtitle = request.getParameter("qtitle");
	String q_content = request.getParameter("q_content");
	
		/* 수정 처리 SQL 문 */
		
			String sql = " update question set "
			           + " q_name = '"+q_name+"', "
					   + " q_date = '"+q_date+"', "
					   + " qtitle = '"+qtitle+"', "
					   + " q_content = '"+q_content+"' "
					   + " where q_unq = '"+q_unq+"' ";
		
		int rs = stmt.executeUpdate(sql);
		
		if (rs > 0) {
%>	


		<script>
			if (confirm("수정하시겠습니까?")) {
				alert("수정 되었습니다.");
				location = "qSub1.jsp?top=board";
			}
		</script>

<%
	}
%>
