<%@page import="java.util.ArrayList"%>
<%@page import="bean.BbsDTO"%>
<%@page import="bean.BbsDAO"%>
<%@page import="javax.xml.bind.ParseConversionEvent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLLkJtSA1gl03CkeMAABFCP0oaYFjGg-A&libraries=geometry,places"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
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
	float: right;
	margin: 2%;
	padding: 1%;
	height: 88%;
	width: 35%;
	background-color: white;
	float: right;
}

.sector2 {
	float: down;
	margin: 2%;
	padding: 1%;
	height: 88%;
	width: 55%;
	background-color: white;
	float: right;
}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#update").click(function() {
			var temp = $("#num").val();
			var temp2 = $("#content").val();

			location.href = "Update.jsp?num=" + temp + "&content=" + temp2;
		});
	});//jquery end
</script>
</head>
<jsp:useBean id="dto" class="bean.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />
<body bgcolor="#6ADEDA">
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BbsDAO dao = new BbsDAO();

		BbsDTO dto2 = dao.selectDetail(num);
		String user_id= (String) session.getAttribute("id"); //session에서 set되어있는 id가 객체로 넘어오므로, get으로 받아서 String 형변환 적용
		String user_name = (String) session.getAttribute("user_name"); //현재 페이지에서 사용하고자 하는 정보는 id, name이므로 두개만 get 땡겨와서 변수에 담음.
	%>



	<header>

	<header>
		<div class="nav-wrapper">
			<a href="index.jsp"> <img height="120rem"; width="500rem"; src="Imgs/logo.gif">
			</a>
			<div class="wrap"></div>
		</div>
<%
if (user_id !=null){
%>
			<div class="input-field"
				style="position: absolute; top: 10%; left: 77%;">
			<a class="waves-effect waves-light btn" href="session2.jsp">로그아웃</a>
			<a class="waves-effect waves-light btn" href="UserUpdate.jsp"><%=user_name%>님의
				정보수정</a> <a class="waves-effect waves-light btn"
				style="background-color: indigo;" href="Board.jsp">후기게시판</a>
			</div>
		</div>
<%
} else{  
%>
		<div class="input-field"
			style="position: absolute; top: 10%; left: 82%;">
			<a class="waves-effect waves-light btn" href="UserMember.html">회원가입</a> 
			
			<a class="waves-effect waves-light btn"
				data-placement="bottom" data-toggle="popover" data-container="body" 
    type="button" data-html="true" href="#" id="login">로그인</a>

		    <div id="popover-content" class="hide">
				<form action="session.jsp" method="POST">
					<div class="form-group" style="background-color:white; width:300px; height:225px; padding: 20px;
					position: fixed; left:84%; top:17%;">
						아이디<input type="text" name="id" placeholder="id" class="form-control"
							maxlength="16"> 비밀번호<input type="password"
							name="pw" placeholder="pw" class="form-control" maxlength="14">
						<button type="submit"  id="myBtn" name="myBtn" class="btn btn-primary">Login »</button>
					</div>
				</form>
				<script type="text/javascript">
      $("[data-toggle=popover]").popover({
    	    html: true, 
    		content: function() {
    	          return $('#popover-content').html();
    	        }
    	});
      </script>
			</div>
			<a class="waves-effect waves-light btn"	
				style="background-color: indigo;" href="Board.jsp">후기게시판</a>
		</div>
		<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>
<%
}
%>	
	</header>
	<section class="front"
		style="padding-left: 1.5rem; padding-right: 1.5rem;">
		<div class="whiteboard">
			<div align="right">

				<button type="button" id="update" name="update"
					class="waves-effect waves-light btn">수정!</button>
				<a href="Delete.jsp?num=<%=dto2.getNum()%>" type="button"
					id="delete" name="delete" class="waves-effect waves-light btn">삭제!</a>
			</div>
			<div class="sector2" style="padding: 0;">
				<div style="width: 99%; height: 100px; padding-top: 10px;">
					<b>제목</b> <input type="text" class="form-control"
						style="width: 99%;" name="title" value="<%=dto2.getTitle()%>"
						readonly>
				</div>
				<div>
					<b>내용</b>
					<textarea id="content" rows="3" required
						style="width: 99%; height: 400px" name="content"><%=dto2.getContent()%></textarea>
				</div>
			</div>
			<div class="sector1">
				글번호: <input type="text" id="num" name="num"
					value="<%=dto2.getNum()%>" readonly> <b>지역: </b> <input
					id="district" type="text" value="<%=dto2.getDistrict()%>" readonly>
				<b>음식점 이름: </b> <input type="text" value="<%=dto2.getRstName()%>"
					readonly>
				<!--작성자, 작성일자, 평점   -->
				<div style="width: 99%; height: 100px; padding-top: 10px;">
					<b>작성자: </b> <input type="text" class="form-control" name="id"
						value="<%=dto2.getId()%>" readonly> <b>평점: </b> <input
						type="text" class="form-control" name="rate"
						value="<%=dto2.getRate()%>" readonly>
				</div>
			</div>
		</div>
	</section>
</body>
</html>