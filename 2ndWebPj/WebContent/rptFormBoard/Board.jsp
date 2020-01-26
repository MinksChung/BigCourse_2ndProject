<%@page import="bean.BbsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>어디서 뭐먹지 후기게시판</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLLkJtSA1gl03CkeMAABFCP0oaYFjGg-A&libraries=geometry,places"></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {

	}); //jquery end
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body {
	font-family: "BM Dohyeon";
	padding-left: 3rem;
	padding-top: 3rem;
}

.front {
	display: flex;
	flex-wrap: wrap;
	padding: 3rem 4rem 4rem 4rem;
}

.wrap {
	width: 30%;
	position: absolute;
	top: 13%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.whiteboard {
	height: 650px;
	width: 1770px;
	background-color: white;
	position: relative
}

.sector1 {
	margin: 2%;
	padding-top: 3%;
	padding-left: 3%;
	height: 88%;
	width: 90%;
	background-color: white;
	position: absolute;
}

#b1{
	color: white;
}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body bgcolor="#6ADEDA">
	<%
		BbsDAO dao = new BbsDAO();
		ArrayList<BbsDTO> list = dao.selectList();
	%>

	<header>
		<div class="nav-wrapper">
			<a href="index.html"> <img height="120rem"; width="500rem"; src="Imgs/logo.gif">
			</a>
			<div class="wrap"></div>
		</div>

		<div class="input-field"
			style="position: absolute; top: 10%; left: 82%;">
			<a class="waves-effect waves-light btn">회원가입</a> 
			<a class="waves-effect waves-light btn">로그인</a>
			<a class="waves-effect waves-light btn"	style="background-color: indigo;">후기게시판</a>
		</div>


	</header>
	<div class="sector1">
		
		<div class="waves-effect waves-light btn"><a href="InsertBbs.jsp" id="b1">후기 쓰기</a></div>
		<table style=" width: 1280px;">
			<tr>
				<td style="width: 10%;">게시글 번호</td>
				<td style="width: 20%;">작성자</td>
				<td style="width: 50%;">제목</td>
				<td style="width: 20%;">평점</td>
			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<%
				BbsDTO dto = list.get(i);
			%>

			<tr>
				<td><a href="BoardDetail.jsp?num=<%=dto.getNum()%>"><%=dto.getNum()%></a></td>
				<td><a href="BoardDetail.jsp?num=<%=dto.getNum()%>"><%=dto.getId()%></a></td>
				<td><a href="BoardDetail.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a></td>
				<td><a href="BoardDetail.jsp?num=<%=dto.getNum()%>"><%=dto.getRate()%></a></td>
			</tr>
			<%
				}
			%>
			
		</table>
	</div>
</body>


</html>