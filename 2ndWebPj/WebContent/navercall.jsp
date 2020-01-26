<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
</head>
<body>
callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다.

	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "ssar2Nb6E7OfCPR1VJ3V",
				callbackUrl: "http://localhost:8888/scndWebProject/index.jsp",  //이곳에서 실행을하고 다시 돌아가야할 페이지
				isPopup: false,  //팝업창 true = 띄움 false = 안띄움
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
	
		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		var email;  //email, name, id 변수 생성
		var name;
		var id;
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					id = naverLogin.user.getId();		  //네이버 회원의 아이디, 이름, 이메일을 받아와 변수에 저장
					name = naverLogin.user.getName();     
					email = naverLogin.user.getEmail();
					if( email == undefined || email == null) {   //email 정보가 없거나 null 일떄
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					//naver에서 얻어온 id,name,email을 index.jsp에 보내줌
					window.location.replace("http://localhost:8888/scndWebProject/naversesseion.jsp?id="+id+"&name="+name+"&email="+email);
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</body>
</html>