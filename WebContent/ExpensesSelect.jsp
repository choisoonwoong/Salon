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
<title>지출내역 리스트 조회</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file ="nav.jsp" %>

<form method="post" name="next" action="ExpensesSelectProc.jsp">
<%@ page import = "java.util.Calendar" %>
<%
Calendar cal = Calendar.getInstance();
%>

<% int Y = cal.get(Calendar.YEAR)-2000; %> <!-- 접속한 현재 년도 뒤에 2자리 값  -->
<% int Yview = cal.get(Calendar.YEAR); %> <!-- 접속한 현재 년도 값  -->
<h2 align="center">지출내역 리스트 조회</h2>
<center>
<select name="year" id="year" style="width:100px">년
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