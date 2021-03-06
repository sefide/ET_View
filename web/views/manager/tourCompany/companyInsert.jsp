<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<!-- Semantic UI -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	<title>ET_Planner</title>
	<link rel="icon" href="/views/image/common/logo.png">
	
	
	<style>
 	.column{
     	height: 100%;
     }
     
     .outer {
     	display:flex;
     	padding:1%;
     	flex-wrap:wrap;
     	width:100%;
     
     }.
     .inner-1 {
     	width:20%;
     
     }
     .inner-2 {
     	width:70%;
     	margin-left:100px;
     }
     body { padding:50px 100px; font:13px/150% Verdana, Tahoma, sans-serif; }

		/* tutorial */

		input, textarea { 
			padding: 9px;
			border: solid 1px #E5E5E5;
			outline: 0;
			font: normal 13px/100% Verdana, Tahoma, sans-serif;
			width: 200px;
			background: #FFFFFF url('http://store.blueb.co.kr/data/201010/IJ12864517897808/bg_form.png') left top repeat-x;
			background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF), color-stop(4%, #EEEEEE), to(#FFFFFF));
			background: -moz-linear-gradient(top, #FFFFFF, #EEEEEE 1px, #FFFFFF 25px);
			box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
			-moz-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
			-webkit-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
			}

		textarea { 
			width: 400px;
			max-width: 400px;
			height: 150px;
			line-height: 150%;
			}

		input:hover, textarea:hover,
		input:focus, textarea:focus { 
			border-color: #C9C9C9; 
			-webkit-box-shadow: rgba(0, 0, 0, 0.15) 0px 0px 8px;
			}

		.form label { 
			margin-left: 10px; 
			color: #999999; 
			}

		.submit input {
			width: auto;
			padding: 9px 15px;
			background: #617798;
			border: 0;
			font-size: 14px;
			color: #FFFFFF;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
			}
			#ceonum2 {
			width:100px;
			}
			#num {
				width:400px;
			
			}

    
</style>

</head>
<body>

	<!-- navigation - header.jsp -->
	<%@ include file= "/views/common/manager/header_manager.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

    <div class="ui grid">
        <div class = "two wide column"></div>
        <div class = "twelve wide column" style="margin-top:50px;">
        	
        	<div class="outer">
        	<div class="inner-1">
        	<%@ include file = "/views/common/manager/manager_company_nav1.jsp" %>
      	
        	</div>
        	
        	
    	
        	<div class="inner-2">
        	
        <form  id="joinForm" action ="<%=request.getContextPath()%>/insertCompany.co" method="post" class="form" >
	<fieldset><legend>제휴사 추가</legend>
	<p class="name">
		<label for="name">제휴사 명</label><br> 
		<input type="text" name="name" id="name">&nbsp;&nbsp;&nbsp; <button   class="ui black basic button" id=" nameCheck" onclick="return nameCheck();">중복확인</button><br>
		<label for="num">사업자번호</label>&nbsp;<br>
		<input type="text" name="num" id="num" /><br>
		<label for="name">아이디</label><br> 
		<input type="text" name="userId" id="userId" />&nbsp;&nbsp;&nbsp;<button   class="ui black basic button" id=" idCheck" onclick="return idCheck();">중복확인</button><br>
		<label for="name">비밀번호</label><br>
		<input type="password" name="userPwd" id="userPwd" /><br>
		<label for="phone">연락처</label>&nbsp;<br>
		<input type="text" name="phone" id="phone" /><br>
		<label for="eamil">이메일</label><br>
		<input type="email" name="email" id="email" /><br>
		<label for="category">카테고리</label><br>
		<input type="text" name="category" id="category" /><br>
		<label for="address">주소</label><br>
		<input type="text" name="address" id="address" /><br>
		
		
		
	
		<br><br>
		
	<label for="contact">계약기간</label><br>
		<p style=font-size:7px;>시작날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종료날짜<br></p>
		
		<input type="date" name="term" id="term" />-<input type="date" name="term2" id="term2" /><br>
		
		
		
		<br>
		<br>
		<button class="ui black basic button" type="submit" id="insertBtn" onclick="insertCompany();" disabled>완료</button>
		
	</p>

       </p>
       </fieldset>
       </form>
       
         
</div>
        </div>
        </div>
        <div class = "two wide column"></div>
   	</div>
   	
   	<!-- footer -->
	<%@ include file= "/views/common/normal/footer.jsp" %>
	<script>
	 idck=0;
    nameCk=0;
	function insertCompany() {
			
			 if($("#num").val() == ""){
					alert("사업자 번호를 입력해주세요");
					$("#num").focus();
					return false;		
			 }
			 
			else if($("#userPwd").val() == ""){
				alert("비밀번호를 입력해주세요");
			
				return false;
			}
			else if($("#email").val() == ""){
				alert("이메일을 입력해주세요");
			
				return false;
			}
			else if($("#phone").val() == ""){
				alert("연락처를 입력해주세요");
				
				return false;
			}
			else if($("#category").val() == ""){
				alert("연락처를 입력해주세요");
				
				return false;
				
			}
			else if($("#address").val()==""){
				alert("주소를 입력해주세요");
				return false;
			}
			else{ 
				$("#joinForm").submit();
				return true;
			 } 
			 
		} 
		

	
	function nameCheck() {
		 CompanyName=$("#name").val();
		$.ajax({
			url:"/et/nameCheck.mng",
			type:"post",
			data:{CompanyName:CompanyName},
			success:function(data){
				if(data==="fail") {
					alert("이름이 중복됩니다");
					nameCk=0;
					if(nameCk==0||idck==0){
						$("#insertBtn").prop("disabled",true);
					}
					
				}else {
					alert("사용 가능합니다");
					nameCk=1;
					if(idck==1&&nameCk==1){
						$("#insertBtn").prop("disabled",false);
					}
				}
			},
			error:function(){
				console.log("실패");
			}
			
		});
		return false;
	}
	
	function idCheck() {
		 userId=$("#userId").val();
		$.ajax ({
			url:"/et/idCheck.mng",
			type:"post",
			data:{userId:userId},
			success:function(data){
				if(data==="fail"){
					idck=0;
					alert("아이디가 중복됩니다");
					if(idck==0||nameCk==0){
						$("#insertBtn").prop("disabled",true);
					}
			}else if(data=="success") {
				alert("사용 가능합니다");
				idck=1;
				if(idck==1&&nameCk==1){
					$("#insertBtn").prop("disabled",false);
				}
				
			}
		},
		error:function(){
			console.log("실패");
		}
		
		});
		return false;
	}
	
	
	
	
	
	</script>
</body>
</html>