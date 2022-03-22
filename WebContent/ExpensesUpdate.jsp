<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<link href="common.css" rel="stylesheet" type="text/css">
<html>
<meta charset="UTF-8">
<title>지출 내역 수정 page</title>
<body>
<form method="post" name="update" action="ExpensesUpdateProc.jsp">
<script>
function update_check () {
	if (document.update.e_name.value == ''){
		alert("지출 품목명을 입력하세요.");
		update.e_name.focus();
		return;
	}
	if (document.update.e_money.value == ''){
		alert("금액을 입력하세요.");
		update.e_money.focus();
		return;
	}
	var pwtype = /^[0-9]{1,10}$/;
    if (!pwtype.test(document.update.e_money.value)) {
        alert("금액은 숫자로 입력하세요.");
        update.e_money.focus();
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
<center>
<strong>지출 내용을<font color="red"> 수정 </font> 하시고  <font color="red"> 수정  </font>을 누르시면 지출이 수정됩니다.</strong> <br><br>
<strong>지출 내용을<font color="red"> 삭제 </font> 하려면  <font color="red"> 삭제  </font>를 누르시면 지출이 삭제됩니다.</strong>
</center>
<br>
<table width = "900" height ="180" border="1" bordercolor = "#000000" bgcolor = "#fff200" align="center">
<tr align="center">
<td colspan="6" height="30"><font color = "black"><strong>지출 목록</strong></font> </td>
</tr>

<tr>
<td align="center" width="50" height="50"> <font color = "black"><strong>지출 번호</strong></font> </td>
<td align="center" width="250" height="50"> <font color = "black"><strong>지출 품목명</strong></font> </td>
<td align="center" width="150" height="50"> <font color = "black"><strong>지출 가격</strong></font> </td>
<td align="center" width="150" height="50"> <strong>비고/메모</strong> </td>
<td align="center" width="200" height="50"> <strong>수정/삭제</strong> </td>
</tr>

<%
	String no = request.getParameter("no");
	String link = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select no, name, money, memo from expenses where no=?";
	Class.forName ("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url,"hr","hr");
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, no);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		link = "./ExpensesDelete.jsp?no="+no;
%>
<tr class="btn_group2">
<td align="center" width="50"> <%=rs.getString(1)%> </td>
<td align="center" width="250"> <input type="text"  style="text-align:center;" name="e_name"  value="<%=rs.getString(2)%>"></td>
<td align="center" width="150"> <input type="text"  style="text-align:center;" name="e_money" value="<%=rs.getString(3)%>"></td>
<td align="center" width="150"> <input type="text"  style="text-align:center;" name="e_memo" value="<%=rs.getString(4)%>"></td>
<td align="center" width="300"> <button type="button" name="update" onclick="update_check();" size="10">수정</button>
<a href="<%=link %>">
<button type="button" onclick="return confirm('지출내역을 삭제하시겠습니까? 삭제하면 되돌릴수 없습니다.')" size="10">삭제</button></a>
</td>
</tr>
<input type="hidden" value="<%=no%>" name="no">
<%}rs.close(); pstmt.close(); con.close(); %>
<br>
</td>
</table>
</form>
<%@ include file ="footer.jsp" %>
</body>
</html>