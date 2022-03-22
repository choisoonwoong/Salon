<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<link href ="common.css" rel="stylesheet" type="text/css">
<html>
<head>
<meta charset="UTF-8">
<title>스타일별 매출조회</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file ="nav.jsp" %>

<!-- 위아래 구분  -->

<form method="post" name="next" action="stylerankProc.jsp">
<%@ page import = "java.util.Calendar" %>
<%
Calendar cal = Calendar.getInstance();
%>

<% int Y = cal.get(Calendar.YEAR)-2000; %> <!-- 접속한 현재 년도 뒤에 2자리 값  -->
<% int Yview = cal.get(Calendar.YEAR); %> <!-- 접속한 현재 년도 값  -->
<% int M =  cal.get(Calendar.MONTH)+1; %> <!-- 접속한 현재 월 값  -->
<% int Mview =  cal.get(Calendar.MONTH)+1; %><!-- 접속한 현재 월 값  -->
<h2 align="center">스타일별 매출 확인</h2>
<center>
<select name="yyear" id="yyear" style="width:100px">년
<option value="<%= Y%>" name="<%= Y %>"><%= Yview %></option>
<option value="21" name="2021">2021</option>
<option value="22" name="2022">2022</option>
<option value="23" name="2023">2023</option>
<option value="24" name="2024">2024</option>
<option value="25" name="2025">2025</option>
<option value="26" name="2026">2026</option>
<option value="27" name="2027">2027</option>
<option value="28" name="2028">2028</option>
<option value="29" name="2029">2029</option>
<option value="30" name="2030">2030</option>
</select><strong>년</strong>

<select name="mmonth" id="mmonth" style="width:50px;">
<option value="<%= M %>" name="<%= M %>"><%= Mview %></option>
<option value="01" name="1">1</option>
<option value="02" name="2">2</option>
<option value="03" name="3">3</option>
<option value="04" name="4">4</option>
<option value="05" name="5">5</option>
<option value="06" name="6">6</option>
<option value="07" name="7">7</option>
<option value="08" name="8">8</option>
<option value="09" name="9">9</option>
<option value="10" name="10">10</option>
<option value="11" name="11">11</option>
<option value="12" name="12">12</option>
</select><strong>월</strong>
</center>
<br>
<table align="center">
<tr class="btn_group">
<td> <button type="submit" value="버튼">조회하기</button> </td>
</tr>
</table>
</form>
<%@ include file = "footer.jsp" %>
</body>
</html>