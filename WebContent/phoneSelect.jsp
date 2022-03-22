<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객검색 page</title>
<body>
<%
request.setCharacterEncoding("UTF-8"); 
int rnumstart = 1;
int rnumstop = 10;
%>
<form method="post" name="select" action="phoneSelectProc.jsp?rnumstart=<%=rnumstart%>&rnumstop=<%=rnumstop%>">
<script>
/* 입력값 null값 체크  */
function input_check() {
	if(document.select.phone.value =='') {
	alert("핸드폰번호를 입력하세요");
	select.phone.focus();
	return;
}
document.select.submit();
}

</script>

<%@ include file ="header.jsp" %>
</head>
<%@ include file="nav.jsp" %>
<br><br><br>
<table width = "500" height ="180" border="1" bordercolor = "#000000" bgcolor = "#fff200" align="center">
<tr align="center">
<td colspan="2" height="30"><font color = "black"><strong>고객조회(핸드폰 번호로)</strong></font> </td>
</tr>
<tr>
<td align="center" width="200" height="50"> <font color = "black"><strong></font>핸드폰번호</strong></font> </td>
<td align="center"> <input type="text" name="phone"> </td>
</tr>
<tr class = "btn_group">
<td colspan="2"> <button type = "button" onclick="input_check()">검색하기</button></td>
</tr>
</table>
<%@ include file = "footer.jsp" %>
</form>
</body>
</html>