<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>
<link rel="icon" href="/et/image/common/logo.png">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- font 영어 -->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:700&amp;subset=latin-ext" rel="stylesheet">
<!-- font 한글 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700" rel="stylesheet">

<!-- Semantic UI -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.js"></script>

<!-- bootstrap -->
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46$k0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script> -->
<style>
/* 메인로고 */
.mainlogo {
	text-align:center;
	margin-top: 40px;
	font-family: 'Ubuntu', sans-serif;
}
#logo {
	color: black;
	font-size: 25px;
	text-decoration: none;
}
.main {
	width:30%;
	margin : 50px auto 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}
.nav{
	width: 100%;
	height: 50px;
	background-color: #FFCC00;
}
/* 컨텐츠 박스 내용 */
#form{
	margin-left: 14px;
	width: 300px;
}
.userSearch{
	width: 90%;
	margin : 25px auto 0 auto;
}
#usercontent {
	width: 350px;
	height: 380px;
	margin: 0 auto;
	font-family:'Nanum Gothic', sans-serif;"
}
.idContent {
	font-family:'Nanum Gothic', sans-serif;"
}
.answer{
	width: 70%;
}
.font{
	margin-left: 50px;
}
.pTag{
	text-align: center;
	font-size: 11px;
}
#font{
	margin-left:10px;
	font-size: 15px;
}
#form{
	margin-left:0px;
	width: 30px;
}

</style>
</head>
<body>
<!-- <div class="nav"></div> -->
<br>
	<%@ include file = "/views/common/company/header_com.jsp" %>
	<!-- 메인로고 -->
	<div class="mainlogo">
		<a href="/et/first.jsp" id="logo" title="메인페이지로 이동" style="font-size: 43px;"> 
			<br><image src="/et/image/common/logo.png" style="width: 60px; height: 60px;" alt="메인로고">&nbsp;ET Planner For Travel Agency</image>
		</a>
	</div>
	<form>
		<!-- 비밀번호 찾기 -->
		<div class="main">
			<div class="userSearch">
				<div class="ui top attached tabular menu" id="form">
					<div class="active item" id="passBox" style="background-color: whitesmoke;">비밀번호 찾기</div>
				</div>
				<div class="ui bottom attached active tab segment" id="usercontent" style="background-color: whitesmoke;">
					<div class="idContent" align="center">
						<br>
						<div class="ui form">
							<div class="field">
								<div align="left" class="font">
									<label>ID</label>
								</div>
							<div class="answer">
								<input type="text" name="companyId" id="companyId" placeholder="아이디를 입력해주세요">
							</div>
							<br>
								<div align="left" class="font">
									<label>EMAIL</label>
								</div>
								<div class="answer">
									<input type="email" name="companyEmailPass" id="companyEmailPass" placeholder="이메일을 입력해주세요">
								</div>
							</div>
						</div>
						<br>
						<button class="ui yellow button" id="font" onclick="return sendEmail();"
							style="width: 69%; color: black; font-family: 'Nanum Gothic', sans-serif;">임시 비밀번호 발급받기</button>
						<%! public static String getRamdomPassword(){
								char[] charSet 
								= new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
												, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'
												, 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R'
												, 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
								int idx = 0; 
								StringBuffer sb = new StringBuffer(); 
								//System.out.println("charSet.length :::: "+charSet.length); 
								for(int i = 0; i < 10; i++) { 
									idx = (int) (charSet.length * Math.random());
									//System.out.println("idx :::: "+idx); 
									sb.append(charSet[idx]); 
									} // 36 * 생성된 난수를 Int로 추출 (소숫점제거)
						
							return sb.toString();
							}
						%>
							<input type="hidden" value="<%=getRamdomPassword()%>" id="randomCode">
						<br><br>
						<div class="pTag">
							<p>회원가입시 입력한 이메일로 임시 비밀번호가  <br>발급되었습니다.</p>
						</div>
					</div><br><br>
					<div align="right">
					<a href="/et/views/common/manager/manager_login.jsp" style="color: black; fontext-decoration:none;">로그인 하러가기&nbsp;<i class="large hand point right outline icon"></i></a>
					</div>
				</div>
			</div>
		</div><br><br>
	</form>
	
	<script>
	
		//var $= jQuery.noConflict();
		$("p").hide();
	
		//임시비밀번호 발급
		function sendEmail(){
			var randomCode = $("#randomCode").val();
			
			var companyId = document.getElementById("companyId").value;
			var companyEmailPass = document.getElementById("companyEmailPass").value;
			
			 $.ajax({
				url:"/et/temporaryPassword.co",
				type:"get",
				data:{companyId:companyId, companyEmailPass:companyEmailPass, randomCode:randomCode},
				success:function(data){
					if(data == "SUCCESS"){
						alert("임시비밀번호 발송 성공!");
						$("p").show();
					}else{
						alert("임시비밀번호 발송 실패");
					}
				},
				error:function(){
					console.log("실패!");
				}
			}); 
			return false;
		}
	</script>
	
</body>
</html>