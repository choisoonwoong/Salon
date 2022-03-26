<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<link href="common.css" rel="stylesheet" type="text/css">
<html>
<meta charset="UTF-8">
<title>특이사항 입력 page</title>
<body>
<form method="post" name="insert" action="commentInsert.jsp">
<script>
/* 특이사항 추가 null값 체크 */
function insert_check () {
	if (document.insert.comment.value == ''){
		alert("특이사항을 입력하세요.");
		insert.comment.focus();
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
<td colspan="2" height="30"><font color = "black"><strong>특이사항 입력</strong></font> </td>
</tr>

<tr>
<td align="center" width="200" height="100"> <strong><font color="red">*</font>특이사항</strong> </td>
<td align="center" width="300" height="100"> <textarea cols="45" rows="10" name="comment"></textarea> </td>
</tr>

<tr><td colspan="2"><font color="red"><strong> * </font>항목은 필수 입력항목입니다.</strong></td></tr>
</table>
<br>
<table align="center">
<tr class="btn_group">
<td colspan="2">
<button type = "button" name = "insert" onclick="insert_check()" ><strong>코멘트 등록</strong></button>
<a href = "comment.jsp">
<button type = "button" name = "style"><strong>다시쓰기</strong></button></a>
</td>
</table>
</form>
<%@ include file ="footer.jsp" %>
</body>
</html>