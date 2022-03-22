<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
	try {
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	sql = "insert into company_member values (?,?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
	%>
	<script>
	alert("회원가입에 성공했습니다. 로그인페이지로 이동합니다.");
	location.href="login.jsp";
	</script>
	<%
	
	} catch (Exception e) {
		e.printStackTrace();
%>
<script>
alert("이미 중복된 아이디입니다. 다시 회원가입 하세요.")
location.href="member.jsp";
</script>
<% } %>


</body>
</html>