<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>
<%
String ssesionId = (String)session.getAttribute("SessionUserid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<script src="../js/jquery-1.12.4.js"></script>
<script src="../js/jquery-ui.js"></script>
<title>회원가입</title>
</head>
  <script>
  	$( function() {
    	$( "#birthday" ).datepicker( {
			changeMonth: true,
			changeYear: true
    	} );
  	} );
  </script>
<style>

.w_table { 
	border:1px solid #0072BC;
	border-radius:10px;
	background-color:rgb(231,231,230);
	width:50%;
	font-size:18px;
	margin-top:20px;
	margin-left:250px;
	line-height:40px;
}
.w_table input {
	height:25px;
	font-size:15px;
	border-radius:5px;
}
/*.member_input{
	width:200px;
	height:50px;
	display: inline-block;
	cursor: pointer;
	margin-top:40px;
	margin-left:400px;
	border-radius:5px;
	font-size:20px;
}*/
.member_top{
	font-weight:bold;
	font-size:30px;
	text-align:center;
	padding-top:50px;
	color:#464646;
}
.member_btn {
	position:absolute;
	margin-top:-30px;
	margin-left:250px;
	font-weight:bold;
	font-size:24px;
	line-height:2.0;
	width:500px;
	height:50px;
	display:inline-block;
	background-color:#0072BC;
	color:white;
}

</style>
<script>
function fn_memberSubmit() {
	  /* 데이터 유효성 체크    */
	var f = document.frm;
	if(f.userid.value == "") {
		alert("아이디를 입력해주세요.");
		f.userid.focus();
		return false;
	}
	if(f.pass.value == "") {
		alert("패스워드를 입력해주세요.");
		f.pass.focus();
		return false;
	}
	if(f.name.value == "") {
		alert("이름을 입력해주세요.");
		f.name.focus();
		return false;
	}
	if(f.gender.value == "") {
		alert("성별을 체크해주세요.");
		return false;
	}
	if(f.birthday.value == "") {
		alert("생년월일을 입력해주세요.");
		return false;
	}
	if(document.getElementById('pass').value != document.getElementById('passChk').value) {
		alert("비밀번호를 확인해주세요.")
		return false;
	}
	f.submit();
}

function fn_popup() {
	var idCheck = "";
	var id = document.frm.userid.value;
		if(id == "") {
			alert("아이디를 입력해주세요.");
			document.frm.userid.focus();
			return false;
		}
	var url = "idcheck.jsp?userid="+id;
	window.open(url,'popup','width=400,height=150');
}

function fn_post() {
	var url = "../member/post1.jsp";
	window.open(url,'post','width=400,height=180');
}

function fn_isSame() {
	var pass = document.frm.pass.value;
	var passChk = document.frm.passChk.value;
	if(pass.length < 6 || pass.length > 16) {
		window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
		document.getElementById('pass').value=document.getElementById('passChk').value='';
		document.getElementById('same').innerHTML='';
	}
	if(document.getElementById('pass').value != '' && document.getElementById('passChk').value != '') {
		if(document.getElementById('pass').value == document.getElementById('passChk').value) {
			document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('same').style.color='blue';
		} else {
			document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('same').style.color='red';
		}
	}
	
}
</script>
<body>
<%@ include file = "../include/topmenu.jsp" %>
<form name="frm" method="post" action="../member/memberWriteSave.jsp">
<div id="content2" style="height:700px;">
	<div class="member_top">회원가입</div>
	<table class="w_table">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="userid" maxlength="20" placeholder="아이디를 입력하세요.">
				<input type="button" value="중복체크" onclick="fn_popup()">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pass" id="pass" placeholder="6~16자리 입력" 
						onchange="fn_isSame()"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="passChk" id="passChk" 
						placeholder="6~16자리 입력" onchange="fn_isSame()">
		<tr style="line-height:10px;">
			<td colspan="2" align=center><span id="same" style="font-size:15px;"></span></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" value="M" checked>&nbsp;남
				&nbsp;&nbsp;&nbsp;
				<input type="radio" name="gender" value="F">&nbsp;여
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" name="birthday" id="birthday" readonly>
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<input style="width:50px;" type="text" name="phone1">&nbsp;-
				<input style="width:50px;" type="text" name="phone2">&nbsp;-
				<input style="width:50px;" type="text" name="phone3">
			</td> 
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="post">
				<input type="button" 
				value="우편번호" onclick="fn_post()">
				<br>
				<input type="text" name="addr" style="width:98%;">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email1">
				@
				<select name="email2">
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="hanmail.net">hanmail.net</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>&nbsp;</th>
			<td>&nbsp;</td>
		</tr>
	</table>
	<a href="#" class="member_btn" type="submit" onclick="fn_memberSubmit(); return false;">회원 가입 하기</a>
</div>
</form>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>