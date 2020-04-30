<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String top = request.getParameter("top");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/leftmenu.css">
<title>leftmenu</title>
</head>
<body>
<div class="dropdown">
	<p style="font-weight:bold; font-size:30px; text-align:center;">
  	<%
  	     if("donate".equals(top)) out.print("후원"); 
	else if("volunteer".equals(top)) out.print("봉사활동 참여"); 
	else if("sogea".equals(top)) out.print("소개");
	else if("board".equals(top)) out.print("고객센터");
	%>
	</p>
	<br>
  <%if("donate".equals(top))
  {
  %>
  <button onclick="location='../donate/donate.jsp?top=donate'" class="dropbtn">후원하기</button>
  <div id="myDropdown_1" class="dropdown-content">
  </div><br>
  <button onclick="myFunction(2)" class="dropbtn">후원정보</button>
  <div id="myDropdown_2" class="dropdown-content">
    <a href="../donate/donate_info.jsp?top=donate">후원정보 조회</a>
  </div><br>
  <button onclick="myFunction(3)" class="dropbtn">회원정보</button>
  <div id="myDropdown_3" class="dropdown-content">
    <a href="../member/memberInfo.jsp?top=donate">기본정보 조회/변경</a>
    <a href="../member/memberDeletePage.jsp?top=donate">회원 탈퇴 요청</a>
  </div>
  <%
  }
  else if("volunteer".equals(top))
  {
  %>
  <button onclick="myFunction(1)" class="dropbtn">봉사활동 참여</button>
  <div id="myDropdown_1" class="dropdown-content">
    <a href="../volunteer/intro.jsp?top=volunteer">봉사활동 안내</a>
    <a href="../volunteer/notice.jsp?top=volunteer">모집 공고</a>
    <a href="../volunteer/adminList.jsp?top=volunteer">관리자 게시판</a>
  </div><br>
 
  <%
  }
  else if("sogea".equals(top))
  {
  %>
 <button onclick="myFunction(1)" class="dropbtn">UNHCR 이란?</button>
  <div id="myDropdown_1" class="dropdown-content">
    <a href="../sogea/sogea.jsp?top=sogea">UNHCR 이란?</a>
    <a href="../sogea/sogea-1.jsp?top=sogea">로고</a>
    
  </div><br>
  <button onclick="myFunction(2)" class="dropbtn">역사와임무</button>
  <div id="myDropdown_2" class="dropdown-content">
    <a href="../sogea/sogea2.jsp?top=sogea">역사와임무</a>
    <a href="../sogea/sogea2-1.jsp?top=sogea">사명</a>
    <a href="../sogea/sogea2-2.jsp?top=sogea">UNHCR규정</a>
  </div><br>
   <button onclick="myFunction(3)" class="dropbtn">조직</button>
  <div id="myDropdown_3" class="dropdown-content">
    <a href="../sogea/sogea3.jsp?top=sogea">조직</a>
  
  </div><br>
   <button onclick="myFunction(4)" class="dropbtn">연락처 및 위치</button>
  <div id="myDropdown_4" class="dropdown-content">
    <a href="../sogea/sogea4.jsp?top=sogea">연락처 및 위치</a>
 
  </div><br>
  <button onclick="myFunction(5)" class="dropbtn">친선대사 정우성</button>
  <div id="myDropdown_5" class="dropdown-content">
    <a href="../sogea/sogea5.jsp?top=sogea">친선대사 정우성 임명</a>
    <a href="../sogea/jungList.jsp?top=sogea">친선대사 정우성 포토갤러리</a>

  </div>
  <%
  }
  else if("board".equals(top))
  {
  %>
  <button onclick="myFunction(1)" class="dropbtn">통합게시판</button>
  <div id="myDropdown_1" class="dropdown-content">
    <a href="../board/mSub1.jsp?top=board">자유게시판</a>
    <a href="../board/qSub1.jsp?top=board">1:1문의</a>
    
  </div><br>
  <button onclick="myFunction(2)" class="dropbtn">FAQ</button>
  <div id="myDropdown_2" class="dropdown-content">   
    <a href="../faq1/faqSub1.jsp?top=board">자주 묻는 질문</a>
  </div><br>
  </div>
  <%
  }
  %>
</div>
</body>
</html>