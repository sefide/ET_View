<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<!-- 글꼴  -->
	<link rel="stylesheet" href="/css/style.css">
	
<style>
	.column {
		height : 100%;
	}
	
	.container {
		padding-left : 5px;
	}
	
	.mt-20{
		margin-left : 3%;
	}
	
	.div-travel-agency{
	    display: inline-block;
   		width: 70%;
	}
	
	.img-travel-agency{
		width: 50px;
		border-radius :50%;
		border : 1px solid black;
		display : inline-block;
		margin : -15px 10px 0 38px;
	}
	.h2-travel-agency{
		display : inline-block;
		font-size : 36px;
		font-family: 'Ubuntu', sans-serif;
		
	}
	.div-ta-coupon{
		width: 250px;
		display : inline-block;
		
	}
	
	.p-txt-coupon{
	    margin: -10px 2px;
   		font-weight: 500;
	}
	
	.div_tour_left {
		display : inline-block;
		width : 60%;
		/* border : 1px solid black; */
	}
	.div_tour_right{
		display : inline-block;
		width : 30%;
		float : right;
		pardding-left : 15px;
	}
	.title{
	   display: inline-block;
 	   width: 70%;
	}
	
	#page-link{
		color : rgb(42,90,133);
	}
	
	/* .card {
		height : 360px;
	}*/
	.card-img-top{
		height : 270px;
	} 
	
	.div-card-tour{
		width : 90%;
		margin-left : 20px;
		margin-top: 10px;
	}
	
	#div-my-tour{
		padding : 20px 30px;
		border: 1px solid lightgray;
		border-radius : 10px;
 		width : 90%;
 		margin: 0 0 20px 20px;
	}
	
	.span-tour-title{
		font-weight : 600;
		margin-top : 5px;
		font-size : 16px;
	}
	.div-tour-paging{
		display:inline-block;
		width : 150px;
		margin-left: 40%;	
	}
	
	.div-tour-btn{
		display:inline-block;
		width : 200px;
		margin-left: 15%;
	}
	
</style>
</head>
<body>
	<%@ include file = "common/header_com.jsp" %>
	
	<div class="ui grid">
       	<div class = "two wide column"></div>
      	<div class = "twelve wide column" style="margin-top:50px;">
      		<div class = "container">
      		<div style = "margin-bottom:20px;">
      		<div class = "div-travel-agency">
	      		<img src = "/et/image/common/logo_c.png" class ="img-travel-agency">
	      		<h2 class = "h2-travel-agency"> Travel Agency </h2>
	      	</div>
	      		<div class = "div-ta-coupon">
		      		<p class = "p-txt-coupon"> 보유한 쿠폰  </p>
		      		<table class="ui celled black table">
		      			<tr> 
		      				<th> <i class="star outline icon"></i> Standard </th>
		      				<th> <i class="star icon"></i> Premium </th>
		      			</tr>
		      			<tr> 
		      				<td> <label> 10장 </label>  </td>
		      				<td> <label> 3장  </label>  </td>
		      			</tr>
		      		</table>
	      		</div>
	      	</div>
	      	
      		<div class="ui mt-20"> 
      			<i class="certificate icon"></i>
                <div class="ui header title">내가 작성한 투어 </div>
                
                <div id = "div-my-tour">
                <div class = "div_tour_left">
                <div class = "span-tour-title"> 투어명 </div> 
				<span> 투어명 예시</span> <br>
                	<div class = "span-tour-title"> 투어컨셉 </div> 
				<span> 투어컨셉 예시</span> <br>
				<div class = "span-tour-title"> 설명 </div> 
				<span> 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 투어설명 예시</span> <br>
				<div class = "span-tour-title"> 가격 </div> 
				<span> 투어가격 예시</span><br>
                
                	</div>
                	<div class = "div_tour_right">
					<div  class = "span-tour-title"> 파워링크여부 </div> 
					<span> YES</span><i class="star icon"></i> <label> Premium </label>
					<div  class = "span-tour-title"> 연결링크 </div>
					<a href = "www.naver.com">www.naver.com</a>
					<div  class = "span-tour-title"> 대표사진  </div>
					<span> 사진명 tour.jpg </span>
                </div>
                </div>
                
                <div class = "div-tour-paging">
                		<nav aria-label="Page navigation">
					  <ul class="pagination pagination-sm">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous"  id = "page-link" >
					        <span aria-hidden="true">&laquo;</span>
					        <span class="sr-only">Previous</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" id = "page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" id = "page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" id = "page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next"  id = "page-link" >
					        <span aria-hidden="true">&raquo;</span>
					        <span class="sr-only">Next</span>
					      </a>
					    </li>
					  </ul>
					</nav>
                </div>
                <div class = "div-tour-btn">
             	  	<button class="ui yellow button">수정하기 </button>
					<button class="ui yellow button">삭제하기 </button>
				</div>
            </div>
            
            
      		<div class="ui mt-20"> 
      			<i class="certificate icon"></i>
                <div class="ui header title">다른 투어보기 </div>
                
	            <div class = "div-card-tour">
	            
	            <div class="card-deck">
				  <div class="card">
				    <img class="card-img-top" src="/et/image/city/bar.jpg" alt="Card image cap">
				    <div class="card-body">
				      <h5 class="card-title"> [도시이름]투어명 </h5>
				      <p class="card-text"> 69,900원 </p>
				      <p class="card-text"><small class="text-muted">투어컨셉 </small></p>
				    </div>
				  </div>
				  <div class="card">
				    <img class="card-img-top" src="/et/image/city/bar.jpg" alt="Card image cap">
				    <div class="card-body">
				       <h5 class="card-title"> [도시이름]투어명 </h5>
				      <p class="card-text"> 69,900원 </p>card-img-top
				      <p class="card-text"><small class="text-muted">투어컨셉 </small></p>
				    </div>
				  </div>
				  <div class="card">
				    <img class="card-img-top" src="/et/image/city/bar.jpg" alt="Card image cap">
				    <div class="card-body">
				      <h5 class="card-title"> [도시이름]투어명 </h5>
				      <p class="card-text"> 69,900원 </p>
				      <p class="card-text"><small class="text-muted">투어컨셉 </small></p>
				    </div>
				  </div>
				</div>
				</div>
				
            </div>
	            
           </div>
     	</div>
	</div>
	<div class = "two wide column"></div>
	
	<%@ include file = "common/footer_com.jsp" %>
</body>
</html>