<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp"%>

<% 
String prev_url = request.getParameter("prev_url");
String userid = request.getParameter("userid");
String pwd = request.getParameter("pass");
// 사용자가 입력한 userid 와 pwd가 member 테이블에 존재하는지 체크 (select문 - count)
String sql = "SELECT count(*) cnt FROM member_info "
		   + "WHERE userid = '"+userid+"' and pass = '"+pwd+"' ";

ResultSet rs = stmt.executeQuery(sql); 
rs.next();

int cnt = rs.getInt("cnt");

// 데이터가 존재 하지 않을 경우 (아이디 비번 틀림)
if(cnt == 0) {
%>
	<script>
	alert("가입 되지 않은 회원 입니다.");
	history.back();
	</script>
<%	
	return;
}


sql = " select count(*) cnt from member_info "
		+ " where userid='"+userid+"' and pass='"+pwd+"' and gubun='2' ";
	ResultSet rs1 = stmt.executeQuery(sql);
	rs1.next();
	cnt = rs1.getInt("cnt");
// 데이터 존재 할 경우 세션 생성
session.setAttribute("SessionUserid",userid);
if(cnt > 0){
	session.setAttribute("AdminConfirm","Y");
}
session.setMaxInactiveInterval(60*60); //세션 지속시간
%>
<script>
alert("<%=userid%> 님 로그인 되었습니다.");
location.href="<%=prev_url%>";
</script>