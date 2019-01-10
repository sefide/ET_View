<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.et.member.model.vo.Member"%>
<%
	String msgFalse = (String)request.getAttribute("msgFalse");
	Member loginUser = (Member)session.getAttribute("loginUser");
%>    
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
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
	width: 38%;
	margin : 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}
.mainlogo {
	margin-top:25px;
	text-align: center;
	font-family: 'Ubuntu', sans-serif;
}
#logo {
	color: black;
	font-size: 25px;
	text-decoration: none;
}

#joinForm {
	width: 100%;
	height: 490px;
}

.content{
	margin-left: 30px;
}
#pwdInput{
	width: 40%;
}
#updateMent{
	text-align: center;
}
table{
	width:90%;
}
#idCheckImg, #pwdCheckImg{
	margin-top:60px;
	width: 20px; 
	height: 20px;"
}
</style>
</head>

<body>
<div class="mainlogo" align="center">
	<a href="/et/first.jsp" id="logo" title="메인페이지로 이동" style="font-size: 43px;"> <image src="/et/image/common/logo.png"
		style=" height: 60px;" alt="메인로고">&nbsp;ET Planner</image>
	</a>
</div><br>
<div class="main">
	<div class="join-content">
		<div align="center" class="ui piled segment" id="joinForm">
			<form id="updateForm" action="<%= request.getContextPath()%>/update.me?mno=<%=loginUser.getM_no()%>" method="post">
				<table align="center">
					<tr>		
						<td>
							<h4 class="ui header" id="updateMent" style="font-weight: 500; font-size: 30px; font-family: 'Nanum Gothic', sans-serif;">회원 정보 수정</h4>
							<div align="left" class="font">
								<label style="font-weight: 600;">아이디</label>
							</div>
								<div align="left">
								<div class="ui transparent input">
									<input type="text" placeholder="<%=loginUser.getM_id()%>" name="userId" id="userId">
									<span id="idCheckMsg"></span>
									<input type="hidden" name = "mno" value = "<%=loginUser.getM_no() %>">
								</div>
							</div>
						</td>
						<td><img id="idCheckImg" class="checkTest" src=""></td>
					</tr>
					<tr>	
						<td>				
						<br>
							<div align="left" class="font">
								<label style="font-weight: 600;">수정할 비밀번호</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="password" placeholder="수정할 비밀번호를 입력하세요" id="pass" name="userPwdNew">
									<span id="pwdCheckMsg"></span>
								</div>
							</div>
						</td>
						<td><img id="pwdCheckImg" class="checkTest" src=""></td>
					</tr>	
					<tr>
						<td>	
							<br>
							<div align="left" class="font">
								<label style="font-weight: 600;">수정할 비밀번호 확인</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
								<input type="password" placeholder="수정할 비밀번호를 입력하세요" id="newpass">
							</div>
							</div>
							<br>
						</td>
					</tr>
					<tr>
						<td>	
							<div align="left" class="font">
								<label style="font-weight: 600;">이메일</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="email" placeholder="이메일을 입력해주세요" id="userEmail" name="userEmail">
								</div>
							</div>
							<br>
						</td>
						<td><img id="emailCheckImg" class="checkTest" src=""></td>
					</tr>
					<tr>
						<td>
							<div align="left" class="font">
								<label style="font-weight: 600;">이름</label>
							</div>
							<div align="left">
								<div class="ui transparent input">
									<input type="text" placeholder="이름을 입력해주세요" id="userName" name="userName">&nbsp;&nbsp;&nbsp;
								</div>
							</div><br>
							<div align="right">
							<span>
								<button class="ui blue button" style="width: 85px; height: 35px; font-size: 12px;" onclick="return update();">수정하기</button>
								&nbsp;&nbsp;
								<button class="ui blue button" type="reset" style="width: 80px; height: 35px; font-size: 12px;">취소</button>
								&nbsp;&nbsp;
								<button class="ui red button" style="width: 85px; height: 35px; font-size: 12px;" onclick="return userDelete();">탈퇴하기</button>
							</span>
							</div>
						</td>	
					</tr>
				</table>
			</form>
		</div>
	</div>		
</div>	

	<script>
	
		$(function(){
			$("#idCheckImg").hide();
			$("#pwdCheckImg").hide();
			$("#emailCheckImg").hide();
		});
		
		var checkImgPath = "/et/image/joinCheck/Blue_check.png";
	
		function update(){
			$("#updateForm").submit;
		}
		
		$(function(){
			<% System.out.println("정보수정 알러트 제발 떠라!!");
			System.out.println("msgFalse : " + msgFalse);
			if(msgFalse != null){ %>
			alert("<%=msgFalse%>");
			<%} %>
		});
		
		//아이디
		$("#userId").change(function(){
			var userId = document.getElementById("userId");
			if(userId.value == "<%=loginUser.getM_id()%>"){
				$("#idCheckImg").attr("src",checkImgPath);
			}else{
				return false;
			}
			
			
		});
		
		
		$("#pass").change(function(){
			//비밀번호 검사
			var passEx1 = /[a-z0-9]{4,16}/ig;	//영어,숫자로 4~16글자로 이루어져야함, 대소문자 관계없이
			var passEx11 = /\d+/;	//숫자가 1개 이상 포함되어야 한다.
			var pass = document.getElementById("pass").value;
			
			if(!passEx1.test(pass) || !passEx11.test(pass)){	//비밀번호는 4~16자 이상
				alert("비밀번호를 영문,숫자를 혼용하여 4글자 이상입력해주세요");
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
				$("#pwdCheckMsg").html("비밀번호가 일치하지 않습니다.");
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
			
		//수정하기 버튼 클릭시 && 널값
			function update(){
				<%System.out.println("들어와");%>
				 if($("#userId").val() == ""){	
					alert("아이디를 입력해주세요");
					return false;
				}else if($("#userId").val() != "<%=loginUser.getM_id()%>"){
					alert("아이디는 변경하실 수 없습니다. 확인해주세요");
					$("#userId").attr("src","");
					return false;
				}else if($("#pass").val() == ""){
					alert("비밀번호를 입력해주세요");
					return false;
				}else if($("#newpass").val() == ""){
					alert("비밀번호 확인란을 입력해주세요");
					return false;
				}else if($("#pass").val() != $("#newpass").val()){
					alert("비밀번호가 일치하지 않습니다.");
					$("#pass").focus();
					$("#pass").attr("src","");
					$("#pwdCheckImg").attr("src","");
					return false;
				}else if($("#userEmail").val() == ""){
					alert("이메일을 입력해주세요");
					return false;
				}else if($("#userName").val() == ""){
						alert("이름을 입력해주세요");
						return false;
				}else{ 
					console.log("성공..!!!???");
					<%System.out.println("들어와짜나 ");%>
					 <%-- $("#joinForm").attr("action","<%=request.getContextPath()%>/insert.me");  --%>
					$("#updateForm").submit();
					return true;
				 }  
			} 
		
		function userDelete(){
			alert("정말 탈퇴하시겠습니까?");
			location.href = "<%=request.getContextPath()%>/userDelete.me";
		
			return false;
		}
	
		
	</script>
</body>
</html>