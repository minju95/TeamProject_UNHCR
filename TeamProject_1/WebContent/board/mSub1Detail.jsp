<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>
<%@ page import="java.util.Calendar"%>

<%
	String sessionid = (String)session.getAttribute("SessionUserid");
	String admin = (String)session.getAttribute("AdminConfirm");
	
	if (sessionid == null) {
%>
	<script>
		alert("로그인 후 이용해주세요.");
		history.back();
	</script>
<%
		return;
	}
%>

<%
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH)+1;
		int d = cal.get(Calendar.DATE);
		
			cal.set(y,m,d);
		
		String yy = Integer.toString(y);
		String mm = Integer.toString(m);
		String dd = Integer.toString(d);
		
		String date = yy + "-" + "0" +  mm + "-" +  dd;
		
		
		
		// 제목을 누르면 그에 해당하는 unq 불러오기
	String unq = request.getParameter("unq");
	
				/* 제목을 클릭 했을때 이 unq값의 hit이 +1씩 증가 */
		stmt2.executeUpdate("update member set hit = hit+1 where unq = '"+unq+"' ");
				
				/* 제목을 클릭한 해당 unq의 데이터들 불러오기 */
		String sql = " select name,date,title,content,userid from member "
				   + " where unq = '"+unq+"' ";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
			String name = rs.getString("name");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String date1 = rs.getString("date");
			String userid = rs.getString("userid");
			
			content = content.replaceAll("\n","<br>");
			
		/* 
			댓글 데이터 가져오기
		*/	
			
		String sql2 = " select runq,ruserid,rname,rdate,rcontent,rfid from member_reply "
				    + " where rfid = '"+unq+"' order by runq desc ";
			ResultSet rs2 = stmt.executeQuery(sql2);
			
			
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mSub1Detail</title>
</head>

	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/leftmenu.css">
	
<script>

		<%@ include file="../js/leftmenu.js"%>

	function fn_modify() {
		var url = "mSub1Modify.jsp?top=board&unq=<%=unq %>";
		location= url;
	}
	function fn_delete() {
		var url = "mSub1Delete.jsp?unq=<%=unq %>";
			if (confirm("삭제하시겠습니까?")) {
				location = url;
			}
	}
	function fn_reply() {
		
		var width = "600";
		var height = "400";
		
		/* 팝업 창 가운데 생성 방법 */
		var left = Math.ceil(( window.screen.width - width )/2);
	    var top = Math.ceil(( window.screen.height - height )/2);

		var url = "mSub1ReplyWrite.jsp?unq=<%=unq %>";
			window.open(url,'reply',' width='+width+',height='+height+',left='+left+',top='+top+' ');
	}

</script>

<style>
	#content2 {
		overflow:scroll;
	}
	
	.p1 {
		text-align:center;
		font-size:22px;
		font-weight:bold;
		font-family:맑은 고딕;
		color:lightblue;
	}
</style>



<body>
<div id="header">
	<%@ include file = "../include/topmenu.jsp" %>
	<%@ include file = "../include/leftmenu.jsp" %>
		
<div id="content2">
	
	
	<!-- 
								        등록 UI 출력
								        번호 : 출력만 되게 함
								        이름 : 출력만 되게 함
								        날짜 : 출력만 되게 함
								        제목 : 직접 작성 (100자 이내)
								        내용 : 직접 작성 (2000자 이내)
								        공개/비공개 : select문으로 택1
					      						-->
	<div class="box">								
	<br><br>
	
	<div class="contentMain" style="text-align:center;color:#0072bc;font-weight:bold;">게시글</div>
	<br>
	<br>
	<br>
		<table cellspacing="1" bgcolor="#cccccc" width="600" align="center">
			<tr bgcolor="#ffffff">
				<th height="7%" width="100" height="150" bgcolor="skyblue">이름</th>
				<td  class="con" style="padding:5px;"><%=name %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="7%" bgcolor="skyblue">날짜</th>
				<td  class="con" style="padding:5px;"><%=date %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="7%" bgcolor="skyblue">제목</th>
				<td  class="con" style="padding:5px;"><%=title %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="49%" bgcolor="skyblue">내용</th>
				<td class="con" style="vertical-align:top;padding:5px;"><%=content %></td>
			</tr>
					
		</table>
		<br>
			<div align="center">
			<%
				if (userid.trim().equals(sessionid) || admin != null) {
			%>
				<button type="button" style="width:50px;height:30px;" onclick="fn_modify()">수정</button>
				&nbsp;
				<button type="button" style="width:50px;height:30px;" onclick="fn_delete()">삭제</button>
				&nbsp;
			<%
				}
			%>
				<button type="button" style="width:50px;height:30px;" onclick="history.back()">뒤로</button>
				&nbsp;
				<button type="button" style="width:50px;height:30px;" onclick="fn_reply()">댓글</button>
				
			</div>			
	</div>
	
	<br>
	<br>
	<br>
	
	<p class="p1">
		댓글
	</p>
	<p align="center" style="font-size:10px; color:red;">(* 이름을 클릭하면 삭제됩니다.) </p>
	<div style="width:1000px; height:10px; margin:0 auto; background-color:lightblue;">
		.
	</div>
	
	<br>
	<br>
			<!-- 댓글 출력 구현 -->
	<div>
		
			<%
				while (rs2.next()) {
					String runq = rs2.getString("runq");
					String rname = rs2.getString("rname");
					String rdate = rs2.getString("rdate");
					String rcontent = rs2.getString("rcontent");
					String rfid = rs2.getString("rfid");
					String ruserid = rs2.getString("ruserid");
					
					rcontent = rcontent.replaceAll("\n","<br>");
					rdate = rdate.substring(0,16);
					
			%>
			<table border="0" cellspacing="1" bgcolor="#cccccc" width="600" align="center">
			<tr bgcolor="#ffffff">
				<th width="100" bgcolor="lightblue">이름</th>
				<td style="padding:5px;">
				<%
					if (ruserid.trim().equals(sessionid.trim()) || admin != null) {
				%>
					<a href="mSub1ReplyDelete.jsp?runq=<%=runq %>&rfid=<%=rfid %>&gubun=D"><%=rname %></a> / <%=rdate %>
				<%
					} else {
				%>
					<%=rname %> / <%=rdate %>
				<%
					}
				%>
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="50" bgcolor="lightblue">내용</th>
				<td style="vertical-align:top;padding:5px;">
					<%=rcontent %>
				</td>
			</tr>
			
			<br>
				
			</table>
			<%
				}
					
			%>
	</div>

</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>