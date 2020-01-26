<%@page import="java.util.ArrayList"%>
<%@page import="bean.BbsDTO"%>
<%@page import="bean.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		BbsDAO dao = new BbsDAO();
		ArrayList<BbsDTO> list = dao.selectList();
	%>
	<table border="1">
		<%
			for (int i = 0; i < list.size(); i++) {
		%>
		<tr align="center">
		<%
			BbsDTO dto = list.get(i);
		%>
			<td><%=dto.getId()%></td>
			<td><%=dto.getTitle()%></td>
			<td><%=dto.getContent()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>