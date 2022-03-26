<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String phone = request.getParameter("phone1");
String payment = request.getParameter("payment");
String money = request.getParameter("money");
String memo = request.getParameter("memo");
int c_coupon = 0;
%>

<%

try {
	/* 쿠폰 카운트 값 가져오기 */
	sql6 = "select c_coupon from coupon2 where phone = ?";
	pstmt6 = con.prepareStatement(sql6);
	pstmt6.setString(1, phone);
	rs = pstmt6.executeQuery();
	if (rs.next()) {
		c_coupon = rs.getInt(1);
	}
	rs.close();
	pstmt6.close();

	/* 방문횟수 카운트 입력 */
sql3 = "insert into coupon values(coupon_seq.nextval,?,?,1,?)";
pstmt3 = con.prepareStatement(sql3);
pstmt3.setString(1, phone);
pstmt3.setString(2, name);
pstmt3.setString(3, memo);
pstmt3.executeUpdate();
pstmt3.close();
%>

<%
/* 고객 입력 */
sql = "insert into company values(company_seq.nextval,?,?,?,?,sysdate,?)";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setString(2, phone);
pstmt.setString(3, payment);
pstmt.setString(4, money);
pstmt.setString(5, memo);	
pstmt.executeUpdate();
pstmt.close();
%> 

<%
/* 고객 입력(쿠폰 카운트 관리) */
sql2 = "insert into coupon2 values(coupon2_seq.nextval,?,1,sysdate,?,0,?,?)";
pstmt2 = con.prepareStatement(sql2);
pstmt2.setString(1, name);
pstmt2.setString(2, phone);
pstmt2.setString(3, memo);
pstmt2.setString(4, payment);
pstmt2.executeUpdate();
pstmt2.close();
%>

<%
if (payment.equals("카드")) {
sql5 = "update coupon2 set c_coupon=c_coupon-1, c_date = sysdate where phone =?";
pstmt5 = con.prepareStatement(sql5);
pstmt5.setString(1, phone);
pstmt5.executeUpdate();
pstmt5.close();
%>
<script>
alert("신규 고객등록이 완료되었습니다. 카드 고객이라 적립되지 않습니다.");
location.href="memberInsert.jsp";
</script>
<%} else if (payment.equals("현금") && c_coupon+1 <= 10) {%>
<script>
alert("신규 고객등록이 완료되었습니다. 현금 고객이라 1회 적립 되었습니다. \n 해당 고객의 적립된 쿠폰 횟수는 <%=c_coupon+1%>개 입니다. ");
location.href="memberInsert.jsp";
</script>

<!-- 11회 이상 방문고객 쿠폰사용 안내 출력  -->
<%} else if (payment.equals("현금") && c_coupon+1 > 10) {%>
<script>
alert("11번 이상 방문으로 서비스 대상자입니다. \n 고객검색 -> 쿠폰사용 -> 방금 입력된 매출삭제를 진행하세요!");
location.href="memberInsert.jsp";
</script>

<%} else if (payment.equals("서비스")) {%>
<script>
alert("서비스 고객이 등록되었습니다.");
location.href="memberInsert.jsp";
</script>
<% }%>

<%
} catch (Exception e) {
	e.printStackTrace();
%>

<%
/* 현금고객이면 쿠폰 +1 입력  */
if (payment.equals("현금") && c_coupon+1 <= 10 ) {
sql4 = "update coupon2 set c_coupon=c_coupon+1, c_date = sysdate where phone =?";
pstmt4 = con.prepareStatement(sql4);
pstmt4.setString(1, phone);
pstmt4.executeUpdate();
pstmt4.close();
con.close();
%>
<script>
alert("신규 고객등록이 완료되었습니다. 현금 고객이라 1회 적립 되었습니다. \n 해당 고객의 적립된 쿠폰 횟수는 <%=c_coupon+1%>개 입니다. ");
location.href="memberInsert.jsp";
</script>

<!-- 11회 이상 방문고객 쿠폰사용 안내 출력  -->
<%} else if (payment.equals("현금") && c_coupon+1 > 10) {%>
<script>
alert("11번 이상 방문으로 서비스 대상자입니다. \n 고객검색 -> 쿠폰사용 -> 방금 입력된 매출삭제를 진행하세요!");
location.href="memberInsert.jsp";
</script>

<% } else if  (payment.equals("카드")) {%>
<script>
alert("고객등록이 완료되었습니다. 카드 고객이라 적립되지 않습니다.");
location.href="memberInsert.jsp";
</script>

<% } else if  (payment.equals("서비스")) {%>
<script>
alert("서비스 고객이 등록되었습니다.");
location.href="memberInsert.jsp";
</script>

<%}}%>
</body>
</html>