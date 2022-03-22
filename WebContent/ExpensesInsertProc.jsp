<%@page import="jdk.internal.org.objectweb.asm.tree.IntInsnNode"%>
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
String name = request.getParameter("e_name");
int money = Integer.parseInt(request.getParameter("e_money"));
String memo = request.getParameter("e_memo");	
%>

<%
try {
	sql = "insert into Expenses values(Expenses_seq.nextval, ?, ?, sysdate, ?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setInt(2, money);
	pstmt.setString(3, memo);
	pstmt.executeUpdate();
%>

<script>
alert("지출내역 등록이 완료되었습니다.");
location.href="ExpensesInsert.jsp";
</script>
<%
pstmt.close(); con.close();} catch (Exception e) {
	e.printStackTrace();
%>
<script>
alert("지출내역 등록에 실패했습니다.");
location.href="ExpensesInsert.jsp";
</script>
<%} %>
</body>
</html>