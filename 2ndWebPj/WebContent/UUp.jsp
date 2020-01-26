<%@page import="bean.UserDAO"%>
<%@page import="bean.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<style type="text/css">
#d1 {
	padding-top: 200px;
}
</style>
</head>
<body bgcolor="#6ADEDA">
<% 
String id= (String)session.getAttribute("id");
String pw=request.getParameter("pw"); 
String phone=request.getParameter("phone");
String email=request.getParameter("email");
UserDTO dto=new UserDTO();
UserDAO dao=new UserDAO();
dao.UpdateAll(pw, phone, email, id);
dto=dao.getUserInfo(id);
session.setAttribute("pw", dto.getPw());
session.setAttribute("phone", dto.getPhone());
session.setAttribute("email", dto.getEmail());
%>
<h1 align="center">회원 정보가 수정되었습니다.</h1>
<div id="d1">
		<h3 align="center"><a href="index.jsp">메인 화면으로 돌아가기</a></h3>
	</div>
</body>
</html>