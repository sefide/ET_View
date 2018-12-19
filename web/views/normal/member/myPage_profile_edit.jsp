<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>ET_My_Profile</title>
<link rel="icon" href="/views/image/common/logo.png">

<style>
	.div-img-profile {
		width : 240px;
		height : 240px;
		border : 1px solid gray;
		background : rgba(42,90,133,0.5);;
		border-radius : 50%;
		float :left;
		text-align : center;
	}
	.img-profile {
		width : 190px;
		height : 190px;
		margin : 15% 0;
	}
	
	table {
	border : 2px solid gray;
	}

</style>
</head>
<body>
	<form action = "" method = "post" encType = "multipart/form-data">
		<div class = "insertArea">
			<table align = "center">
				<tr>
					<td> 프로필 사진 </td>
					<td colspan = "">
						<div class = "div-img-profile">
	    					<img src = "/et/image/common/logo_c.png" class = "img-profile" id = "img-profile">
	    				</div>
					</td>
					<td>
						<div id = "fileArea">
							<input type = "file" id = "profileImgSelect" name="profileImgSelect" onchange = "loadImg(this)">
						</div>		
					</td>
				</tr>
				<tr>
					<td> 자기소개글 </td>
					<td> 
						<div class="ui form">
						  <div class="field">
						    <label>Short Text</label>
						    <textarea name = "profileTxt" rows="2" cols = "50" style = "resize : none" placeholder = "자기 소개 부탁바람"></textarea>
						  </div>
						</div>
						
					</td>					
				</tr>
				
			</table>
				
		</div>
		
		<div class ="btnArea">
			<button type ="reset" onclick = "return">취소하기</button>
			<button type = "submit">완료하기</button>
		</div>
	</form>
	
	<script>
	function loadImg(value) {
		if(value.files && value.files[0]) { // value는 요소 파일이 있는 상태에 동작한다. 
			var reader = new FileReader(); // reader는 스트림 
			reader.onload = function(e) {
				$("#img-profile").attr("src", e.target.result); break;
			}
			reader.readAsDataURL(value.files[0]); //value의 files에 0번째 있는 애를 읽어온다. 
		}
		
	} 
	
	</script>
</body>
</html>