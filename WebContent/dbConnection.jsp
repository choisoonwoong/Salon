<%@page import="oracle.net.nt.ConnectDescription"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB연동 페이지</title>
</head>
<body>
<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "";
	String sql2 = "";
	String sql3 = "";
	String sql4 = "";
	String sql5 = "";
	String sql6 = "";
	PreparedStatement pstmt;
	PreparedStatement pstmt2;
	PreparedStatement pstmt3;
	PreparedStatement pstmt4;
	PreparedStatement pstmt5;
	PreparedStatement pstmt6;
	ResultSet rs;
	ResultSet rs2;
	ResultSet rs3;
	ResultSet rs4;
	ResultSet rs5;
	ResultSet rs6;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url,"hr","hr");
%>

</body>
</html>