<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="conn.ConnectDB" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	Connection conn1 = ConnectDB.connect();
	Statement box3_stmt = conn1.createStatement();
%>

<%
	String sql1 = " select unq,name,title from faq1 "
				+ " order by unq desc "
			    + " limit 0,5 ";

			ResultSet rs1 = box3_stmt.executeQuery(sql1);
			
	String sql2 = " select unq,name,title from faq2 "
				+ " order by unq desc limit 0,5 ";
	Statement box3_stmt2 = conn1.createStatement();
			ResultSet rs2 = box3_stmt2.executeQuery(sql2);
			
			
	String sql3 = " select unq,name,title from faq3 "
				+ " order by unq desc limit 0,5 ";
		Statement box3_stmt3 = conn1.createStatement();
			ResultSet rs3 = box3_stmt3.executeQuery(sql3);
			
	String sql4 = " select unq,name,title from faq4 "
				+ " order by unq desc limit 0,5 ";
		Statement box3_stmt4 = conn1.createStatement();
			ResultSet rs4 = box3_stmt4.executeQuery(sql4);
			
			
			String view = request.getParameter("view");
%>
	<form name="frm" method="get" action="<%request.getRequestURL();%>">
			<div style="font-size:20px;padding:25px;">
			| <span><a href="../main/main.jsp?top=board">후원</a></span> |
			<span><a href="../main/main.jsp?top=board&view=2">홈페이지</a></span> |
			<span><a href="../main/main.jsp?top=board&view=3">연말정산</a></span> |
			<span><a href="../main/main.jsp?top=board&view=4">활동</a></span> |
			<%
				if ("2".equals(view)) {
			%>
			<span style="font-size:15px;margin-left:150px;"><a href="../faq2/faqSub2.jsp?top=board">더보기..</a></span>
			<%
				} else if ("3".equals(view)) {
			%>
			<span style="font-size:15px;margin-left:150px;"><a href="../faq3/faqSub3.jsp?top=board">더보기..</a></span>
			<%
				} else if ("4".equals(view)) {
			%>
			<span style="font-size:15px;margin-left:150px;"><a href="../faq4/faqSub4.jsp?top=board">더보기..</a></span>
			<%
				} else {
			%>
			<span style="font-size:15px;margin-left:150px;"><a href="../faq1/faqSub1.jsp?top=board">더보기..</a></span>
			<%
				}
			%>
			</div>
			
			
			<div style="font-size:16px;padding:5px;color:#0072bc;">
						
	
				
				<%		
				 if ("2".equals(view)) {
					while (rs2.next()) {
						String unq = rs2.getString("unq");
						String name = rs2.getString("name");
						String title = rs2.getString("title");
				%>
					<ul>
						<li>
							<input type="hidden" name="unq" value="<%=unq %>">
							| <span style="font-weight:bold;"><%=name %></span> |
							<span><a href="../faq2/faqSub2Detail.jsp?top=board&unq=<%=unq %>"><%=title %></a></span>
						</li>
					</ul>
					<br>
				<%
					}
				} else if ("3".equals(view)) {
					while (rs3.next()) {
						String unq = rs3.getString("unq");
						String name = rs3.getString("name");
						String title = rs3.getString("title");
				%>
						<ul>
						<li>
							<input type="hidden" name="unq" value="<%=unq %>">
							| <span style="font-weight:bold;"><%=name %></span> |
							<span><a href="../faq3/faqSub3Detail.jsp?top=board&unq=<%=unq %>"><%=title %></a></span>
						</li>
					</ul>
					<br>
				<%
					}
				} else if ("4".equals(view)) {
					while (rs4.next()) {
						String unq = rs4.getString("unq");
						String name = rs4.getString("name");
						String title = rs4.getString("title");
				%>
					<ul>
						<li>
							<input type="hidden" name="unq" value="<%=unq %>">
							| <span style="font-weight:bold;"><%=name %></span> |
							<span><a href="../faq4/faqSub4Detail.jsp?top=board&unq=<%=unq %>"><%=title %></a></span>
						</li>
					</ul>
					<br>
				<%
					}
				} else {			
					while (rs1.next()) {
						String unq = rs1.getString("unq");
						String name = rs1.getString("name");
						String title = rs1.getString("title");
				%>
					
					<ul>
						<li>
							<input type="hidden" name="unq" value="<%=unq %>">
							| <span style="font-weight:bold;"><%=name %></span> |
							<span><a href="../faq1/faqSub1Detail.jsp?top=board&unq=<%=unq %>"><%=title %></a></span>
						</li>
					</ul>
					<br>
				<%
					}
				}
				%>
			</div>

	</form>
</body>
</html>