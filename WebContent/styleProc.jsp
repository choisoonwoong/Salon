<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 등록</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String option1 = request.getParameter("option1");
String money = request.getParameter("money");
%>

<%
try {
	sql2 = "insert into choice values(choice_seq.nextval,?,?)";
	pstmt2 = con.prepareStatement(sql2);
	pstmt2.setString(1, option1);
	pstmt2.setString(2, money);
	pstmt2.executeUpdate();
	pstmt2.close();
	con.close();
%>

<script>
alert("스타일 등록이 완료되었습니다.");
location.href="style.jsp";
</script>
<%
pstmt2.close(); con.close();} catch (Exception e) {
	e.printStackTrace();
%>
<script>
alert("스타일 등록에 실패했습니다.");
location.href="style.jsp";
</script>
<%} %>
</body>
</html>