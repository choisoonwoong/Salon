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
	/* 고객 삭제 */
	String number = request.getParameter("number");
	String payment = request.getParameter("payment");	
	String phone = request.getParameter("phone");
	String cc = request.getParameter("cc");
	int count = 0;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "delete from company where c_phone=? and c_number=?";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url,"hr","hr");
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, phone);
	pstmt.setString(2, number);
	pstmt.executeUpdate();
	pstmt.close();
%>

<%
String sql4 = "select count(*) from company where c_phone =?";
PreparedStatement pstmt4 = con.prepareStatement(sql4);
pstmt4.setString(1, phone);
ResultSet rs = pstmt4.executeQuery();
if (rs.next()) {
	count = rs.getInt(1);
}
rs.close();
pstmt4.close();
%>
	

<%
	/* 방문 카운트 삭제 */
	String sql2 = "delete from coupon where phone=? and c_number=(select max(c_number) from coupon where phone=?)";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setString(1, phone);
	pstmt2.setString(2, phone);
	pstmt2.executeUpdate();
	pstmt2.close();
%>

<%
	/* 쿠폰 카운트 차감 없이 삭제 */
	if (payment.equals("카드")) {
	String sql3 = "update coupon2 set c_coupon=c_coupon-0 where phone=?";
	PreparedStatement pstmt3 = con.prepareStatement(sql3);
	pstmt3.setString(1, phone);
	pstmt3.executeUpdate();
	pstmt3.close();
%>

	<script>
	alert("고객이 삭제되었습니다.");
	location.href="nameSelect.jsp"
	</script>
	
<%} else if (payment.equals("현금")) {%>
<%
	/* 쿠폰 카운트 차감 삭제 */
	String sql3 = "update coupon2 set c_coupon=c_coupon-1 where phone=?";
	PreparedStatement pstmt3 = con.prepareStatement(sql3);
	pstmt3.setString(1, phone);
	pstmt3.executeUpdate();
	pstmt3.close();
%>
	<script>
	alert("고객이 삭제되었습니다.");
	location.href="nameSelect.jsp"
	</script>
	
<%} else if (payment.equals("서비스")) {%>
	<script>
	alert("고객이 삭제되었습니다.");
	location.href="nameSelect.jsp"
	</script>
	
<%} if (count == 0) {%>
<%
	/* 첫방문 회원 삭제시 해당 모든 정보 삭제*/
	String sql3 = "delete from coupon2 where phone=?";
	PreparedStatement pstmt3 = con.prepareStatement(sql3);
	pstmt3.setString(1, phone);
	pstmt3.executeUpdate();
	pstmt3.close();
%>
	<script>
	alert("고객이 삭제되었습니다.");
	location.href="nameSelect.jsp"
	</script>	
<% } con.close(); %>
</html>