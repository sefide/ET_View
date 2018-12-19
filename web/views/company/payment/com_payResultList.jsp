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
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR" rel="stylesheet">
	
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
	
	
	#title{
	   display: inline-block;
 	   width: 70%;
 	   font-family: 'Nanum Gothic', sans-serif;
 	   font-weight : 800;
	}
	
	
	
	#page-link{
		color : rgb(42,90,133);
	}
	
	
	#div-my-coupon{
		padding : 20px 30px;
		border: 1px solid lightgray;
		border-radius : 10px;
 		width : 90%;
 		margin: 0 0 20px 20px;
	}
	
	.div-tour-paging{
		display:inline-block;
		width : 150px;
		margin-left: 40%;	
	}
	.couponArea{
		width:800px;
		margin-left: auto;
		margin-right: auto;
		
	
	}
	.couponArea table,th,tr,td{
		border : 1px solid black;
		text-align: center;
	}
	.couponArea th {
		background-color: gray;
	}
	
	
</style>
</head>
<body>
	<%@ include file = "/views/common/header_com.jsp" %>
	
	<div class="ui grid">
       	<div class = "two wide column"></div>
      	<div class = "twelve wide column" style="margin-top:50px;">
      		<div class = "container">
      		<div style = "margin-bottom:20px;">
      		<div class = "div-travel-agency">
	      		<img src = "/et/image/common/logo_c.png" class ="img-travel-agency">
	      		<h2 class = "h2-travel-agency"> Travel Agency </h2>
	      	</div>
	      	</div>
	      	
      		<div class="ui mt-20"> 
      			<i class="certificate icon"></i>
                <div class="ui header title" id ="title">쿠폰 결제내역 </div>
 
                
                <div id = "div-my-coupon">
	                <table class="couponArea">
	                	<tr>
	                		<th>번호</th>
	                		<th>쿠폰등급</th>
	                		<th>구입 개수</th>
	                		<th>결제금액</th>
	                		<th>결제날짜</th>
	                	</tr>
	                	<tr>
	                		<td>1</td>
	                		<td>Premium</td>
	                		<td>3</td>
	                		<td>60000</td>
	                		<td>2018-12-19</td>
	                	</tr>
	                </table>
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

            </div>
            
          
				
            
	            
           </div>
     	</div>
	</div>
	
	<%@ include file = "/views/common/footer_com.jsp" %>
</body>
</html>