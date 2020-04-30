<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<%
				/* 수정 처리를 위한 unq값의 데이터들 얻어오기 */
	String unq = request.getParameter("unq");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
		/* 수정 처리 SQL 문 */
		
			String sql = " update faq3 set "
			           + " name = '"+name+"', "
					   + " title = '"+title+"', "
					   + " content = '"+content+"' "
					   + " where unq = '"+unq+"' ";
		
		int rs = stmt.executeUpdate(sql);
		
		if (rs > 0) {
%>	


		<script>
			if (confirm("수정하시겠습니까?")) {
				alert("수정 되었습니다.");
				location = "faqSub3Detail.jsp?top=board&unq=<%=unq %>";
			}
		</script>

<%
	}
%>
