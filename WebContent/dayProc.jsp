<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<link href ="common.css" rel="stylesheet" type="text/css">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" name="day" action="dayProc.jsp">
<% request.setCharacterEncoding("UTF-8"); %>
<script>
/* 조회 날짜 공란 체크  */
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
	document.day.submit();
}

</script>

<%@ include file = "header.jsp" %>
<%@include file="nav.jsp" %>
<br><br><br>
<table width = "1000" height ="100" border="1" bordercolor = "#000000" bgcolor = "#fff200" align="center">
<tr>
<td align="center" width="100" height="15"><strong> 총 고객수</strong> </td>
<td align="center" width="100" height="15"><strong>카드건수</strong> </td>
<td align="center" width="100" height="15"><strong>카드매출</strong> </td>
<td align="center" width="100" height="15"><strong>현금건수</strong></td>
<td align="center" width="100" height="15"><strong>현금매출</strong> </td>
<td align="center" width="100" height="15" colspan="2"><strong>합계</strong> </td>
</tr>
<%
try {
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String year2 = request.getParameter("year2");
String month2 = request.getParameter("month2");
String day2 = request.getParameter("day2");
String input = request.getParameter("input");
String A = null; /* 현금 총 금액  복사*/
String m = null; /* 현금 총 금액 null 체크용 */
String A2 = null; /* 카드 총 금액  복사*/
String m2 = null; /* 카드 총 금액 null 체크용 */
	switch (input) {
	case "two" :
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select (select count(c_number) from company where c_date between to_date(?,'YYYY-MM-DD') and to_date(?, 'yyyy-mm-dd-hh')+0.99999), " +
			"(select count(*) from company where c_payment='카드' and c_date between to_date(?,'YYYY-MM-DD') and to_date(?, 'yyyy-mm-dd-hh')+0.99999), " +
			"(select count(*) from company where c_payment='현금' and c_date between to_date(?,'YYYY-MM-DD') and to_date(?, 'yyyy-mm-dd-hh')+0.99999), " +
			"(select to_char(sum(c_money),'999,999,999,999') from company where c_payment='카드' and c_date between to_date(?,'YYYY-MM-DD') and to_date(?, 'yyyy-mm-dd-hh')+0.99999), "+
			"(select to_char(sum(c_money),'999,999,999,999') from company where c_payment='현금' and c_date between to_date(?,'YYYY-MM-DD') and to_date(?, 'yyyy-mm-dd-hh')+0.99999), "+
			"(select to_char(sum(c_money),'999,999,999,999') from company where c_date between to_date(?,'YYYY-MM-DD') and to_date(?, 'yyyy-mm-dd-hh')+0.99999), "+
			"(select count(c_payment) from company where c_date between to_date(?,'YYYY-MM-DD') and to_date(?, 'yyyy-mm-dd-hh')+0.99999) "+
			"from company where c_date between to_date(?,'YYYY-MM-DD') and to_date(?, 'yyyy-mm-dd-hh')+0.99999 group by c_date";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url,"hr","hr");
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, year+"-"+month+"-"+day);
	pstmt.setString(2, year2+"-"+month2+"-"+day2);
	pstmt.setString(3, year+"-"+month+"-"+day);
	pstmt.setString(4, year2+"-"+month2+"-"+day2);
	pstmt.setString(5, year+"-"+month+"-"+day);
	pstmt.setString(6, year2+"-"+month2+"-"+day2);
	pstmt.setString(7, year+"-"+month+"-"+day);
	pstmt.setString(8, year2+"-"+month2+"-"+day2);
	pstmt.setString(9, year+"-"+month+"-"+day);
	pstmt.setString(10, year2+"-"+month2+"-"+day2);
	pstmt.setString(11, year+"-"+month+"-"+day);
	pstmt.setString(12, year2+"-"+month2+"-"+day2);
	pstmt.setString(13, year+"-"+month+"-"+day);
	pstmt.setString(14, year2+"-"+month2+"-"+day2);
	pstmt.setString(15, year+"-"+month+"-"+day);
	pstmt.setString(16, year2+"-"+month2+"-"+day2);
	ResultSet rs = pstmt.executeQuery();
	if (rs.next()) {
		A=rs.getString(5);
		if (A==null) {
			m="0";
		} else {
		m=A;
		}
		A2=rs.getString(4);
		if (A2==null) {
			m2="0";
		} else {
		m2=A2;
		}

%>

<tr>
<td align="center" width="100" height="15"><strong> <font color="red"> <%=rs.getString(1) %></font>명</strong> </td>
<td align="center" width="100" height="15"><strong> <font color="red"> <%=rs.getString(2) %></font>건</strong> </td>
<td align="center" width="100" height="15"><strong> <font color="red"> <%=m2 %></font>원</td>
<td align="center" width="100" height="15"><strong> <font color="red"> <%=rs.getString(3)%></font>건 </td>
<td align="center" width="100" height="15"><strong> <font color="red"> <%=m %></font>원 </strong> </td>
<td align="center" width="100" height="15"><strong> 총 <font color="red"> <%=rs.getString(7) %></font>건</strong> </td>
<td align="center" width="100" height="15"><strong> 총 <font color="red"> <%=rs.getString(6) %></font>원</strong> </td>
</tr>
<%} pstmt.close(); rs.close(); con.close();%>
<center><strong><%=year %>년 <%=month%>월 <%=day %>일 <font color="red"> ~ </font> <%=year2 %>년 <%=month2%>월 <%=day2 %>일로 조회하신 매출 결과입니다.</strong></center><br><hr>
</table>
</form>
<%}%>
 <%} catch (Exception e) {%>
 <script>
 alert("입력하신 날짜는 없는 날짜입니다.");
 location.href="day.jsp"
 </script>
 <%} %>
<%@ include file = "footer.jsp" %>
</body>
</html>