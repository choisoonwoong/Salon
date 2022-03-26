<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특이사항 delete</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String no = request.getParameter("no");	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "delete from company_cmt where c_number=?";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url,"hr","hr");
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, no);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
%>
	<script>
	alert("특이사항이 삭제되었습니다.");
	location.href="comment.jsp"
	</script>

</body>
</html>