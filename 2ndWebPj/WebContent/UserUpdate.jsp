<%@page import="bean.UserDAO"%>
<%@page import="bean.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/UserMember.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(function() {
	$("#delete").click(function() {
		var id="<%=session.getAttribute("id")%>"
		location.href="UserDelete.jsp?id="+id;
	});//delete
});//function
</script>
</head>
<body>
<%
String id= (String)session.getAttribute("id");
UserDAO dao=new UserDAO();
UserDTO dto=dao.getUserInfo(id);
%>
<div class="container">
			<h1>회원가입</h1>
			<hr>
			<form action="UUp.jsp">
			<div class="form-group">
				<label for="id"><b id="id">아이디 : <%=dto.getId()%></b></label> 
				<div id=check_id></div>
			</div>
			<div>
				<br>
			</div>
			<div>
				<label for="psw"><b>변경할 비밀번호</b></label> <input type="password"
					name="pw" id="pw" value="<%=dto.getPw()%>"required>
			</div>
			<div>
				<label for="email"><b id="name">이름 :<%=dto.getName()%></b></label> 
			</div>
			<div><br></div>
			<div>
				<label for="email"><b>변경할 전화번호</b></label> <input type="text" id="phone"
					 name="phone" value="<%=dto.getPhone()%>" required>
			</div>
			<div>
				<label for="email"><b>변경할 이메일</b></label> <input type="text" id="email"
					 name="email" value="<%=dto.getEmail()%>"required>
			</div>
			<hr>
			<div id="btn">
			<div id="up"><button type="sumbit" class="registerbtn1" id="update">수정</button></div>
			</form>
			<div id="bye"><button type="button" class="registerbtn1" id="delete">회원탈퇴</button></div>
			</div>
			</div>
	
</html>