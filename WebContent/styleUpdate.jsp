<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<link href="common.css" rel="stylesheet" type="text/css">
<html>
<meta charset="UTF-8">
<title>스타일 수정 page</title>
<body>
<form method="post" name="update" action="styleUpdateProc.jsp">
<script>
function update_check () {
	if (document.update.option.value == ''){
		alert("대분류를 입력하세요.");
		update.option1.focus();
		return;
	}
	if (document.update.money.value == ''){
		alert("금액을 입력하세요.");
		update.money.focus();
		return;
	}
	var pwtype = /^[0-9]{1,10}$/;
    if (!pwtype.test(document.update.money.value)) {
        alert("금액은 숫자로 입력하세요.");
        update.money.focus();
        return;
    }
	document.update.submit();
}
</script>
<head>
<%@ include file ="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
</head>
<%@ include file="nav.jsp" %>
<br><br><br>
<center><strong>스타일 내용을<font color="red"> 수정 </font> 하시고  <font color="red"> 수정  </font>을 누르시면 스타일이 수정됩니다.</strong></center>
<br>
<table width = "600" height ="180" border="1" bordercolor = "#000000" bgcolor = "#fff200" align="center">
<tr align="center">
<td colspan="4" height="30"><font color = "black"><strong>스타일 목록</strong></font> </td>
</tr>

<tr>
<td align="center" width="250" height="50"> <font color = "black"><strong>스타일 번호</strong></font> </td>
<td align="center" width="150" height="50"> <font color = "black"><strong>스타일 이름</strong></font> </td>
<td align="center" width="150" height="50"> <strong>금액</strong> </td>
<td align="center" width="50" height="50"> <strong>수정/삭제</strong> </td>
</tr>

<%
	try {
	String no = request.getParameter("no");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select * from choice where c_number =?";
	Class.forName ("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url,"hr","hr");
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, no);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
%>

<tr class="btn_group2">
<td align="center" width="150"> <input type="text"  style="text-align:center;" name="no"  value="<%=rs.getString(1)%>" readonly></td>
<td align="center" width="150"> <input type="text"  style="text-align:center;" name="option"  value="<%=rs.getString(2)%>"></td>
<td align="center" width="150"> <input type="text"  style="text-align:center;" name="money" value="<%=rs.getString(3)%>"></td>
<td align="center" width="50"> <button type="button" name="update" onclick="update_check();" size="10">수정</button></td>
</tr>

<%}rs.close(); pstmt.close(); con.close();} catch (Exception e) {
	e.printStackTrace();
%>
<script>
alert("조회할 스타일이 없습니다! 추가 페이지로 이동합니다.");
location.href="style.jsp";
</script>
<%} %>
<br>
</td>
</table>
</form>
<%@ include file ="footer.jsp" %>
</body>
</html>