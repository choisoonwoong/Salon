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
<title>매출조회 페이지</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<br><br><br>
<h2 align="center">매출조회</h2>
<table width="1200" border="1">
<tr>
<td align="center"> 날짜  </td>
<td align="center"> 카드건수 </td>
<td align="center"> 카드금액 </td>
<td align="center"> 현금건수 </td>
<td align="center"> 현금금액 </td>
<td align="center"> 총 건수 </td>
<td align="center" colspan="2"> 총액 </td>
</tr>
<%
	int year = Integer.parseInt(request.getParameter("yyear"));
	int month = Integer.parseInt(request.getParameter("mmonth"));
	String yyear = request.getParameter("yyear");
	String mmonth = request.getParameter("mmonth");
	String sum = null;
	String y = null;
	String day = null;
	String graph = null;
	String mon = null;
	String link = null;
	int total = 0;
	int total2 = 0;
	int m = 0;
	int day_sum = 0;
	int mon_avg = 0;
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String sql = "select distinct substr(d.day1,'1','2'), substr(d.day1,'4','2'), substr(d.day1,'7','2'), d.day2, " +
"nvl(to_char(sum(c.c_money) over (partition by substr(d.day1,'7','2') || d.day1,'5','2'),'999,999,999,999'),0) sum, "+ 
"count(c.c_number)  over (partition by substr(d.day1,'7','2') || d.day1,'5','2') sum2, d.day1, " +
"nvl(to_char(e.hyun_sum,'999,999,999,999'),0), nvl(to_char(f.card_sum,'999,999,999,999'),0), nvl(e.hyun_cnt,0), nvl(f.card_cnt,0), "+
"nvl(sum(c.c_money) over (partition by substr(d.day1,'7','2') || d.day1,'5','2'),0) summ, " +
"to_number(nvl(sum(c.c_money) over (partition by substr(d.day1,'7','2')),0)) day_sum " +
"from company c right outer join company_day d " +
"on to_date(c.c_date,'YYYY-MM-DD') = to_date(d.day1,'YYYY-MM-DD') left outer join (select day1, " +
"count(c_number) over (partition by substr(d.day1,'7','2') || d.day1,'5','2') as hyun_cnt, " +
"sum(c_money) over (partition by substr(d.day1,'7','2') || d.day1,'5','2') as hyun_sum from " +
"company c join company_day d on to_date(c.c_date,'YYYY-MM-DD')=to_date(d.day1,'YYYY-MM-DD') and c_payment='현금') e " +
"on to_date(d.day1,'YYYY-MM-DD')=to_date(e.day1,'YYYY-MM-DD') " +
"left outer join (select day1, count(c_number) over (partition by substr(d.day1,'7','2') || d.day1,'5','2') as card_cnt, " +
"sum(c_money) over (partition by substr(d.day1,'7','2') || d.day1,'5','2') as card_sum from company c join company_day d " +
"on to_date(c.c_date,'YYYY-MM-DD')=to_date(d.day1,'YYYY-MM-DD') and c_payment='카드') f " +
"on to_date(d.day1,'YYYY-MM-DD')=to_date(f.day1,'YYYY-MM-DD') " +
"where substr(d.day1,'1','2') = ? and substr(d.day1,'4','2') = ? " +
"group by d.day1, d.day2, c.c_money, c.c_number, e.hyun_sum, f.card_sum, e.hyun_cnt,f.card_cnt order by d.day1";

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(url,"hr","hr");
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, year);
pstmt.setInt(2, month);
ResultSet rs = pstmt.executeQuery();	
while(rs.next()) {
	y = rs.getString(1); /* 년  */
	mon = rs.getString(2); /* 월  */
	day = rs.getString(3); /* 일  */
	sum = rs.getString(5); /* 합계(소숫점 처리)  */
	day_sum = rs.getInt(13); /* 합계(소숫점 없이)  */
	total += rs.getInt(12); /* 합계(소숫점 없이)  */
	total2 += rs.getInt(12); /* 합계(소숫점 없이)  */
	link = "./daySelectProc.jsp?year="+y+"&mon="+mon+"&day="+day;
	m = day_sum/9000; /* 총 금액을 9000으로 나눈 몫 */
	
	
	/* 1-12월 마지막일 별로 하루 수입 평균 구하기  */
	if (mon.equals("01") || (mon.equals("03")) || (mon.equals("05")) || (mon.equals("07")) || (mon.equals("08")) || (mon.equals("10")) || (mon.equals("12"))) {
		mon_avg = 31;
	}
	else if (mon.equals("02")) {
			mon_avg = 28;
		}
	else {
		mon_avg = 30;
	}
	
	
	/* 매출 합계 9000원당 그래프 1칸  */
	if (m==0) {
		graph = "";
	}
	else if (m==1) {
		graph = "■";
	}
	else if (m==2) {
		graph = "■■";
	}
	else if (m==3) {
		graph = "■■■";
	}
	else if (m==4) {
		graph = "■■■■";
	}
	else if (m==5) {
		graph = "■■■■■";
	}
	else if (m==6) {
		graph = "■■■■■■";
	}
	else if (m==7) {
		graph = "■■■■■■■";
	}
	else if (m==8) {
		graph = "■■■■■■■";
	}
	else if (m==9) {
		graph = "■■■■■■■■";
	}
	else if (m==10) {
		graph = "■■■■■■■■■";
	}
	else if (m==11) {
		graph = "■■■■■■■■■■";
	}
	else if (m==12) {
		graph = "■■■■■■■■■■■";
	}
	else if (m==13) {
		graph = "■■■■■■■■■■■■";
	}
	else if (m==14) {
		graph = "■■■■■■■■■■■■■";
	}
	else if (m==15) {
		graph = "■■■■■■■■■■■■■■";
	}
	else if (m==16) {
		graph = "■■■■■■■■■■■■■■■";
	}
	else if (m==17) {
		graph = "■■■■■■■■■■■■■■■■";
	}
	else if (m==18) {
		graph = "■■■■■■■■■■■■■■■■■";
	}
	else if (m==19) {
		graph = "■■■■■■■■■■■■■■■■■■";
	}
	else if (m==20) {
		graph = "■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==21) {
		graph = "■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==22) {
		graph = "■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==23) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==24) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==25) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==26) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==27) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==28) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==29) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==30) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==31) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==32) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==33) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==34) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==35) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==36) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==37) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==38) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==39) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m==40) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
	else if (m>40) {
		graph = "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■";
	}
%>
<tr>
<td align="center"> <day><a href="<%=link %>">20<%=rs.getString(1) %>년 <%=rs.getString(2) %>월  <%=rs.getString(3) %>일  [<%=rs.getString(4) %>]</a></day></td>
<td align="center"> <strong><%if (sum.length()>=2) { %>총<font color="#3f48cc"> <%=rs.getString(11) %></font>건</strong><%} else { %> <%=rs.getString(11) %> <%}%> </td>
<td align="center"><strong><%if (sum.length()>=2) { %><font color="#3f48cc"> <%=rs.getString(9) %></font>원</strong><%} else { %> <%=rs.getString(9) %> <%}%></td>
<td align="center"> <strong><%if (sum.length()>=2) { %>총<font color="#bd7ae2"> <%=rs.getString(10) %></font>건</strong><%} else { %> <%=rs.getString(10) %> <%}%> </td>
<td align="center"><strong><%if (sum.length()>=2) { %><font color="#bd7ae2"> <%=rs.getString(8) %></font>원</strong><%} else { %> <%=rs.getString(8) %> <%}%>
<td align="center"> <strong><%if (sum.length()>=2) { %>총<font color="red"> <%=rs.getString(6) %></font>건</strong><%} else { %> <%=rs.getString(6) %> <%}%>  </td>
<td align="left"> <graph><strong><font color="#f76996"> <%=graph %> </font></strong></graph>&nbsp;&nbsp;
<strong><%if (sum.length()>=2) { %>총<font color="red"> <%=rs.getString(5) %></font>원</strong><%} else { %> <%=rs.getString(5) %> <%}%> </td>
</tr>
<%}pstmt.close(); rs.close(); con.close(); %>
</table>
<br><br><br>
<table width="900" border="1">
<tr>
<td> <strong>20<%=y%>년 <%=mon %>월 매출 총 금액은 <font color="red"> <% String str = String.format("%,d",total); %><%=str %> </font>원 입니다.</strong> </td> <!-- 3자리마다 소수점 찍기 -->
</tr>
<tr>
<td> <strong>20<%=y%>년 <%=mon %>월 하루평균 매출 총 금액은 <font color="red"> <% String str2 = String.format("%,d",total/mon_avg); %><%=str2 %></font>원 입니다.</strong> </td> <!-- 3자리마다 소수점 찍기 -->
</tr>
</table>
<%@ include file = "footer.jsp" %>
</body>
</html>