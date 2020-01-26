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

.search {
	width: 100%;
	position: relative;
	display: flex;
} /*검색바설정부.*/
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

.whiteboard {
	height: 650px;
	width: 1770px;
	background-color: white;
	position: relative
}

.sector {
	float: left;
	margin: 2%;
	padding: 1%;
	height: 88%;
	width: 30.5%;
	background-color: white;
}
</style>
</head>
<body bgcolor="#6ADEDA">

	<%
		int rstId = Integer.parseInt(request.getParameter("rstId"));
		rstReadDAO dao = new rstReadDAO();
		rstDTO dto = dao.selectRst(rstId);
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
		<div class="whiteboard">
			<div class="sector" style="padding: 0;">
				<img style="height: 38rem; width: 38rem;" src="<%=dto.getImg1()%>">
			</div>
			<div class="sector" style="margin: 0; margin-top: 2%;">
				<h3><%=dto.getRstname()%></h3>
				<table>
					<tr>
						<th style="color: gray;">지 역</th>
						<th><%=dto.getDistrict() %></th>
						<th style="color: gray;">영업시간</th>
						<th><%=dto.getWorkingtime() %></th>
					</tr>
					<tr>
						<th style="color: gray;">연락처</th>
						<th><%=dto.getTel() %></th>
						<th style="color: gray;">주 소</th>
						<th><%=dto.getAddr() %></th>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<tr aria-rowspan="4">
						<th colspan="4"><%=dto.getDesc() %> <br> <br> <br>
							<%=dto.getDesc() %></th>
					</tr>
				</table>
			</div>
			<div class="sector">
			
		<div>		
				<div style="width: 520px; height: 550px;"
					id="ggmap"></div>
			</div>
		</div>
		<script>
			    function initMap() {
			        var map = new google.maps.Map(document.getElementById('ggmap'), {
			            //스크립트소스로 인스턴스,클래스.
			            //id가 map인 곳에 새로운 지도를 만들겠다.
			            zoom: 15,
			            center: {lat: -34.397, lng: 150.644} //맵의 디폴트값.
			        });
			        var geocoder = new google.maps.Geocoder();
			            //받아오는 주소를 지오코드를 만들기위한 지오코더인트턴스. 아래쪽 함수의 파라메터중 한개.
					geocodeAddress(geocoder, map);
			       //geocodeAddress 함수호출, 파라메터 각각 넣어주고.
			    }

			    function geocodeAddress(geocoder, resultsMap) {
			        var address = "<%=dto.getAddr() %>"; //한글주소컨테이너.
			        geocoder.geocode({'address': address}, function(results, status) {  //콜백함수.
			            //스트링주소받아서 적용하고, results는 각종데이터, status는 상태를 받아온다.
			            //아랫쪽 조건에 넣어서  지점을 지정하고, 마커를 더한다.
			            if (status === 'OK') {
			                resultsMap.setCenter(results[0].geometry.location);
			                var marker = new google.maps.Marker({
			                    map: resultsMap,
			                    position: results[0].geometry.location
			                });
			            } else {
			                alert('Geocode was not successful for the following reason: ' + status);
			            }
			        });
			    }
			    initMap();
				</script>
			
		</div>
	</section>
	</main>
</body>
</html>