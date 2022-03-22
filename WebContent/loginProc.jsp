5<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 페이지</title>
</head>
<body>
<%
	try {
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	sql = "select id from company_member where id = ? and password = ?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	rs = pstmt.executeQuery();
	rs.next();
	String id2 = rs.getString(1); /* ID값 */
	
	if (id.equals(id2)) {
	session.setAttribute("session_id", id2); /* 로그인 성공하면 session_id에 값 전달 */
	/*
	session.setMaxInactiveInterval(60*600); /* 세션시간 10시간 유지 */
	session.setMaxInactiveInterval(-1);
%>

<script>
alert("로그인에 성공했습니다. 이제 기능을 이용할수 있습니다.");
location.href="login.jsp";
</script>

<%} pstmt.close(); rs.close(); con.close(); } catch(Exception e) {
e.printStackTrace();
%>
<script>
alert("아이디 또는 패스워드가 일치하지 않습니다. 다시 시도해주세요.");
location.href="login.jsp";
</script>

<%} %>
</body>
</html>