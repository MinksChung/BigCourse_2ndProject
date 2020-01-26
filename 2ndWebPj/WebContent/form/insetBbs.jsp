<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*"%>

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
<title>어디서뭐먹지?</title>
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
</head>
<body bgcolor="#6ADEDA">


	<header>
		<div class="nav-wrapper">
			<a href="index.html"> <img height="120rem"
				;
                width="500rem"
				;
                src="Imgs/logo.gif">
			</a>
			<div class="wrap"></div>
		</div>

		<div class="input-field"
			style="position: absolute; top: 10%; left: 82%;">
			<a class="waves-effect waves-light btn">회원가입</a> <a
				class="waves-effect waves-light btn">로그인</a> <a
				class="waves-effect waves-light btn"
				style="background-color: indigo;">후기게시판</a>
		</div>


		</div>
		</div>
	</header>
	<main>
	<section class="front"
		style="padding-left: 1.5rem; padding-right: 1.5rem;">
		<div class="whiteboard">
			<div class="sector2" style="padding: 0;">
				<div style="width:99%; height: 100px; padding-top: 10px;">
					<label for="subject">제목</label> <input type="text"
						class="form-control" id="img" name="img" style="width: 99%;"
						placeholder="제목을 입력하세요." required>
				</div>
				<div>
					<label for=content>내용</label>
					<textarea id="content" name="content" rows="3" required style="width:99%; height:400px"></textarea>
				</div>
				<a href="insertDB.jsp"class="waves-effect waves-light btn" style="float:right; margin-right:20px;">제출하기</a>
			</div>



			<div class="sector1">
			<!-- 드롭다운 2개 -->
			<select
				style="position: relative; display: inline-block; width: 150px;">
				<option value="dist">지역</option>
				<option value="dist">지역</option>
			</select> <select
				style="position: relative; display: inline-block; width: 150px;">
				<option value="dist">맛집이름</option>
				<option value="dist">맛집이름</option>
			</select>

			<!--작성자, 작성일자, 평점   -->
			<div style="width:99%; height: 100px; padding-top: 10px;">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="id" name="id
					placeholder="이름을 입력하세요." required>
			</div>
			<div style="width:99%; height: 100px; padding-top: 10px;">
				<label for="date">날짜</label> <input type="text" class="form-control"
					id="date" name="date" placeholder="날짜을 입력하세요." required>
			</div>
			<div style="width:99%; height: 100px; padding-top: 10px;">
				<label for="rate">평점</label> <input type="text" class="form-control"
					id="rate" name="rate" placeholder="평점을 입력하세요." required>
			</div>
			</div>
		</div>

	</section>
	</main>
</body>
</html>