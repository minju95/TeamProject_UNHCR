<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>
<%@ page import="java.util.Calendar"%>



<%

	String sessionid = (String)session.getAttribute("SessionUserid");

	if (sessionid == null) {
%>
	<script>
		alert("로그인 후 이용해주세요.");
		location = "../volunteer/login.jsp";
	</script>
<%
		return;
	}
%>
	
<%

             // Calendar 클래스 인스턴스화 하여 현재 날짜 가져오기
             
	Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH);
		int d = cal.get(Calendar.DATE);
		
		cal.set(y,m+1,d);
		
		String yy = Integer.toString(y);
		String mm = Integer.toString(m+1);
		String dd = Integer.toString(d);
		
		// 2020-01-01  --> yy(4)-mm(2)-dd(2) 하기 위한 코딩
		String date = yy + "-" + 0+mm + "-" + dd;
		// 11월 부터는 0이 앞에 들어가지 않도록 서브스트링을 통해 시작을 0이 아닌 1로 시작
		
		/*
				< 생략  >
			if (m > 10) {
				mm = mm.substring(1,mm.length());
			}
		*/
		String sql = " select name from member_info where userid = '"+sessionid+"' ";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		String name = rs.getString("name");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>

		<link rel="stylesheet" href="../css/layout.css">
		<link rel="stylesheet" href="../css/leftmenu.css">
</head>
<script>	
	<%@ include file="../js/leftmenu.js"%>
</script>

<script>
	function fn_write() {
		var f = document.frm;
		var len = f.q_content.length;
		
		if (f.qtitle.value = "") {
			alert("제목을 입력해주세요.");
			f.qtitle.focus();
			return false;
		} else if (f.q_content.value == "") {
			alert("내용을 입력해주세요.");
			f.q_content.focus();
			return false;
		} else if (len > 1000) {
			alert("1000자 이내로 작성해주세요.");
			f.q_content.focus();
			return false;
		}
			f.submit();
	}
</script>

<body>
<div id="header">
	<%@ include file = "../include/topmenu.jsp" %>
	<%@ include file = "../include/leftmenu.jsp" %>

	
<div id="content2">
	<form name="frm1" method="post" action="qSub1WriteSave.jsp">

	<div class="box">
								<!-- 
								        등록 UI 출력
								        번호 : 출력만 되게 함
								        이름 : 출력만 되게 함
								        날짜 : 출력만 되게 함
								        제목 : 직접 작성 (100자 이내)
								        내용 : 직접 작성 (2000자 이내)
								        공개/비공개 : select문으로 택1
					      						-->
	<br>
	<br>
	<br>
	<div class="contentMain" style="text-align:center;color:#0072bc;font-weight:bold;font-size:20px;">관리자와의 1:1 문의</div>
	<br>
	<br>
	<br>
		<table cellspacing="1" bgcolor="#cccccc" width="600" height="400" align="center">
			<input type="hidden" name="q_userid" value="<%=sessionid %>">
			<tr bgcolor="#ffffff">
				<th height="7%" width="100" height="150" bgcolor="skyblue">이름</th>
				<td>  
					<input type="hidden" name="q_name" value="<%=name %>" style="width:98.3%;height:70%;padding:5px;"><%=name %>   <!-- 회원가입 기능 완성되면 이름 readonly -->
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="7%" bgcolor="skyblue">날짜</th>
				<td>
					<input type="hidden" name="q_date" style="width:98.3%;height:70%;padding:5px;" value="<%=date %>"><%=date %>
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="7%" bgcolor="skyblue">제목</th>
				<td><input type="text" name="qtitle" style="width:97.8%;height:70%;padding:5px;"></td>
			</tr>
			<tr bgcolor="#ffffff">
				<th height="49%" bgcolor="skyblue">내용</th>
				<td>
					<textarea name="q_content" style="width:97.8%;height:96.3%;padding:5px;"></textarea>
				</td>
			</tr>
		</table>
		<br>
			<div align="center">
				<button type="submit" style="width:50px;height:30px;" onclick="fn_write(); return false;">등록</button>
				&nbsp;
				<button type="button" style="width:50px;height:30px;" onclick="history.back()">뒤로</button>
			</div>
	</div>
	</form>	
</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>