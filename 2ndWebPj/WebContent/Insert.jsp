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
	String user_id= (String) session.getAttribute("id"); //session에서 set되어있는 id가 객체로 넘어오므로, get으로 받아서 String 형변환 적용
	String user_name = (String) session.getAttribute("user_name"); //현재 페이지에서 사용하고자 하는 정보는 id, name이므로 두개만 get 땡겨와서 변수에 담음.
	
		BbsDAO dao = new BbsDAO();
		dao.insert(dto,user_id);
	%>
	
	<h1 align="center">후기 작성 감사합니다!</h1>
	<div id="d1">
		<h3><a href="Board.jsp">메인 화면으로 돌아가기</a></h3>
	</div>
</body>
</html>