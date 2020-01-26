<%@page import="bean.UserDTO"%>
<%@page import="bean.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body bgcolor="#6ADEDA">
<%	
	String id=(String)session.getAttribute("id"); 
	UserDAO dao=new UserDAO();
	dao.Delete(id);
	session.invalidate();
%>

<h1 align="center">그동안 이용해 주셔서 감사합니다.</h1>
<div id="d1">
		<h3 align="center"><a href="index.jsp">메인 화면으로 돌아가기</a></h3>
	</div>
</body>
