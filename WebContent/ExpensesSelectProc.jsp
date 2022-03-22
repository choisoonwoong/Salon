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
<title>지출내역 조회 페이지</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<br><br><br>
<h2 align="center">지출내역 조회</h2>
<table width="1200" border="1" align="center">
<tr>
<td align="center"> 지출 날짜  </td>
<td align="center"> 지출 품목명  </td>
<td align="center"> 지출 금액 </td>
<td align="center"> 메모/비고 </td>
</tr>
<%
	int year = Integer.parseInt(request.getParameter("year"));
	String sum = null; /* 합계(소숫점 처리)  */
	String y = null;
	String day = null;
	String graph = null;
	String mon = null;
	String link = null;
	String name = null;
	String no = null; /* 지출번호  */
	String memo = null;
	int total = 0; /* 합계(소숫점 없이) */
	int total2 = 0;
	int m = 0; /* 몫 */
	int count = 0; /* rs null 체크용 */
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String sql = "select e.no, substr(e.orderdate,'1','2') as year, m.month, substr(e.orderdate,'7','2') as day, e.name, e.money, " +
"to_char(e.money,'999,999,999'), nvl(e.memo,'없음') "+
"from monthh m left outer join expenses e on m.month = substr(e.orderdate,'4','2') " +
"where substr(e.orderdate,'1','2') = ? order by no";
Connection con = DriverManager.getConnection(url,"hr","hr");
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, year);
ResultSet rs = pstmt.executeQuery();	
while(rs.next()) {
	count++;
	no = rs.getString(1);
	y = rs.getString(2); /* 년  */
	mon = rs.getString(3); /* 월  */
	day = rs.getString(4); /* 일  */
	name = rs.getString(5);
	total += rs.getInt(6); /* 총 합계  */
	total2 = rs.getInt(6);  /* 각각 지출 가격 */
	sum = rs.getString(7); /* 금액(소숫점 처리)  */
	memo = rs.getString(8);
	
	link = "./ExpensesUpdate.jsp?no="+no+"&name="+name+"&memo="+memo+"&money="+total2;
	m = total2/10000; /* 지출 총 금액을 10000으로 나눈 몫 */
	
	/* 지출 합계 10000원당 그래프 1칸  */
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
<td align="center"> <day><a href="<%=link %>">20<%=rs.getString(2) %>년 <%=rs.getString(3) %>월 <%=rs.getString(4) %>일 </a></day></td>
<td align="center"> <strong><%if (sum.length()>=2) { %><font color="#3f48cc"><%=name %></font></strong><%} else { %> <%=name %> <%}%> </td>
<td align="center"><strong><%if (sum.length()>=2) { %><font color="#3f48cc"> <%=memo %> </font></strong><%} else { %> <%=memo %> <%}%></td>
<td align="left"> <graph><strong><font color="#f76996"> <%=graph %> </font></strong></graph>&nbsp;&nbsp;
<strong><%if (sum.length()>=2) { %><font color="red">총 <%=sum %>원</font></strong><%} else { %> <%=sum %> 원 <%}%> </td>
</tr>
<%}pstmt.close(); rs.close(); con.close(); %>
</table>
<br><br><br>
<table width="900" border="1" align="center">
<tr>
<td> <strong>20<%=y%>년 지출 총 금액은 <font color="red"> <% String str = String.format("%,d",total); %><%=str %></font>원 입니다. </strong> </td> <!-- 3자리마다 소수점 찍기 -->
</tr>
<tr>
<td> <strong>20<%=y%>년 월 평균 지출 총 금액은 <font color="red"> <% String str2 = String.format("%,d",total/12); %><%=str2 %></font>원 입니다.</strong> </td> <!-- 3자리마다 소수점 찍기 -->
</tr>
</table>
<%
if (count == 0) {
%>
<script>
alert("해당 년도에 지출하신 내역이 없습니다.");
location.href="ExpensesSelect.jsp";
</script>
<%} %>
<%@ include file = "footer.jsp" %>
</body>
</html>