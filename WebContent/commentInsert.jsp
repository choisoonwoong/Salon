<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특이사항 등록</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String comment = request.getParameter("comment");
%>

<%
try {
	sql = "insert into company_cmt values(company_cmt_seq.nextval,?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, comment);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
%>

<script>
alert("특이사항 등록이 완료되었습니다.");
location.href="comment.jsp";
</script>
<%
pstmt.close(); con.close();} catch (Exception e) {
	e.printStackTrace();
%>
<script>
alert("특이사항 등록에 실패했습니다.");
location.href="comment.jsp";
</script>
<%} %>
</body>
</html>