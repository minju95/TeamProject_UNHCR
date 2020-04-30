<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//관리자 세션 불러오기
String adminConfirm = (String)session.getAttribute("AdminConfirm");

//if(adminConfirm == null || "".equals(adminConfirm)) {
%>
<script>
//location="../main/main.jsp";
</script>
<%
//}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원봉사 - 관리자용 게시판(글 작성)</title>
</head>
<link rel="stylesheet"href="../css/layout.css">
<link rel="stylesheet" href="../css/leftmenu.css">

<script>
<%@ include file="../js/leftmenu.js"%>
</script>

<style>
.title {
width: 800px;
height: 60px;
margin: 0 auto;
line-height: 2.0;
margin-bottom: 20px;
}

.table1 {
width: 800px;
height: 500px;
margin: 0 auto;
border-collapse: collapse;
padding: 20px;
}
.table1 th {
width: 20%;
}

.textbox {
width:100%;
height: 25px;
font-size:14px;
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

<script>
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
<body>
<%@ include file = "../include/new_topmenu.jsp" %>
<div id="container">
<%@ include file = "../include/new_leftmenu.jsp" %>
<%@ include file = "../include/rightmenu.jsp" %>

<div>

<div id="content2">
<form name="frm" method="post" action="adminWriteSave.jsp">
	<div class="title">
		<h1>관리자 게시판</h1>
	</div>
	
	<table class="table1" border="1">
		<tr>
			<th style="background-color: #EEEEED;">봉사기관명</th>
			<td><input type="text" class="textbox" name="v_name"></td>
		</tr>
		<tr>
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
		<tr>
			<th style="background-color: #EEEEED;">게시글 제목</th>
			<td><input type="text" class="textbox" name="v_title"></td>
		</tr>
		<tr>
			<th style="background-color: #EEEEED;">봉사활동 내용</th>
			<td><textarea name="v_content" rows="20" cols="100%" placeholder="내용을 입력해주세요."></textarea></td>
		</tr>
		<tr>
			<th style="background-color: #EEEEED;">모집 시작일</th>
			<td><input type="text" class="textbox" name="v_sdate" id="datepicker1"></td>
		</tr>
		<tr>
			<th style="background-color: #EEEEED;">모집 종료일</th>
			<td><input type="text"class="textbox" name="v_edate" id="datepicker2"></td>
		</tr>
		<tr>
			<th style="background-color: #EEEEED;">공개 여부</th>
			<td>
			<select name="v_state">
				<option value="1">공개</option>
				<option value="2" selected>비공개</option>
			</select>
			</td>
		</tr>
	</table>
	<div class="button_area">
	<input type="submit" class="button" style="margin-left: 200px;"onclick="fn_submit(); return false;" value="저장">
	<input type="reset" class="button" value="초기화">
	<input type="button" class="button" onclick="location='adminList.jsp?top=volunteer';" value="목록">
	</div>
	
</form>
	
	</div>
	</div>
	</div>
<div id="footer">
<p>유엔난민기구는 난민을 보호하고 영구적인 해결방안을 모색하는 비정치적-인도주의적 유엔기구입니다.</p>
<p>유엔난민기구(UNHCR) 고유번호 104-84-05025 | 대표자 : 제임스 린치 | Tel : 02-773-7701</p>
</div>
</body>
</html>