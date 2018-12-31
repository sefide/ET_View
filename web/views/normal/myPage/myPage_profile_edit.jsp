<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.et.member.model.vo.*, com.kh.et.tourBoard.model.vo.*"%>
<% 
	Member loginUser = (Member)request.getAttribute("loginUser");
	Attachment attach = (Attachment)request.getAttribute("attach");
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
		width : 190px;
		height : 190px;
		margin : 15% 0;
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
	<form action = "" method = "post" encType = "multipart/form-data">
	
		<div class = "insertArea">
		<form action = "<%=request.getContextPath()%>/profileSetting.me?mno=<%=loginUser.getM_no() %>" method = "post">
			<table align = "center">
				<tr>
					<td id ="txt">
						<label id = "txt"> - 프로필 사진 </label>
					</td>
				</tr>
				<tr>
					<td>
						<div class = "div-img-profile">
						<% if(attach != null) {%>
	    					<img src = "/et/profileUpload/<%=attach.getChangeName()%>" class = "img-profile" id = "img-profile">
	    					<%} else { %>
	    					<img src = "/et/image/common/logo.png" class = "img-profile" id = "img-profile">
	    					<%} %>
	    				</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id = "fileArea">
							<input type = "file" id = "profileImgSelect" name="profileImg" onchange = "loadImg(this)" class = "ui icon">
						</div>		
					</td>
				</tr>
				<tr>
					<td> 
						<div class="ui form">
						  <div class="field">
						    <label id ="txt"> - 자기 소개글 </label>
						    <textarea name = "profileTxt" rows="3" cols = "50" style = "resize : none" placeholder = "자기 소개 부탁바람"><%=loginUser.getM_profile() %></textarea>
						  </div>
						</div>
						
					</td>					
				</tr>
				
			</table>
		</form>
		</div>
		<br>
		<div class ="btnArea">
			<button class="ui grey basic button" onclick = "wclose();">취소하기 </button>
			<button class="ui grey basic button" type ="submit"> 완료하기 </button>
			
		</div>
	</form>
	</div>
</body>
	<script>
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
	
	</script>
</html>