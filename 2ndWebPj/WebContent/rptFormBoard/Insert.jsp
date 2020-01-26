<%@page import="bean.BbsDTO"%>
<%@page import="bean.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: "BM Dohyeon";
	background: #6ADEDA;
}

#d1 {
	padding-top: 200px;
}
</style>
</head>
<body>
	<jsp:useBean id="dto" class="bean.BbsDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		BbsDAO dao = new BbsDAO();
		dao.insert(dto);
	%>
	
	<h1 align="center">후기 작성 감사합니다!</h1>
	<div id="d1">
		<h3><a href="Board.jsp">메인 화면으로 돌아가기</a></h3>
	</div>
</body>
</html>