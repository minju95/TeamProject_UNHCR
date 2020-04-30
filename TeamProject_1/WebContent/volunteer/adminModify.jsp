<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp" %>

<%

//관리자 세션 불러오기
String adminConfirm = (String)session.getAttribute("AdminConfirm");
//if(adminConfirm == null || "".equals(adminConfirm)) {
%>
<script>
//location = "../main/main.jsp";
</script>
<%	
//}
String unq = request.getParameter("unq");

String sql ="SELECT v_name, "
				+"v_rdate, "
				+"v_title, "
				+"v_content, "
				+"v_sdate, "
				+"v_edate, "
				+" case "
						+" WHEN v_region='1' THEN '서울' "
						+" WHEN v_region='2' THEN '경기' "
						+" WHEN v_region='3' THEN '인천' "
						+" WHEN v_region='4' THEN '강원도' "
						+" WHEN v_region='5' THEN '대전' "
						+" WHEN v_region='6' THEN '충청북도' "
						+" WHEN v_region='7' THEN '충청남도' "
						+" WHEN v_region='8' THEN '세종' "
						+" WHEN v_region='9' THEN '대구' "
						+" WHEN v_region='10' THEN '부산' "
						+" WHEN v_region='11' THEN '울산' "
						+" WHEN v_region='12' THEN '경상북도' "
						+" WHEN v_region='13' THEN '경상남도' "
						+" WHEN v_region='14' THEN '광주' "
						+" WHEN v_region='15' THEN '전라북도' "
						+" WHEN v_region='16' THEN '전라남도' "
						+" WHEN v_region='17' THEN '제주도' "
						+" ELSE '0' "
						+"END as 'v_region' "
		+"FROM v_board WHERE v_unq = '"+unq+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String name = rs.getString("v_name");
String rdate = rs.getString("v_rdate");
String title = rs.getString("v_title");
String content = rs.getString("v_content");
String sdate = rs.getString("v_sdate");
String edate = rs.getString("v_edate");
String region = rs.getString("v_region");


content = content.replaceAll("<br>", "\r\n");
//DB내의 <br> ->  자바에서의 \n (정규표현식 사용)

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원봉사 - 모집 상세보기</title>
</head>
<link rel="stylesheet"href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">

<script>
<%@ include file="../js/leftmenu.js"%>

function fn_submit() {
	var f = document.frm;
	if(f.v_name.value == "") {
		alert("봉사기관명을 입력하세요.");
		return false;
	}
	if(f.v_title.value == "") {
		alert("게시글 제목을 입력하세요.");
		f.v_title.focus();
		return false;
	}
	if(f.v_sdate.value == "") {
		alert("모집 시작일을 입력하세요.");
		f.v_sdate.focus();
		return false;
	}
	if(f.v_edate.value == "") {
		alert("모집 종료일을 입력하세요.");
		f.v_region.focus();
		return false;
	}
	f.submit(); //전송함수
}

</script>

<link rel="stylesheet" href="../css/jquery-ui.css">

  <script src="../js/jquery-1.12.4.js"></script>
  <script src="../js/jquery-ui.js"></script>
  
  <script>
	 $( function() {
		    $( "#datepicker1" ).datepicker({  //#은 id 속성을 의미
		      changeMonth: true, //달을 select box로 출력
		      changeYear: true
		    } );
	} );
	 $( function() {
		    $( "#datepicker2" ).datepicker({  //#은 id 속성을 의미
		      changeMonth: true, //달을 select box로 출력
		      changeYear: true
		    } );
	} );	 
	 

  /*
  $( function() {
    $( "#datepicker1" ).datepicker();
    $( "#datepicker2" ).datepicker();
  } );
  */
  </script>

<style>
.title {
width: 800px;
height: 60px;
margin: 0 auto;
line-height: 2.0;
margin-bottom: 50px;
}

.table1 {
width: 800px;
height: 800px;
margin: 0 auto;
padding: 10px;
border-collapse: collapse;
}


.textbox {
padding: 2px;
}
.v_content {
width:100%;
height:100%;
overflow-x: auto; /*가로축의 경우, 스크롤 숨김*/
overflow-y: scroll; /*세로축의 경우, 스크롤 보이게*/
}

.button_area {
width: 700px;
height: 70px;
margin: 0 auto;
}

.button_area .button {
width: 70px;
height: 35px;
display: inline-block;
margin-top: 20px;
margin-left: 20px;
cursor: pointer;
}

</style>

<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id="container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<%@ include file = "../include/rightmenu.jsp" %>

<div>


<div id="content2">
	<div class="title">
		<h1>관리자 게시판</h1>
	</div>
	
	<form name="frm" method="post" action="adminModifySave.jsp?unq=<%=unq%>">
	<input type="hidden" name="unq" value="<%=unq%>">
	<table class="table1" border="1">
		<tr height="10%">
			<th style="background-color: #EEEEED;">제목</th>
			<td>
				<input type="text" size="70%" class="textbox" name="v_title" value="<%=title%>">
			</td>
		</tr>
		<tr height="5%">
			<th style="background-color: #EEEEED;">지역</th>
			<td><select name="v_region" >
				<option value="1">서울</option>
				<option value="2">경기</option>
				<option value="3">인천</option>
				<option value="4">강원도</option>
				<option value="5">대전</option>
				<option value="6">충청북도</option>
				<option value="7">충청남도</option>
				<option value="8">세종</option>
				<option value="9">대구</option>
				<option value="10">부산</option>
				<option value="11">울산</option>
				<option value="12">경상북도</option>
				<option value="13">경상남도</option>
				<option value="14">광주</option>
				<option value="15">전라북도</option>
				<option value="16">전라남도</option>
				<option value="17">제주도</option>
			</select></td>
		</tr>
		<tr height="5%">
			<th style="background-color: #EEEEED;">기관</th>
			<td>
				<input type="text" size="70%" class="textbox" name="v_name" value="<%=name%>">
			</td>
		</tr>
		<tr height="5%">
			<th style="background-color: #EEEEED;">모집기간</th>
			<td>
				<input type="text" class="textbox" id="datepicker1" name="v_sdate" value="<%=sdate%>"> ~ 
				<input type="text" class="textbox" id="datepicker2" name="v_edate" value="<%=edate%>">
			</td>
		</tr>
		<tr height="70%">
			<th style="background-color: #EEEEED;">내용</th>
			<td colspan="2"><textarea name="v_content" class="v_content" rows="30" cols="90"><%=content %></textarea></td>
		</tr>
		<tr height="5%">
			<th style="background-color: #EEEEED;">공개 여부</th>
			<td>
			<select name="v_state">
				<option value="1">공개</option>
				<option value="2" selected>비공개</option>
			</select>
			</td>
		</tr>
	</table>
	</form>
	
	<div class="button_area">
		<input type="button" class="button" style="margin-left: 300px;" onclick="location='adminList.jsp?top=volunteer'" value="목록">		
		<input type="submit"  class="button" onclick="fn_submit();  return false;" value="수정완료">
	</div>
	
	
</div> 
</div>
</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>