<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리 네비</title>
<style>
		.click{
     	 	cursor : pointer;
     	 }
     	 .click:hover{
     	 	color:rgb(20, 91, 137);
     	 	font-weight:600;
     	 }
     	 .click:{
    
     	 	
     	 }
     	 
     	 .left-nav{
			float:left;
			border:1px solid black;
			margin: 5% 5%;
			height:120px;
			text-align:left;
			display : table-cell;
			vertical-align: middle;
		} 
		
</style>
</head>
<body>
<!-- 카테고리 네비게이터 -->
   		<div class="left-nav">
       		<ul class="ul_01">
       			<br>
           		<li>
               		<div class="click" onclick = "test();"><h5>평가지 관리</h5></div>
           		</li>
               		<ul>
       			<li>
       				<div class="click" onclick = "check_black();">평가지 결과 조회</div>
   				</li>
           				
               		</ul>
          		 	</li>
       		</ul>
   		 </div>

	<script>
    
    	function test() {
    		location.href = "/et/views/main_eval.jsp";
    		/* $("#tb1").css({"visibility":"visible"}); */
    	}
    	

    	
    </script>
    
</body>
</html>