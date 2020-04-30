<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
<%
String id = "root";
String pass = "apmsetup";
String url = "jdbc:mysql://localhost:3306/Project1?useUnicode=true&characterEncoding=utf8";
//접속 드라이브 연결
Class.forName("com.mysql.jdbc.Driver");
//DB 접속(로그인) 정보
Connection conn = DriverManager.getConnection(url,id,pass);
//인스턴스화
Statement stmt = conn.createStatement();
Statement stmt2 = conn.createStatement();
%>