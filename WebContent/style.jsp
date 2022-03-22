<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<link href="common.css" rel="stylesheet" type="text/css">
<html>
<meta charset="UTF-8">
<title>스타일 입력 page</title>
<body>
<form method="post" name="insert" action="styleProc.jsp">
<script>
/* 스타일 추가 null값 체크 */
function insert_check () {
	if (document.insert.option1.value == ''){
		alert("스타일을 입력하세요.");
		insert.option1.focus();
		return;
	}
	if (document.insert.money.value == ''){
		alert("금액을 입력하세요.");
		insert.money.focus();
		return;
	}
	var pwtype = /^[0-9]{1,10}$/;
    if (!pwtype.test(document.insert.money.value)) {
        alert("금액은 숫자로 입력하세요.");
        insert.money.focus();
        return;
    }
	document.insert.submit();
}
</script>

<head>
<%@ include file ="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
</head>
<%@ include file="nav.jsp" %>
<br><br><br>
<table width = "500" height ="180" border="1" bordercolor = "#000000" bgcolor = "#fff200" align="center">
<tr align="center">
<td colspan="2" height="30"><font color = "black"><strong>스타일 입력</strong></font> </td>
</tr>

<tr>
<td align="center" width="200" height="50"> <font color = "black"><strong><font color="red">*</font>스타일 이름</strong></font> </td>
<td align="center"> <input type="text" name="option1"> </td>
</tr>

<tr>
<td align="center" width="200" height="50"> <strong><font color="red">*</font>금액</strong> </td>
<td align="center" width="200" height="50"> <input type="text" name="money"> </td>
</tr>
<tr><td colspan="2"><font color="red"><strong> * </font>항목은 필수 입력항목입니다.</strong></td></tr>
</table>
<br>
<table align="center">
<tr class="btn_group">
<td colspan="2">
<button type = "button" name = "insert" onclick="insert_check()" ><strong>스타일 등록</strong></button>
<a href = "style.jsp">
<button type = "button" name = "style"><strong>다시쓰기</strong></button></a>
</td>
</table>
</form>
<%@ include file ="footer.jsp" %>
</body>
</html>