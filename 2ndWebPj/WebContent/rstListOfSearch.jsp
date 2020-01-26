<%@ page import="bean.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.gop2ogleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어디서뭐먹지?</title>
<style>
body {
	font-family: "BM Dohyeon";
	padding-left: 3rem;
	padding-top: 3rem;
}

.page {
	display: flex;
	margin: 1rem;
	padding: 1rem;
}

.front {
	display: flex;
	flex-wrap: wrap;
	padding: 3rem 4rem 4rem 4rem;
}

.search {
	width: 100%;
	position: relative;
	display: flex;
}

/*검색바설정부.*/
.searchTerm {
	width: 100%;
	border: 3px solid #00B4CC;
	border-right: none;
	padding: 5px;
	height: 20px;
	border-radius: 5px 0 0 5px;
	outline: none;
	color: #9DBFAF;
}

.searchTerm:focus {
	color: #00B4CC;
}

.searchButton {
	width: 80px;
	height: 55px;
	background: #088A85;
	text-align: center;
	font-size: 15px;
	font-family: "BM DoHyeon";
	color: white;
}

.wrap {
	width: 30%;
	position: absolute;
	top: 13%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.box {
	display: flex;
	position: relative;
}

.boxpic {
	padding: 1rem 1rem;
	border-radius: 50%;
	height: 25rem;
	width: 19rem;
}

.boxtext {
	display: flex;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 2.2rem;
	color: black;
}

a {
	text-decoration: none;
}

a:hover .boxpic {
	opacity: 1;
}

a:hover .boxtext {
	display: none;
}

@media ( max-width : 800px) {
	.boxpic {
		height: 5rem;
		width: 5rem;
		font-size: 2rem;
		color: black
	}
	.boxtext {
		font-size: 2rem;
		color: black;
	}
}

.cardText {
	position: absolute;
	top: 65%;
	font-size: 20px;
	padding: 25px;
}

.cardTitle {
	position: absolute;
	top: 50%;
	left: 20%;
	font-size: 40px;
}
</style>
</head>

<body bgcolor="#6ADEDA">

<%   
String keyword = request.getParameter("key"); 
rstReadDAO dao = new rstReadDAO();
ArrayList<rstDTO> list=dao.selectSearch(keyword);
String user_id= (String) session.getAttribute("id"); //session에서 set되어있는 id가 객체로 넘어오므로, get으로 받아서 String 형변환 적용
String user_name = (String) session.getAttribute("user_name"); //현재 페이지에서 사용하고자 하는 정보는 id, name이므로 두개만 get 땡겨와서 변수에 담음.
%>

	<header>
			
					
	<div class="nav-wrapper">
			<a href="index.jsp"> <img height="120rem" ; width="500rem"
				; src="Imgs/logo.gif">
			</a>
			<div class="wrap">
				<form action="rstListOfSearch.jsp" method="GET">
					<div class="search" style="border: 2px solid #088A85;">
						<input type="text" class="searchTerm" name="key" id="key"
							placeholder="검색어를 입력하세요." style="padding-left: 15px";>
						<button type="submit" class="searchButton">검색</button>
				</form>
		</div>
			</div>
<%
if (user_id !=null){
%>
			<div class="input-field"
				style="position: absolute; top: 10%; left: 70%;">
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
			style="position: absolute; top: 10%; left: 75%;">
			<a href="UserMember.html" class="waves-effect waves-light btn" >회원가입</a>
			
			 <a class="waves-effect waves-light btn"
				data-placement="bottom" data-toggle="popover" data-container="body" 
    type="button" data-html="true" href="#" id="login">로그인</a>
    
			<div id="popover-content" class="hide">
				<form action="session.jsp" method="POST">
					<div class="form-group" style="background-color:white; width:300px; height:225px; padding: 20px;
					position: fixed; left:74%; top:17%;">
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
				style="background-color: indigo;">후기게시판</a>
		</div>
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
	
<main>
	<section class="front"
		style="padding-left: 1.5rem; padding-right: 1.5rem;">
		<% 	
for(int i=0; i < list.size(); i++){    
rstDTO dto2 = list.get(i);
%>

		<div class="card"
			style="width: 335px; height: 450px; margin-left: 50px; margin-right: 25px;margin-bottom: 50px;">
			<a href="rstDetails.jsp?rstId=<%=dto2.getRstid()%>">
				<div class="boxpic">
						<img style="height: 20rem;	width: 20rem;" src="<%= dto2.getImg1() %>"> <span class="card-title">
						<%=dto2.getRstname() %></span>
				</a>	
				</div>
				<div class="cardText">
					<br>
					<p><%=dto2.getDesc() %></p>
				</div>
			</a>
		</div>
<%
}
%>

		</section>
		</main>
</body>
</html>