<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일일 상세 조회 page</title>
<style>
#header {background:yellow;}
div {font-size:20px;}
aa {background:yellow;}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String year = request.getParameter("year");
String mon = request.getParameter("mon");
String day = request.getParameter("day");
String name = null;
String phone = null;
String no = null;
int hyunsum = 0; /* 현금 액수 합계 */
int cardsum = 0; /* 카드 액수 합계 */
int hyuncount =0; /* 현금 건수 합계 */
int cardcount =0; /* 카드 건수 합계 */
int total = 0; /* 총 액수 합계 */
int totalcount =0; /* 총 건수 합계 */
int nocount = 0; /* rs값 null 체크용 */
int money =0;
int rnumstart = 1;
int rnumstop = 10;
%>
<h2 align="center"><%=year %>년 <%=mon %>월 <%=day %>일 상세 고객 조회</h2>
 <strong><div align="center">고객 <font color="#ffca18">이름</font>을 누르면 고객정보를 조회할수 있습니다.</div></strong><br>
<table width="1200" height="200" border="1" align="center">
<tr id="header">
<td align="center"> <strong> 순번 </strong> </td>
<td align="center"> <strong> 고객번호 </strong> </td>
<td align="center"> <strong> 이름 </strong> </td>
<td align="center"> <strong> 핸드폰번호 </strong> </td>
<td align="center"> <strong> 결제수단 </strong> </td>
<td align="center"> <strong> 금액 </strong> </td>
<td align="center"> <strong> 날짜 </strong> </td>
<td align="center"> <strong> 메모 </strong> </td>
<td align="center"> <strong> 잔여 서비스<br>(10회당 무료1회)</strong> </td>
<td align="center"> <strong>서비스 이용 횟수<br>(10회 사용) 건수 </strong></td>
</tr>

<%

String url = "jdbc:oracle:thin:@localhost:1521:xe";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(url,"hr","hr");
String sql = "select c.c_name, c.c_phone, c.c_payment, c.c_money, c.c_date, nvl(c.c_memo,'없음'), cc.c_coupon, cc.c_count, " +
"(select sum(c_money) from company where c_payment='현금' and TO_CHAR(c_date,'yymmdd') = ?) as hyunsum, " +
"nvl((select sum(c_money) from company where c_payment='카드' and TO_CHAR(c_date,'yymmdd') = ?),0) as cardsum, " + 
"(select count(c_money) from company where c_payment='현금' and TO_CHAR(c_date,'yymmdd') = ?) as hyuncount, " +
"(select count(c_money) from company where c_payment='카드' and TO_CHAR(c_date,'yymmdd') = ?) as cardcount, " +
"(select sum(c_money) from company where TO_CHAR(c_date,'yymmdd') = ?) as total, " +
"(select count(c_money) from company where TO_CHAR(c_date,'yymmdd') = ?) as totalcount, c.c_number " +
"from company c, coupon2 cc where to_char(c.c_date, 'YYMMDD') = ? and c.c_phone = cc.phone order by c_date";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, year + mon + day);
pstmt.setString(2, year + mon + day);
pstmt.setString(3, year + mon + day);
pstmt.setString(4, year + mon + day);
pstmt.setString(5, year + mon + day);
pstmt.setString(6, year + mon + day);
pstmt.setString(7, year + mon + day);
ResultSet rs = pstmt.executeQuery();
while (rs.next()) {
	nocount ++; /* rs값 체크용  */
	name = rs.getString(1);
	phone = rs.getString(2);
	money = rs.getInt(4);
	 hyunsum = rs.getInt(9); /* 현금 액수 합계 */
	 cardsum = rs.getInt(10); /* 카드 액수 합계 */
	 hyuncount = rs.getInt(11); /* 현금 건수 합계 */
	 cardcount = rs.getInt(12); /* 카드 건수 합계 */
 	 total = rs.getInt(13); /* 총 액수 합계 */
	 totalcount = rs.getInt(14); /* 총 건수 합계 */
	 no = rs.getString(15); /* 고객번호 */
	 String link = "./dayMemberSelectProc.jsp?name="+name+"&phone="+phone+"&no="+no+"&rnumstart="+rnumstart+"&rnumstop="+rnumstop;
%>
<tr>
<td align="center"> <strong> <%=nocount %> </strong> </td>
<td align="center"> <strong> <%=no %> </strong> </td>
<td align="center"> <strong> <aa><a href="<%=link%>"> <%=rs.getString(1) %> </a></aa></strong> </td>
<td align="center"> <strong> <%=rs.getString(2) %> </strong> </td>
<td align="center"> <strong> <%=rs.getString(3) %> </strong> </td>
<td align="center"> <strong> <% String moneyy = String.format("%,d",money); %> <%=moneyy %> </strong> </td> <!-- 소수점 처리  -->
<td align="center"> <strong> <%=rs.getString(5) %> </strong> </td>
<td align="center"> <strong> <%=rs.getString(6) %> </strong> </td>
<td align="center"> <strong> <%=rs.getString(7) %> </strong> </td>
<td align="center"> <strong> <%=rs.getString(8) %> </strong> </td>
</tr>
<%} pstmt.close(); rs.close(); con.close(); if (nocount==0) {%> <!-- rs값  체크 -->
<script>
alert("해당 날짜의 상세 정보가 없습니다.");
location.href="day.jsp";
</script>
<%} %>
</table>
<br><br>
<h3 align="center"> <%=year %>년 <%=mon %>월 <%=day %>일 총 합계 금액 </h3>
<div align="center">
<strong> 현금 : <font color="#3f48cc"><% String hyun = String.format("%,d",hyunsum); %><%=hyun %> 원, <%=hyuncount %>건</font> </strong> <br> <!-- 소수점 처리  -->
<strong> 카드 : <font color="#3f48cc"><% String card = String.format("%,d",cardsum); %><%=card %> 원, <%=cardcount %>건</font> </strong> <br> <!-- 소수점 처리  -->
<strong> 총 : <font color="red"><% String sum = String.format("%,d",total); %><%=sum %> 원, <%=totalcount %>건</font></strong> <br> <!-- 소수점 처리  -->
</div>
<%@include file="footer.jsp" %>
</body>
</html>