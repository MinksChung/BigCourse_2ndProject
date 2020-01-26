<%@page import="bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: black;
	background: #6ADEDA
}
</style>
</head>
<body>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String email=request.getParameter("email");
	UserDTO dto=new UserDTO();
	dto.setId(id);
	dto.setPw(pw);
	dto.setName(name);
	dto.setPhone(phone);
	dto.setEmail(email);
	UserDAO dao=new UserDAO();
	dao.Insert(dto);
%>
<h2 align="center">회원가입이 완료 되었습니다.</h2>

<div id="d1">
		<h3 align="center"><a href="index.jsp">메인 화면으로 돌아가기</a></h3>
	</div>
</body>
</html>