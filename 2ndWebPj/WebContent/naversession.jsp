<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#d1 {
	padding-top: 200px;
}
</style>
</head>
<body bgcolor="#6ADEDA">
<%
String Nid=request.getParameter("id");
String Nname=request.getParameter("name");
String Nemail=request.getParameter("email");
session.setAttribute("id", Nid);
session.setAttribute("user_name", Nname);
session.setAttribute("user_email", Nemail);
%>

<div id="d1">
		<h3 align="center"><a href="index.jsp">메인 화면으로 돌아가기</a></h3>
	</div>

</body>
</html>