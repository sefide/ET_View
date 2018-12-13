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

<style>
	.column {
		height : 100%;
	}
	
	.img-travel-agency{
		width: 40px;
		border-radius :50%;
		border : 1px solid black;
		display : inline-block;
	}
	
	.div_tour_left, .div_tour_right {
		display : inline-block;
		width : 400px;
		/* border : 1px solid black; */
	}
	
	.div_tour_left{
	    margin-left: 22px;
	}
	
	.div_tour_right{
	    margin-top: -20px;
	}
	
	.title{
	   display: inline-block;
 	   width: 70%;
	}
	
	#page-link{
		color : rgb(42,90,133);
	}
	
</style>
</head>
<body>
	<%@ include file = "common/header_com.jsp" %>
	
	<div class="ui grid">
       	<div class = "two wide column"></div>
      	<div class = "twelve wide column" style="margin-top:90px;">
      		<div class = "container">
	      		<img src = "../image/common/logo.png" class ="img-travel-agency">
	      		<h2> 제휴사명 </h2>
	      		<p> 쿠폰개수 </p>
	      		<table>
	      			<tr> 
	      				<th> <label> Standard </label>  </th>
	      				<th> <label> Premium </label>  </th>
	      			</tr>
	      			<tr> 
	      				<td> <label> 10장 </label>  </td>
	      				<td> <label> 3장  </label>  </td>
	      			</tr>
	      		</table>
	      		
	      	<hr>
	      		<div class="ui mt-20"> 
	      			<i class="certificate icon"></i>
	                <div class="ui header title">내가 작성한 투어 </div>
	                <div class = "div_tour_left">
	                	<table>
	                		<tr>
	                			<td> <label> 투어명 : </label> </td>
	                			<td> 투어명 예시 </td>
	                		</tr>
	                		<tr>
	                			<td> <label> 투어컨셉 : </label> </td>
	                			<td> 투어컨셉 예시 </td>
	                		</tr>
	                		<tr>
	                			<td> <label> 투어설명 : </label> </td>
	                			<td class = "td-tour-detail"> 투어설명 예시 </td>
	                		</tr>
	                		<tr>
	                			<td> <label> 투어가격 : </label> </td>
	                			<td> 투어가격 </td>
	                		</tr>
	                	</table>
	                	</div>
	                	<div class = "div_tour_right">
						<p> 파워링크여부 </p> 
						<i class="star icon"></i> <label> Premium </label>
						<i class="star outline icon"></i> <label> Standard </label>
						<p> 연결링크 </p> <a href = "www.naver.com">www.naver.com</a>
						<a> </a>
					<button class="ui yellow button">수정하기 </button>
					<button class="ui yellow button">삭제하기 </button>
						
	                </div>
	                <div>
	                		<nav aria-label="Page navigation example">
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
	      		<div class="ui mt-20"> 
	      			<i class="certificate icon"></i>
	                <div class="ui header title">다른 투어보기 </div>
		            <div>
		            <div class="card-deck">
					  <div class="card" style = "width:100px;">
					    <img class="card-img-top" src="../image/city/bar.jpg" alt="Card image cap">
					    <div class="card-body">
					      <h5 class="card-title">Card title</h5>
					      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					    </div>
					  </div>
					  <div class="card">
					    <img class="card-img-top" src="../image/city/bar.jpg" alt="Card image cap">
					    <div class="card-body">
					      <h5 class="card-title">Card title</h5>
					      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
					      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					    </div>
					  </div>
					  <div class="card">
					    <img class="card-img-top" src="../image/city/bar.jpg" alt="Card image cap">
					    <div class="card-body">
					      <h5 class="card-title">Card title</h5>
					      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
					      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					    </div>
					  </div>
					  <div class="card">
					    <img class="card-img-top" src="../image/city/bar.jpg" alt="Card image cap">
					    <div class="card-body">
					      <h5 class="card-title">Card title</h5>
					      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
					      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
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