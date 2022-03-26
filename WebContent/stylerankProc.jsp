<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<link href ="common.css" rel="stylesheet" type="text/css">
<script src="day.js"></script>
<html>
<head>
<style>
graph {letter-spacing:-5px;}
table {font-size:20px;}
</style>
<meta charset="UTF-8">
<title>스타일별 조회 페이지</title>
<%
int year = Integer.parseInt(request.getParameter("yyear"));
int month = Integer.parseInt(request.getParameter("mmonth"));
%>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<br><br><br>
<h2 align="center"> <%=year %>년 <%=month %>월로 검색한 스타일별 매출조회</h2>
<table width="1200" height="300" align="center">
<%
	try {
	int cut1 = 0;
	int cut2 = 0;
	int dyeing1 = 0;
	int pama1 = 0;
	int pama2 = 0;
	int m1 = 0; /* 각 스타일별 카운트  */
	int m2 = 0; /* 각 스타일별 카운트  */
	int m3 = 0; /* 각 스타일별 카운트  */
	int m4 = 0; /* 각 스타일별 카운트  */
	int m5 = 0; /* 각 스타일별 카운트  */
	String graph1 = null; /* 각 스타일별 그래프 */
	String graph2 = null; /* 각 스타일별 그래프 */
	String graph3 = null; /* 각 스타일별 그래프 */
	String graph4 = null; /* 각 스타일별 그래프 */
	String graph5 = null; /* 각 스타일별 그래프 */
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String sql ="select distinct (select count(*) from company where c_money in (8000) and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) as student " +
",(select count(*) from company where c_money in (9000, 10000) and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) as cut " +
",(select count(*) from company where c_money in (15000, 24000, 25000, 29000, 34000, 39000) and " +
"substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) as dyeing1 " +
",(select count(*) from company where c_money in (32000, 40000) and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) as pama1 " +
",(select count(*) from company where c_money in (55000) and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) as pama2 " +
"from company where c_money = '8000' and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ? group by c_money, c_date";

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(url,"hr","hr");
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, year);
pstmt.setInt(2, month);
pstmt.setInt(3, year);
pstmt.setInt(4, month);
pstmt.setInt(5, year);
pstmt.setInt(6, month);
pstmt.setInt(7, year);
pstmt.setInt(8, month);
pstmt.setInt(9, year);
pstmt.setInt(10, month);
pstmt.setInt(11, year);
pstmt.setInt(12, month);
ResultSet rs = pstmt.executeQuery();	
rs.next();
	cut1 = rs.getInt(1); /* 학생컷  */
	cut2 = rs.getInt(2); /* 성인컷  */
	dyeing1 = rs.getInt(3); /* 염색 */
	pama1 = rs.getInt(4); /* 파마 */
	pama2 = rs.getInt(5); /* 파마+염색  */
	
	m1 = cut1/5;
	m2 = cut2/6;
	m3 = dyeing1/5;
	m4 = pama1/5;
	m5 = pama2/5;

	if (m1==0) {
		graph1 = "";
	}
	else if (m1==1) {
		graph1 = "■";
	}
	else if (m1==2) {
		graph1 = "■■";
	}
	else if (m1==3) {
		graph1 = "■■■";
	}
	else if (m1==4) {
		graph1 = "■■■■";
	}
	else if (m1==5) {
		graph1 = "■■■■■";
	}
	else if (m1==6) {
		graph1 = "■■■■■■";
	}
	else if (m1==7) {
		graph1 = "■■■■■■■";
	}
	else if (m1==8) {
		graph1 = "■■■■■■■";
	}
	else if (m1==9) {
		graph1 = "■■■■■■■■";
	}
	else if (m1==10) {
		graph1 = "■■■■■■■■■";
	}
	else if (m1==11) {
		graph1 = "■■■■■■■■■■";
	}
	else if (m1==12) {
		graph1 = "■■■■■■■■■■■";
	}
	else if (m1==13) {
		graph1 = "■■■■■■■■■■■■";
	}
	else if (m1==14) {
		graph1 = "■■■■■■■■■■■■■";
	}
	else if (m1==15) {
		graph1 = "■■■■■■■■■■■■■■";
	}
	else if (m1==16) {
		graph1 = "■■■■■■■■■■■■■■■";
	}
	else if (m1==17) {
		graph1 = "■■■■■■■■■■■■■■■■";
	}
	else if (m1==18) {
		graph1 = "■■■■■■■■■■■■■■■■■";
	}
	else if (m1==19) {
		graph1 = "■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==20) {
		graph1 = "■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==21) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==22) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==23) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==24) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==25) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==26) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==27) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==28) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==29) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==30) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==31) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==32) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==33) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==34) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==35) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==36) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==37) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==38) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==39) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1==40) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m1>40) {
		graph1 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	
	if (m2==0) {
		graph2 = "";
	}
	else if (m2==1) {
		graph2 = "■";
	}
	else if (m2==2) {
		graph2 = "■■";
	}
	else if (m2==3) {
		graph2 = "■■■";
	}
	else if (m2==4) {
		graph2 = "■■■■";
	}
	else if (m2==5) {
		graph2 = "■■■■■";
	}
	else if (m2==6) {
		graph2 = "■■■■■■";
	}
	else if (m2==7) {
		graph2 = "■■■■■■■";
	}
	else if (m2==8) {
		graph2 = "■■■■■■■";
	}
	else if (m2==9) {
		graph2 = "■■■■■■■■";
	}
	else if (m2==10) {
		graph2 = "■■■■■■■■■";
	}
	else if (m2==11) {
		graph2 = "■■■■■■■■■■";
	}
	else if (m2==12) {
		graph2 = "■■■■■■■■■■■";
	}
	else if (m2==13) {
		graph2 = "■■■■■■■■■■■■";
	}
	else if (m2==14) {
		graph2 = "■■■■■■■■■■■■■";
	}
	else if (m2==15) {
		graph2 = "■■■■■■■■■■■■■■";
	}
	else if (m2==16) {
		graph2 = "■■■■■■■■■■■■■■■";
	}
	else if (m2==17) {
		graph2 = "■■■■■■■■■■■■■■■■";
	}
	else if (m2==18) {
		graph2 = "■■■■■■■■■■■■■■■■■";
	}
	else if (m2==19) {
		graph2 = "■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==20) {
		graph2 = "■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==21) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==22) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==23) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==24) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==25) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==26) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==27) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==28) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==29) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==30) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==31) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==32) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==33) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==34) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==35) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==36) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==37) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==38) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==39) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2==40) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m2>40) {
		graph2 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}

	if (m3==0) {
		graph3 = "";
	}
	else if (m3==1) {
		graph3 = "■";
	}
	else if (m3==2) {
		graph3 = "■■";
	}
	else if (m3==3) {
		graph3 = "■■■";
	}
	else if (m3==4) {
		graph3 = "■■■■";
	}
	else if (m3==5) {
		graph3 = "■■■■■";
	}
	else if (m3==6) {
		graph3 = "■■■■■■";
	}
	else if (m3==7) {
		graph3 = "■■■■■■■";
	}
	else if (m3==8) {
		graph3 = "■■■■■■■";
	}
	else if (m3==9) {
		graph3 = "■■■■■■■■";
	}
	else if (m3==10) {
		graph3 = "■■■■■■■■■";
	}
	else if (m3==11) {
		graph3 = "■■■■■■■■■■";
	}
	else if (m3==12) {
		graph3 = "■■■■■■■■■■■";
	}
	else if (m3==13) {
		graph3 = "■■■■■■■■■■■■";
	}
	else if (m3==14) {
		graph3 = "■■■■■■■■■■■■■";
	}
	else if (m3==15) {
		graph3 = "■■■■■■■■■■■■■■";
	}
	else if (m3==16) {
		graph3 = "■■■■■■■■■■■■■■■";
	}
	else if (m3==17) {
		graph3 = "■■■■■■■■■■■■■■■■";
	}
	else if (m3==18) {
		graph3 = "■■■■■■■■■■■■■■■■■";
	}
	else if (m3==19) {
		graph3 = "■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==20) {
		graph3 = "■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==21) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==22) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==23) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==24) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==25) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==26) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==27) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==28) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==29) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==30) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==31) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==32) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==33) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==34) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==35) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==36) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==37) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==38) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==39) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3==40) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m3>40) {
		graph3 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	
	if (m4==0) {
		graph4 = "";
	}
	else if (m4==1) {
		graph4 = "■";
	}
	else if (m4==2) {
		graph4 = "■■";
	}
	else if (m4==3) {
		graph4 = "■■■";
	}
	else if (m4==4) {
		graph4 = "■■■■";
	}
	else if (m4==5) {
		graph4 = "■■■■■";
	}
	else if (m4==6) {
		graph4 = "■■■■■■";
	}
	else if (m4==7) {
		graph4 = "■■■■■■■";
	}
	else if (m4==8) {
		graph4 = "■■■■■■■";
	}
	else if (m4==9) {
		graph4 = "■■■■■■■■";
	}
	else if (m4==10) {
		graph4 = "■■■■■■■■■";
	}
	else if (m4==11) {
		graph4 = "■■■■■■■■■■";
	}
	else if (m4==12) {
		graph4 = "■■■■■■■■■■■";
	}
	else if (m4==13) {
		graph4 = "■■■■■■■■■■■■";
	}
	else if (m4==14) {
		graph4 = "■■■■■■■■■■■■■";
	}
	else if (m4==15) {
		graph4 = "■■■■■■■■■■■■■■";
	}
	else if (m4==16) {
		graph4 = "■■■■■■■■■■■■■■■";
	}
	else if (m4==17) {
		graph4 = "■■■■■■■■■■■■■■■■";
	}
	else if (m4==18) {
		graph4 = "■■■■■■■■■■■■■■■■■";
	}
	else if (m4==19) {
		graph4 = "■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==20) {
		graph4 = "■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==21) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==22) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==23) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==24) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==25) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==26) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==27) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==28) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==29) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==30) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==31) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==32) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==33) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==34) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==35) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==36) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==37) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==38) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==39) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4==40) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m4>40) {
		graph4 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	
	if (m5==0) {
		graph5 = "";
	}
	else if (m5==1) {
		graph5 = "■";
	}
	else if (m5==2) {
		graph5 = "■■";
	}
	else if (m5==3) {
		graph5 = "■■■";
	}
	else if (m5==4) {
		graph5 = "■■■■";
	}
	else if (m5==5) {
		graph5 = "■■■■■";
	}
	else if (m5==6) {
		graph5 = "■■■■■■";
	}
	else if (m5==7) {
		graph5 = "■■■■■■■";
	}
	else if (m5==8) {
		graph5 = "■■■■■■■";
	}
	else if (m5==9) {
		graph5 = "■■■■■■■■";
	}
	else if (m5==10) {
		graph5 = "■■■■■■■■■";
	}
	else if (m5==11) {
		graph5 = "■■■■■■■■■■";
	}
	else if (m5==12) {
		graph5 = "■■■■■■■■■■■";
	}
	else if (m5==13) {
		graph5 = "■■■■■■■■■■■■";
	}
	else if (m5==14) {
		graph5 = "■■■■■■■■■■■■■";
	}
	else if (m5==15) {
		graph5 = "■■■■■■■■■■■■■■";
	}
	else if (m5==16) {
		graph5 = "■■■■■■■■■■■■■■■";
	}
	else if (m5==17) {
		graph5 = "■■■■■■■■■■■■■■■■";
	}
	else if (m5==18) {
		graph5 = "■■■■■■■■■■■■■■■■■";
	}
	else if (m5==19) {
		graph5 = "■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==20) {
		graph5 = "■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==21) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==22) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==23) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==24) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==25) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==26) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==27) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==28) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==29) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==30) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==31) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==32) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==33) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==34) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==35) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==36) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==37) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==38) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==39) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5==40) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m5>40) {
		graph5 = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
%>
<tr>
<td align="left"><strong>학생컷 <graph><font color= "#f76996"> <%=graph1 %> </font></strong></graph>&nbsp;&nbsp;
<strong> <font color="#3f48cc"> <%=cut1 %>건 </font></strong> 
</td></tr>

<tr>
<td align="left"><strong>성인컷 <graph><font color="#f76996"> <%=graph2 %> </font></strong></graph>&nbsp;&nbsp;
<strong> <font color="#3f48cc"> <%=cut2 %>건 </font></strong>
</td></tr>

<tr>
<td align="left"><strong>염색 <graph><font color="#f76996"> <%=graph3 %> </font></strong></graph>&nbsp;&nbsp;
<strong> <font color="#3f48cc"> <%=dyeing1 %>건 </font></strong> 
</td></tr>

<tr>
<td align="left"><strong>파마 <graph><font color="#f76996"> <%=graph4 %> </font></strong></graph>&nbsp;&nbsp;
<strong> <font color="#3f48cc"> <%=pama1 %>건 </font></strong>
</td></tr>

<tr>
<td align="left"><strong>파마 + 염색 <graph><font color="#f76996"> <%=graph5 %> </font></strong></graph>&nbsp;&nbsp;
<strong> <font color="#3f48cc"> <%=pama2 %>건</font></strong>
</td></tr>
<%pstmt.close(); rs.close(); con.close(); %>
</table>
<%
	} catch (Exception e) {
%>
<script>
alert("해당 날짜로 조회한 결과가 없습니다.");
location.href="stylerank.jsp";
</script>
<%} %>
<%@ include file = "footer.jsp" %>
</body>
</html>