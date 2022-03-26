<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	/* 고객 정보 수정 페이지  */
	try {
	String name = request.getParameter("name");
	String number = request.getParameter("number");	
	String phone = request.getParameter("phone");
	String phonee = request.getParameter("phonee");
	String payment = request.getParameter("payment");
	String money = request.getParameter("money");
	String memo = request.getParameter("memo");
	
	String c_number = null;
	String phone2 = null;

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql4 = "select c_number, phone from coupon2 where phone=?";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url,"hr","hr");
	PreparedStatement pstmt4 = con.prepareStatement(sql4);
	pstmt4.setString(1, phonee);
	ResultSet rs = pstmt4.executeQuery();
	if (rs.next()) {
	c_number = rs.getString(1);
	phone2 = rs.getString(2);
	}
	%>
	
	<%
	String sql3 = "update coupon2 set c_name=?, phone=?, c_memo=?, c_payment=? where phone=? and c_number=?";
	PreparedStatement pstmt3 = con.prepareStatement(sql3);
	pstmt3.setString(1, name);
	pstmt3.setString(2, phone);
	pstmt3.setString(3, memo);
	pstmt3.setString(4, payment);
	pstmt3.setString(5, phone2);
	pstmt3.setString(6, c_number);
	pstmt3.executeUpdate();
	pstmt3.close();
	%>
	
	<%
	String sql2 = "update coupon set phone=?, name=? where phone=?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setString(1, phone);
	pstmt2.setString(2, name);
	pstmt2.setString(3, phone2);
	pstmt2.executeUpdate();
	pstmt2.close();
	%>
	
	<%
	String sql6 = "update coupon set memo=? where phone=? and c_number=?";
	PreparedStatement pstmt6 = con.prepareStatement(sql6);
	pstmt6.setString(1, memo);
	pstmt6.setString(2, phone2);
	pstmt6.setString(3, number);
	pstmt6.executeUpdate();
	pstmt6.close();
	%>
	
	<%
	String sql = "update company set c_name=?, c_phone=? where c_phone=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, phone);
	pstmt.setString(3, phone2);
	pstmt.executeUpdate();
	pstmt.close();
	%>
	
	<%
	String sql5 = "update company set c_money=?, c_payment=?, c_memo=?  where c_number=?";
	PreparedStatement pstmt5 = con.prepareStatement(sql5);
	pstmt5.setString(1, money);
	pstmt5.setString(2, payment);
	pstmt5.setString(3, memo);
	pstmt5.setString(4, number);
	pstmt5.executeUpdate();
	pstmt5.close();
	%>

	<script>
	alert("수정에 성공했습니다.");
	location.href="nameSelect.jsp";
	</script>
	<% rs.close(); con.close();
	
	}catch (Exception e) { %>
	<script>
	alert("회원 수정에 실패했습니다.");
	location.href="nameSelect.jsp";
	</script>
	<%} %>

</body>
</html>