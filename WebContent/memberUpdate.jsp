<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>	
<% request.setCharacterEncoding("UTF-8"); %>
<%
String phonee= request.getParameter("phonee");
%>
<form method="post" name="update" action="memberUpdateProc.jsp?phonee=<%=phonee %>">
<script>
<!-- 고객 수정 null값 체크  -->
function input_check () {
	if (document.update.name.value == ''){
		alert("고객명을 입력하세요.");
		update.name.focus();
		return;
	}
	if (document.update.phone.value == ''){
		alert("핸드폰번호를 입력하세요.");
		update.phone.focus();
		return;
	}
	if (document.update.payment.value == ''){
		alert("결제수단을  입력하세요.");
		update.payment.focus();
		return;
	}
	if (document.update.money.value == ''){
		alert("결제금액을 입력하세요.");
		update.money.focus();
		return;
	}
	if (document.update.payment.value != '현금' && document.update.payment.value != '카드') {
		alert("결제수단은 현금 또는 카드로만 입력하세요.");
		update.payment.focus();
		return;
	}
	document.update.submit();
}
</script>
<%@ include file ="header.jsp" %>
</head>
<%@ include file = "nav.jsp" %>
<br><br><br>
<table width = "900" height ="300" border="1" bordercolor = "#000000" bgcolor = "#fff200" align="center">
<tr align="center" height="1%">
<td height="40" colspan="10"><font color = "black"><strong>고객 조회 결과<br><font color="red">*</font>방문날짜와 고객번호는 수정할수 없습니다. 결제수단은 수정가능하지만, 쿠폰 카운트 변동되지않습니다.</strong></font> </td>
</tr>
<tr>
<td align="center" width="100" height="15">  <font color = "black"><strong></font>고객번호</strong></font> </td>
<td align="center" width="100" height="15"> <font color = "black"><strong></font>고객명</strong></font> </td>
<td align="center" width="100" height="15"> <font color = "black"><strong></font>핸드폰번호</strong></font> </td>
<td align="center" width="100" height="15"> <font color = "black"><strong></font>현금/카드</strong></font> </td>
<td align="center" width="100" height="15"> <font color = "black"><strong></font>결제금액</strong></font> </td>
<td align="center" width="100" height="15"> <font color = "black"><strong></font>방문날짜</strong></font> </td>
<td align="center" width="100" height="15"> <font color = "black"><strong></font>메모/특이사항</strong></font> </td>
</tr>

<%
String name = request.getParameter("name");
String number = request.getParameter("number");
String phone = request.getParameter("c_phone");
String payment = request.getParameter("c_payment");
String money = request.getParameter("c_money");
String date = request.getParameter("c_date");
String memo = request.getParameter("c_memo");
String count = request.getParameter("count");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(url,"hr","hr");
String sql = "select * from company where c_number = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, number);
ResultSet rs = pstmt.executeQuery();
%>

<%
if (rs.next()) {
	do {
%>
<tr height="10%">
<td align="center" height="15"> <%= rs.getString(1) %></a></strong></td>
<td align="center" height="15"> <input type="text" name="name" value="<%= rs.getString(2) %>" size="6" style="text-align:center;"></a></strong></td>
<td align="center" height="15"> <input type="text" name="phone" value="<%= rs.getString(3) %>" size="10" style="text-align:center;"></a></strong></td>
<td align="center" height="15"> <input type="text" name="payment" value="<%= rs.getString(4) %>" size="4" style="text-align:center;"></a></strong></td>
<td align="center" height="15"> <input type="text" name="money" value="<%= rs.getString(5) %>" size="3" style="text-align:center;"></a></strong></td>
<td align="center" height="15"> <%= rs.getString(6) %></a></strong></td>
<td align="center" height="15"> <input type="text" name="memo" value="<%= rs.getString(7) %>" style="text-align:center;" ></a></strong></td>
</tr>
<input type="hidden" value="<%=rs.getString(1) %>" name="number">
<%} while(rs.next());%>
<% pstmt.close(); rs.close(); con.close(); %>
<tr class="btn_group" height="20%">
<td colspan="8">
<button type = "button" name = "login" onclick="input_check()">수정</button></a>
<a href = "javascript:history.back();">
<button type = "button" name = "login">뒤로가기</button></a>
</td></tr>
<%} else { %>
<script>
alert("회원정보를 수정할수 없습니다.");
location.href="nameSelect.jsp";
</script>
<%} %>

</table>
</form>
<br><br><br><br>
<%@ include file = "footer.jsp" %>
</body>
</html>