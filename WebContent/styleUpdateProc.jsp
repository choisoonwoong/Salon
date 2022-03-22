<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 수정 page</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String option = request.getParameter("option");
	String no = request.getParameter("no");
	String money = request.getParameter("money");	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "update choice set option1=?, money=? where c_number=?";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url,"hr","hr");
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, option);
	pstmt.setString(2, money);
	pstmt.setString(3, no);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
	%>
	
	<script>
	alert("스타일 수정에 성공했습니다.");
	location.href="styleSelect.jsp"
	</script>

</body>
</html>