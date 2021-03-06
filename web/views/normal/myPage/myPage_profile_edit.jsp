<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.et.member.model.vo.*, com.kh.et.tourBoard.model.vo.*"%>
<% 
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	String isclose = (String)request.getAttribute("isclose");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Semantic UI -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- 글꼴  -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">

<title>ET_My_Profile</title>
<link rel="icon" href="/views/image/common/logo.png">


<style>
	body {
		width:100%;
	}
	body>div{
		text-align:center;
		width:90%;
		margin:0 auto;
	}
	.div-img-profile {
		width : 240px;
		height : 240px;
		border : 1px solid gray;
		background : rgba(42,90,133,0.5);;
		border-radius : 50%;
		margin-left: 50px;
	}
	.img-profile {
		width : 240px;
		height : 240px;
		border-radius : 50%;
	}
	
	td{
		padding : 10px;
	}
	
	#txt{
		font-family: 'Nanum Gothic', sans-serif;
		font-weight:800;
		font-size : 15px;
		text-align : left;
	}
	#title {
		font-family: 'Ubuntu', sans-serif;
		margin : 0 0 5px 0;
	}
</style>
</head>
<body>
<div><br>
	<h1 id ="title"> My Profile</h1>
	<form id="profileForm" action = "/et/updateProfile.me?mno=<%=loginUser.getM_no() %>" method = "post" encType = "multipart/form-data">
		<div class = "insertArea">
		
			<table align = "center">
				<tr>
					<td id ="txt">
						<label id = "txt"> - 프로필 사진 </label>
					</td>
				</tr>
				<tr>
					<td>
						<div class = "div-img-profile">
	    					<img src = "<%=loginUser.getA_change_Name() %>" class = "img-profile" id = "img-profile">
	    				</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id = "fileArea">
							<input type = "file" id = "profileImgSelect" name="profileImg" onchange = "loadImg(this)" class = "ui icon" value = "<%=loginUser.getA_change_Name() %>">
						</div>		
					</td>
				</tr>
				<tr>
					<td> 
						<div class="ui form">
						  <div class="field">
						    <label id ="txt"> - 자기 소개글 </label>
						    
						    <textarea name = "profileTxt" rows="3" cols = "50" maxlength="99" style = "resize : none" ><%=loginUser.getM_profile() %></textarea>
						  </div>
						</div>
						
					</td>					
				</tr>
				
			</table>
		</div>
		<br>
		<div class ="btnArea">
			<button class="ui grey basic button" onclick = "wclose();">취소하기 </button>
			<button class="ui grey basic button" onclick = "return submitProfile();"> 완료하기 </button>
			
		</div>
	</form>
	</div>
</body>
	<script>
	function submitProfile() {
		let photoInfo = $("#profileImgSelect").val();
		if(photoInfo != ""){
			$("#profileForm").submit;
			return true;
		}else {
			alert("프로필 사진을 넣어주세요. ");
			return false;
		}
	}
	
	
	function loadImg(value) {
		if(value.files && value.files[0]) { // value는 요소 파일이 있는 상태에 동작한다. 
			var reader = new FileReader(); // reader는 스트림 
			reader.onload = function(e) {
				$("#img-profile").attr("src", e.target.result);
			}
			reader.readAsDataURL(value.files[0]); //value의 files에 0번째 있는 애를 읽어온다. 
		}
		
	} 
	
	function wclose() {
		close();
	}
	
	$(function(){
		if(<%=isclose != null && isclose.equals("Y")%>){
			window.opener.location.href="<%=request.getContextPath()%>/selectPlanList.pl?mno=<%=loginUser.getM_no()%>";
			close();
		}
	});
</script>
</html>