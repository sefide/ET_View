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
        	<%@ include file = "/views/common/manager/manager_plan_nav.jsp" %>
      	
        	</div>
        	
    	
        	<div class="inner-2">
        	<h1> ▶여행지 수정</h1>
        	<p>체크박스에 체크한 여행지들을 보여주는 공간</p>
        	
        	<p>여행지 설명</p>
         	<textArea>내용을 입력해주세요</textArea>
         	
         	<p>이동수단</p>
         	
         	<input type="checkbox" value="비행기">비행기 <br>      
         	<input type="checkbox" value="기차">기차      <br>
         	<input type="checkbox" value="버스">버스      <br>
         	<input type="checkbox" value="배">배      <br>
         	<input type="checkbox" value="">기타<textArea></textArea>  
         	
         	<p>권장 체류 일수</p>
         	  <textArea>내용을 입력해주세요</textArea>  <br> 
         	  <button>완료</button>
        	 </div>
         
         
         
         
         
        </div>
        </div>
        <div class = "two wide column"></div>
   	</div>
   	
   	<!-- footer -->
	<%@ include file= "/views/common/normal/footer.jsp" %>
</body>
</html>