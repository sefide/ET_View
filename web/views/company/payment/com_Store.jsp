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
    .div-img-profile {
		width : 120px;
		height : 120px;
		border : 1px solid gray;
		background : rgba(42,90,133,0.5);;
		border-radius : 50%;
		float :left;
		text-align : center;
	}
	.img-profile {
		width : 80px;
		height : 80px;
		margin : 15% ;
	}
	.div-com-id{
		width:120px;
		height: 34px;
		margin-left: 150px;
	}
	
	.div-com-activity{
		width:260px;
		height:150px;
		margin-top:20px;
		text-align: left;
	}
	
	
	.div-payment-std{
		background-color: white;
		width: 350px;
		height: 350px;
		display: inline-block;
		margin-top: 20px;
		margin-left: 200px;
		text-align: center;
		background-color:gray;
		
	}
	.div-payment-prm{
		background-color: white;
		width: 350px;
		height: 350px;
		display: inline-block;
		margin-top: 20px;
		margin-left: 30px;
		text-align: center;
		background-color:gray;
		float: right
	}
	.price{
		background-color: yellow;
		height: 50px;
		width: 250px;
		margin-left: auto;
		margin-right: auto;
	}
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file= "/views/common/header_com.jsp" %>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

    <div class="ui grid">
        <div class = "two wide column"></div>
        <div class = "twelve wide column" style="margin-top:50px;">
        <div class = "div-img-profile">
    		<img src = "/et/image/common/logo_c.png" class = "img-profile">
    		<div class="div-com-activity">
	    		<h3>내 활동내역</h3>
	    		<br>
	    		<h4>Standard 쿠폰개수 : 5개</h4>
	    		<h4>Premium 쿠폰개수 : 5개</h4>
	    		<h4>내 글 개수: 6개</h4>
    		</div>
    	</div>
    	<div class="div-com-id">
    	<br>
    	<br>
    	<h2>아이디</h2>
    	</div>
          <!-- 내용 넣기 -->

          	<div class="div-payment-std">
          		<br>
          		<br>
          		<h3>standard</h3>
          		<h1>15000</h1>
          		<h5>won</h5>
          		<div class="price">
          			<h1>Buy Now</h1>
          		</div>
          		<br>
          		<br>
          		<h3>글 유효기간 : 30일</h3>
          		<h3>일반 글 게시 가능</h3>
          	</div>
          	<div class="div-payment-prm">
          	<br>
          		<br>
          		<h3>Premium</h3>
          		<h1>20000</h1>
          		<h5>won</h5>
          		<div class="price">
          			<h1>Buy Now</h1>
          		</div>
          		<br>
          		<br>
          		<h3>글 유효기간 : 30일</h3>
          		<h3>파워링크 게시 가능</h3>
          	</div>


    	
        </div>
        <div class = "two wide column"></div>
        
    	
   	</div>
   	
   	<!-- footer -->
	<%@ include file= "/views/common/footer.jsp" %>
</body>
</html>