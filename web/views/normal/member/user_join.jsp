<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.et.member.model.vo.Member"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ET_Planner</title>

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="icon" href="/et/image/common/logo.png">
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<style>
.main {
	width:55%;
	margin : 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}
.mainlogo {
	margin-top:40px;
	text-align: center;
	font-family: 'Ubuntu', sans-serif;
}
#logo {
	color: black;
	font-size: 25px;
	text-decoration: none;
}

#joinForm {
	width: 90%;;
	margin : 0 auto;
}
.pwdQuestion{
	width: 200px;
}
#joinMent{
	text-align: center;
}
#idCheckImg, #pwdCheckImg{
	margin-top:60px;
	width: 20px; 
	height: 20px;"
}
#emailCheckImg{
	margin-top:50px;
	width: 20px; 
	height: 20px;
}
table{
	width: 85%;
}
</style>
</head>

<body>
<div class="mainlogo" align="center">
	<a href="/et/index.jsp" id="logo" title="메인페이지로 이동" style="font-size: 43px;"> <image src="/et/image/common/logo.png"
		style=" height: 60px;" alt="메인로고">&nbsp;ET Planner</image>
	</a>
</div><br>
<div class="main">
	<div align="center" class="ui piled segment" id="joinForm">
		<div class="content">
	<form id="joinForm" method="post" action="<%=request.getContextPath()%>/insert.me">
				<table align="center">
					<tr>
						<td>
							<h4 class="ui header" id="joinMent" style="font-weight: 500; font-size: 30px; font-family: 'Nanum Gothic', sans-serif;">회 원 가 입</h4>
								<div align="left" class="font">
									<label style="font-weight: 600; font-size: 15px;">아이디</label>
								</div>
								<div align="left">
									<div class="ui transparent input">
										<input type="text" name="userId" id="userId"
											placeholder="아이디를 입력해주세요"> <span>
											<button class="ui button" onclick="return idCheck();"
												style="width: 85px; height: 30px; font-size: 12px;">중복확인</button>
											<span id="idCheckMsg"></span>
										</span>
									</div>
								</div><br>
							</td>
						<td><img id="idCheckImg" class="checkTest" src=""></td>
					</tr>
					<tr>
						<td>			
							<div align="left" class="font">
								<label style="font-weight: 600; font-size: 15px;">비밀번호</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="password" name="userPwd" id="pass" placeholder="비밀번호를 입력하세요">
									<span id="pwdCheckMsg"></span>
								</div>
							</div><br>
						</td>
						<td><img id="pwdCheckImg" class="checkTest" src=""></td>
					</tr>
					<tr>
						<td>
							<div align="left" class="font">
								<label style="font-weight: 600; font-size: 15px;">비밀번호 확인</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="password" id="newpass" placeholder="비밀번호를 입력하세요">
								</div>
							</div><br>
						</td>
						<td></td>	
					</tr>
					<tr>
						<td>
							<div align="left" class="font">
								<label style="font-weight: 600; font-size: 15px;">비밀번호 찾기 질문</label>
							</div>
							<div align="left" class="ui form">
								<div class="field">
									<div class="ui form">
										<div class="pwdQuestion">
											<select name="userQuestion">
												<option value="">질문을 선택해주세요</option>
												<option value="어렸을 적 꿈은?">어렸을 적 꿈은?</option>
												<option value="가장 좋아하는 꽃은?">가장 좋아하는 꽃은?</option>
												<option value="내가 태어난 곳은?">내가 태어난 곳은?</option>
												<option value="내가 좋아하는 연예인은?">내가 좋아하는 연예인은?</option>
												<option value="가장 좋아하는 동물은?">가장 좋아하는 동물은?</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<br>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<div align="left" class="font">
								<label style="font-weight: 600; font-size: 15px;">질문의 답</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" name="userAnwser" placeholder="답을 입력해주세요">
								</div>
							</div><br>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<div align="left" class="font">
								<label style="font-weight: 600; font-size: 15px;">이메일</label>
							</div>
							<div align="left">
							<div class="ui transparent input">
								<input type="email" name="userEmail" id="userEmail" placeholder="이메일을 입력해주세요"> 
								<!-- <span>@</span>&nbsp;&nbsp;
								<input type="text" name="userEmail" id="email2" placeholder="주소를 입력해주세요"> 
								<select id="email">
									<option value="self" id="self" selected>직접입력</option>
									<option value="naver" id="naver">naver.com</option>
									<option value="daum" id="daum">daum.net</option>
									<option value="google" id="google">google.com</option>
								</select>&nbsp;&nbsp;&nbsp; -->
								<span>
									<button class="ui button" onclick="return sendEmail();" style="width: 110px; height: 30px; font-size: 12px;">인증번호발송</button>
								</span>
									<%!public int getRandom() {
										int randomCode = 0;
										randomCode = (int) Math.floor((Math.random() * 99999 - 10000 + 1)) + 10000;
										return randomCode;
									}%>
								<input type="hidden" value="<%=getRandom()%>" id="randomCode">
							</div>
							</div><br>
						</td>
						<td><img id="emailCheckImg" class="checkTest" src=""></td>
					</tr>
					<tr>
						<td>
							<div class="ui transparent input" id="sendEmailClick">
							<input id="authCode" type="text" placeholder="인증번호를 입력하세요">
							<span>
								<a><button class="ui button" onclick="return auth();" style="width: 97px; height: 30px; font-size: 12px;">인증하기</button></a>
							</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div align="left" class="font">
								<label style="font-weight: 600; font-size: 15px;">이름</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" name="userName" id="name" placeholder="이름을 입력해주세요">
									<button type="submit" onclick="return join();" class="ui blue right labeled icon button"
											style="width: 130px; height: 35px; font-size: 13px; color: white;">
									<i class="right arrow icon"></i>가입하기
									</button>
								</div>
							</div><br>
						</td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
	<script>
		/* function join() {
			$("#joinForm").submit;
		} */
		
		$(function() {
		<% System.out.println("msg : " + msg);
		if(msg != null){ %>
		alert("<%=msg%>");
		<%} %>
	});
		
	
	$(function(){
		$("#sendEmailClick").hide();	//인증하기 버튼 숨기기
		$("#idCheckImg").hide();
		$("#pwdCheckImg").hide();
		$("#emailCheckImg").hide();
	});
	
	var checkImgPath = "/et/image/joinCheck/Blue_check.png";
	
	//아이디 중복체크
	function idCheck(){
		var userId = $("#userId").val();
		//console.log("확인");
		
		$.ajax({
			url:"/et/idCheck.me",
			type:"post",
			data:{userId:userId},
			success:function(data){
				if(data == "fail"){
					alert("이미 사용중인 아이디입니다.");
					$("#idCheckMsg").html("다시 입력해주세요");
					$("#idCheckMsg").css("color","red");
					$("#idCheckImg").attr("src","");
				}else{
					alert("사용 가능한 아이디입니다.");
					$("#idCheckImg").show();
					$("#idCheckImg").attr("src",checkImgPath);
					$("#idCheckMsg").html("");
				}
			},
			error:function(){
				console.log("실패!");
			}
		});
		return false;
			
	}	
	
	//회원가입 유효성 검사
	$("#userId").change(function(){
		//아이디 검사
		var idEx1 = /[a-z]{3,}/;	//영어로만 3글자 이상
		var idEx11 = /\D/;
		var userId = document.getElementById("userId").value;
		//변수1.test(변수2)) => 해당하는 변수값이 문자열에 존재하는지 boolean으로 리턴
		//변수2의 값이 변수1에 해당하는지(존해하는지 => 아이디값이 [a-z]{3,}의 조건에 부합하니?)
		console.log(idEx1.test(userId));
		if(idEx1.test(userId)&& userId.length <= 15){
			$("#idCheckMsg").html("아이디 중복확인을 해주세요");
			$("#idCheckMsg").css("color","blue");
			
		}else{
			$("#idCheckMsg").html("아이디를 형식에 맞게 다시 입력해주세요!");
			$("#idCheckMsg").css("color","red");
			$("#idCheckImg").attr("src","");
			return false;
		}
	});	

	
	 $("#pass").change(function(){
		//비밀번호 검사
		var passEx1 = /[a-z0-9]{4,}/ig;	//영어,숫자로 4글자 이상 이루어져야함, 대소문자 관계없이
		var passEx11 = /\d+/;	//숫자가 1개 이상 포함되어야 한다.
		var pass = document.getElementById("pass").value;
		
		if(!passEx1.test(pass) || !passEx11.test(pass) 
			|| !pass.length >= 4){	//비밀번호는 6자 이상
			alert("비밀번호를 형식에 맞게 다시 입력해주세요!");
			$("#pass").val("");	
			$("#newpass").val("");	
			$("#pwdCheckImg").attr("src","");
			$("#pass").focus();
		}else{
			return false;
		}
	}); 
		
		
		//비밀번호 확인 검사
		//비밀번호, 비밀번호 확인의 값이 일치하는지
		/* var input = document.getElementsByName("input");
		var inputPwd1 = input[1].value;	//input태그중 배열 인덱스 1번째 input
		var inputPwd11 = input[2].value;	//input태그중 배열 인덱스 2번째 input */
	 $("#newpass").change(function(){
		var pass = document.getElementById("pass");
		var newpass = document.getElementById("newpass");
		
		if(pass.value != newpass.value){
			$("#pwdCheckMsg").html("비밀번호가 일치하지 않습니다. 확인해주세요!");
			$("#pwdCheckMsg").css("color","red");
			$("#pass").val("");	
			$("#newpass").val("");	
			$("#pwdCheckImg").attr("src","");
		}else if(pass == null || newpass == null){
			$("#pwdCheckMsg").html("비밀번호를 모두 다 입력해주세요");
			$("#pwdCheckMsg").css("color","red");
			$("#pwdCheckImg").attr("src","");
			//alert("비밀번호가 일치하지 않습니다. 확인해주세요!");
			
		}else{	//성공하면!
			$("#pwdCheckMsg").html("");
			$("#pwdCheckImg").show();
			$("#pwdCheckImg").attr("src",checkImgPath);
			return false;
		}
	});	 
		
	 	//이메일 검사
		//4글자 이상이 나오고
		//@가 나오고
		//주소가 1글자 이상
		//이메일 select 선택 시 값 변경
	/*  $("#email").change(function(){
		if($("#eamil option:selected").text() == "naver.com"){
			$("#email2").attr("value","naver.com");
		}else if($("#email option:selected").text() == "daum.net"){
			$("#email2").html("daum.net");
		}else if($("#email option:selected").text() == "google.com"){
			$("#email2").attr("value","google.com");
		}else if($("#email option:selected").text() == "self"){
			$("#email2").attr("value","");
			$("#email2").focus();
			return false;
		}
		
	});  */

	//이메일 인증번호 발송		
	function sendEmail(){
		$("#sendEmailClick").show();
		
		var randomCode = $("#randomCode").val();
		
		var userEmail = document.getElementById("userEmail").value;
		/* var email1 = document.getElementById("email1").value;
		var email2 = document.getElementById("email2").value;
		var fullEmail = email1 + "@" + email2; */
		
		$.ajax({
			url:"/et/sendEmail.me",
			type:"post",
			data:{userEmail:userEmail,randomCode:randomCode},
			success:function(data){
				if(data == "SUCCESS"){
					alert("인증코드 발송 성공!");
				}else{
					alert("인증코드 발송 실패");
				}
			},
			error:function(){
				console.log("실패!");
			}
		});
		return false;
			
	}	
		
		//이메일 인증코드 확인
		function auth(){
			if($("#authCode").val() == $("#randomCode").val()){
				alert("이메일이 인증되었습니다.");
				$("#emailCheckImg").show();
				$("#emailCheckImg").attr("src",checkImgPath);
			}else{
				alert("이메일 인증 실패");
			}
			return false;
		}
		 
		
	//가입하기 버튼 클릭시 && 널값
	function join(){
		<%System.out.println("들어와");%>
		 if($("#userId").val() == ""){	
			alert("아이디를 입력해주세요");
			return false;
		}else if($("#idCheckImg").attr("src") == ""){//성공했을때 나오는 체크이미지가 안뜰경우
			alert("아이디 중복체크를 해주세요");
			return false;
		}else if($("#pass").val() == ""){
			alert("비밀번호를 입력해주세요");
			return false;
		}else if($("#newpass").val() == ""){
			alert("비밀번호 확인란을 입력해주세요");
			return false;
		}else if($("#pass").val() != $("#newpass").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("#newpass").focus();
			$("#pwdCheckImg").attr("src","");
			return false;
		}else if($("#name").val() == ""){
			alert("이름을 입력해주세요");
			return false;
		}else if($("#userEmail").val() == ""){
			alert("이메일을 입력해주세요");
			return false;
		}else if($("#emailCheckImg").attr("src") == ""){
			alert("이메일을 인증해주세요");
			return false;
		}else{ 
			console.log("성공..!!!???");
			<%System.out.println("들어와짜나 ");%>
			 <%-- $("#joinForm").attr("action","<%=request.getContextPath()%>/insert.me");  --%>
			$("#joinForm").submit();
			return true;
		 } 
		 
	} 
	</script>
</body>
</html>