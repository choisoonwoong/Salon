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
<meta charset="UTF-8">
<title>매출조회 page</title>
</head>
<body>
<form method="post" name="day" action="dayProc.jsp">
<input type="hidden" name="input" value="two">
<script>
function input_check() {
	if (document.day.year.value=='0') {
		alert("년도를 선택하세요.");
		day.year.focus();
		return;
		}
	if (document.day.month.value=='0') {
		alert("월을 선택하세요.");
		day.year.focus();
		return;
		}
	if (document.day.day.value=='0') {
		alert("일을 선택하세요.");
		day.year.focus();
		return;
		}
	if (document.day.year2.value=='0') {
		alert("년도를 선택하세요.");
		day.year.focus();
		return;
		}
	if (document.day.month2.value=='0') {
		alert("월을 선택하세요.");
		day.year.focus();
		return;
		}
	if (document.day.day2.value=='0') {
		alert("일을 선택하세요.");
		day.year.focus();
		return;
		}
	document.day.submit();
}

</script>

<%@ include file = "header.jsp" %>
<%@ include file ="nav.jsp" %>
<br><br><br>
<table width = "700" height ="180" border="1" bordercolor = "#000000" bgcolor = "#fff200" align="center">
<tr align="center">
<td colspan="2" height="30"><font color = "black"><strong>날짜별 매출조회</strong></font> </td>
</tr>

<tr>
<td align="center" colspan="2">
<select name="year" id="year" style="width:100px">년</option>
<option value="0" name="0">년</option>
<option value="2021" name="2021">2021</option>
<option value="2022" name="2022">2022</option>
<option value="2023" name="2023">2023</option>
<option value="2024" name="2023">2024</option>
<option value="2025" name="2023">2025</option>
<option value="2025" name="2023">2026</option>
<option value="2025" name="2023">2027</option>
</select><strong>년</strong>

<select name="month" id="month" style="width:50px;">
<option value="0" name="0">월</option>
<option value="1" name="1">1</option>
<option value="2" name="2">2</option>
<option value="3" name="3">3</option>
<option value="4" name="4">4</option>
<option value="5" name="5">5</option>
<option value="6" name="6">6</option>
<option value="7" name="7">7</option>
<option value="8" name="8">8</option>
<option value="9" name="9">9</option>
<option value="10" name="10">10</option>
<option value="11" name="11">11</option>
<option value="12" name="12">12</option>
</select><strong>월</strong>

<select name="day" id="day" style="width:50px;">
<option value="0" name="0">일</option>
<option value="1" name="1">1</option>
<option value="2" name="2">2</option>
<option value="3" name="3">3</option>
<option value="4" name="4">4</option>
<option value="5" name="5">5</option>
<option value="6" name="6">6</option>
<option value="7" name="7">7</option>
<option value="8" name="8">8</option>
<option value="9" name="9">9</option>
<option value="10" name="10">10</option>
<option value="11" name="11">11</option>
<option value="12" name="12">12</option>
<option value="13" name="13">13</option>
<option value="14" name="14">14</option>
<option value="15" name="15">15</option>
<option value="16" name="16">16</option>
<option value="17" name="17">17</option>
<option value="18" name="18">18</option>
<option value="19" name="19">19</option>
<option value="20" name="20">20</option>
<option value="21" name="21">21</option>
<option value="22" name="22">22</option>
<option value="23" name="23">23</option>
<option value="24" name="24">24</option>
<option value="25" name="25">25</option>
<option value="26" name="26">26</option>
<option value="27" name="27">27</option>
<option value="28" name="28">28</option>
<option value="29" name="29">29</option>
<option value="30" name="30">30</option>
<option value="31" name="31">31</option>
</select><strong>일 <font color="red">부터</font></strong>

<select name="year2" id="year2" style="width:100px">년</option>
<option value="0" name="0">년</option>
<option value="2021" name="2021">2021</option>
<option value="2022" name="2022">2022</option>
<option value="2023" name="2023">2023</option>
<option value="2024" name="2023">2024</option>
<option value="2025" name="2023">2025</option>
</select><strong>년</strong>

<select name="month2" id="month2" style="width:50px;">
<option value="0" name="0">월</option>
<option value="1" name="1">1</option>
<option value="2" name="2">2</option>
<option value="3" name="3">3</option>
<option value="4" name="4">4</option>
<option value="5" name="5">5</option>
<option value="6" name="6">6</option>
<option value="7" name="7">7</option>
<option value="8" name="8">8</option>
<option value="9" name="9">9</option>
<option value="10" name="10">10</option>
<option value="11" name="11">11</option>
<option value="12" name="12">12</option>
</select><strong>월</strong>

<select name="day2" id="day2" style="width:50px;">
<option value="0" name="0">일</option>
<option value="1" name="1">1</option>
<option value="2" name="2">2</option>
<option value="3" name="3">3</option>
<option value="4" name="4">4</option>
<option value="5" name="5">5</option>
<option value="6" name="6">6</option>
<option value="7" name="7">7</option>
<option value="8" name="8">8</option>
<option value="9" name="9">9</option>
<option value="10" name="10">10</option>
<option value="11" name="11">11</option>
<option value="12" name="12">12</option>
<option value="13" name="13">13</option>
<option value="14" name="14">14</option>
<option value="15" name="15">15</option>
<option value="16" name="16">16</option>
<option value="17" name="17">17</option>
<option value="18" name="18">18</option>
<option value="19" name="19">19</option>
<option value="20" name="20">20</option>
<option value="21" name="21">21</option>
<option value="22" name="22">22</option>
<option value="23" name="23">23</option>
<option value="24" name="24">24</option>
<option value="25" name="25">25</option>
<option value="26" name="26">26</option>
<option value="27" name="27">27</option>
<option value="28" name="28">28</option>
<option value="29" name="29">29</option>
<option value="30" name="30">30</option>
<option value="31" name="31">31</option>
</select><strong>일 <font color="red">까지</font></strong>
</tr>
<tr class = "btn_group">
<td colspan="2"> <button type = "button" onclick="input_check()">조회하기</button></td>
</tr>
</table>
</form>
<br><br>
<hr>
<br>

<!-- 위아래 구분  -->

<form method="post" name="next" action="yearProc2.jsp">
<%@ page import = "java.util.Calendar" %>
<%
Calendar cal = Calendar.getInstance();
%>

<% int Y = cal.get(Calendar.YEAR)-2000; %>
<% int Yview = cal.get(Calendar.YEAR); %>
<h2 align="center">년도별 매출 확인</h2>
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
</select> <strong>년</strong>
<br><br><br>
<table align="center">
<tr class="btn_group">
<td> <button type="submit" value="버튼">조회하기</button> </td>
</tr>
</table>
</form>
<%@ include file = "footer.jsp" %>
</body>
</html>