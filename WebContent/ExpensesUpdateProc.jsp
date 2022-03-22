<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지출내역 수정 page</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String no = request.getParameter("no");
	String e_name = request.getParameter("e_name");
	String e_money = request.getParameter("e_money");
	String e_memo = request.getParameter("e_memo");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "update expenses set name=?, money=?, memo=? where no=?";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url,"hr","hr");
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, e_name);
	pstmt.setString(2, e_money);
	pstmt.setString(3, e_memo);
	pstmt.setString(4, no);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
	%>
	
	<script>
	alert("지출내역 수정에 성공했습니다.");
	location.href="ExpensesSelect.jsp";
	</script>
</body>
</html>