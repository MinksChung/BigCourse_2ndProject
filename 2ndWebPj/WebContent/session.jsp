<%@page import="javax.websocket.Session"%>
<%@page import="bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String id= request.getParameter("id");
String pw=request.getParameter("pw");

UserDAO dao=new UserDAO();
int result=dao.Check(id,pw);
UserDTO dto=null;
if (result==(1)){
	dto = new UserDTO();
	dto=dao.getUserInfo(id); //로그인회원정보담아오기
	session.setAttribute("id", id); //아이디세션설정
	session.setAttribute("pw", dto.getPw()); //아이디세션설정
	session.setAttribute("user_name", dto.getName()); //이름세션생성
	session.setAttribute("user_email", dto.getEmail()); //이메일세션생성
	session.setAttribute("user_phone", dto.getPhone());  //전화번호세션설정
	response.sendRedirect("index.jsp"); //다음페이지 설정

	} else if (result==2) {
%>
		<script type="text/javascript">
			alert("비밀번호를 확인해주세요.")
			location.href="index.jsp";
		</script>		
<%		
	} else if (result==3) {
%>
		<script type="text/javascript">
			alert("아이디를 확인해주세요.")
			location.href="index.jsp";
		</script>		
<%		
	}
%>

</body>
</html>