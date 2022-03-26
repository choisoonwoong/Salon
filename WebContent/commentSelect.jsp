<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<link href="common.css" rel="stylesheet" type="text/css">
<html>
<meta charset="UTF-8">
<title>특이사항 수정</title>
<body>
<head>
<%@ include file ="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
</head>
<%@ include file="nav.jsp" %>
<br><br><br>
<center><strong>특이사항 <font color="red"> 삭제 </font>를 누르면 <font color="red"> 삭제 </font>가 가능합니다.</strong></center>
<br>
<table width = "500" height ="180" border="1" bordercolor = "#000000" bgcolor = "#fff200" align="center">
<tr align="center">
<td colspan="4" height="30"><font color = "black"><strong>특이사항 목록</strong></font> </td>
</tr>

<tr>
<td align="center" width="50" height="50"> <font color = "black"><strong>번호</strong></font> </td>
<td align="center" width="450" height="50"> <font color = "black"><strong>특이사항 내용</strong></font> </td>
<td align="center" width="200" height="50"> <strong>수정/삭제</strong> </td>
</tr>

<%
	int count = 0;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select * from company_cmt";
	Class.forName ("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url,"hr","hr");
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		String no = rs.getString(1);
		String comment = rs.getString(2);
	String link = "./commentDelete.jsp?no="+no;
	count ++;
%>
<%  %>
<tr>
<td align="center"> <strong><%= no %></strong></td>
<td align="center"> <strong><%=comment %></strong> </td>
<td align="center"> <strong> <a href="<%=link %>" onclick="return confirm('정말로 삭제하시겠습니까? 삭제하면 복구할수 없습니다.');"><font color="red">삭제</font></a></strong> </td>
</tr>
<%} rs.close(); pstmt.close(); con.close();  %>
<% if (count==0) { %>
<script>
alert("조회할 특이사항이 없습니다! 추가 페이지로 이동합니다.");
location.href="comment.jsp";
</script>
<%} %>
<br>
</td>
</table>
</form>
<%@ include file ="footer.jsp" %>
</body>
</html>