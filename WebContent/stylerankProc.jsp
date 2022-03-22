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
day { background:yellow;}
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
<table width="1200" border="1" align="center">
<tr>
<td align="center"> <strong> 학생컷 </strong> </td>
<td align="center"> <strong> 성인컷 </strong> </td>
<td align="center"> <strong> 염색 </strong> </td>
<td align="center"> <strong> 멋내기염색 </strong> </td>
<td align="center"> <strong> 파마 </strong> </td>
<td align="center"> <strong> 다운펌 </strong> </td>
</tr>

<%
	try {
	int cut1 = 0;
	int cut2 = 0;
	int dyeing1 = 0;
	int dyeing2 = 0;
	int pama1 = 0;
	int pama2 = 0;
	int cut1_money = 0;
	int cut2_money = 0;
	int dyeing1_money = 0;
	int dyeing2_money = 0;
	int pama1_money = 0;
	int pama2_money = 0;
	
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String sql ="select (select count(*) from company where c_money = '8000' and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) " +
",(select count(*) from company where c_money = '9000' and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) " +
",(select count(*) from company where c_money = '24000' and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) " +
",(select count(*) from company where c_money = '39000' and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) " +
",(select count(*) from company where c_money = '40000' and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) " +
",(select count(*) from company where c_money = '15000' and substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ?) " +
"from company where substr(c_date,'1','2') = ? and substr(c_date,'4','2') = ? group by c_date, c_money";

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
pstmt.setInt(13, year);
pstmt.setInt(14, month);
ResultSet rs = pstmt.executeQuery();	
rs.next();
	cut1 = rs.getInt(1); /* 학생컷 8000  */
	cut2 = rs.getInt(2); /* 성인컷 9000 */
	dyeing1 = rs.getInt(3); /* 염색 24000 */
	dyeing2 = rs.getInt(4); /* 멋내기 39000  */
	pama1 = rs.getInt(5); /* 파마 40000  */
	pama2 = rs.getInt(6); /* 다운펌 15000  */
	cut1_money = rs.getInt(1)*8000;
	cut2_money = rs.getInt(2)*9000;
	dyeing1_money = rs.getInt(3)*24000;
	dyeing2_money = rs.getInt(4)*39000;
	pama1_money = rs.getInt(5)*40000;
	pama2_money = rs.getInt(6)*15000;
%>
<tr>
<td align="center"> <strong> <%=cut1 %>건, <font color="#3f48cc"><% String a = String.format("%,d",cut1_money); %><%=a %></font>원</strong> </td>
<td align="center"> <strong> <%=cut2 %>건, <font color="#3f48cc"><% String b = String.format("%,d",cut2_money); %><%=b %></font>원</strong> </td>
<td align="center"> <strong> <%=dyeing1 %>건, <font color="#3f48cc"><% String c = String.format("%,d",dyeing1_money); %><%=c %></font>원</strong> </td>
<td align="center"> <strong> <%=dyeing2 %>건, <font color="#3f48cc"><% String d = String.format("%,d",dyeing2_money); %><%=d %></font>원</strong> </td>
<td align="center"> <strong> <%=pama1 %>건, <font color="#3f48cc"><% String e = String.format("%,d",pama1_money); %><%=e %></font>원</strong> </td>
<td align="center"> <strong> <%=pama2 %>건, <font color="#3f48cc"><% String f = String.format("%,d",pama2_money); %><%=f %></font>원</strong> </td>
</tr>
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