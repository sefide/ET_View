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
     	 	font-weight:600;
     	 }
     	 
     	 .left-nav{
			float:left;
			margin: 5% 5%;
			text-align:left;
			display : table-cell;
			vertical-align : middle;
		} 
		.ul_01 {
			vertical-align:middle;
		}
		
		
</style>
</head>
<body>
<!-- 카테고리 네비게이터 -->
   		<div class="left-nav">
   			<div class="ui vertical menu" style="width:160px;">
			  <a class="item">
			    <h4 class="ui header" id="tag1" onclick = "test();">제휴사 관리</h4>
			  </a>
			  <a class="item">
			    <h4 class="ui header" onclick ="searchPost();">투어글 관리</h4>
			  </a>
			</div>
   		
       		<!-- <ul class="ul_01" style= vertical-align:middle;>
           		<li>
               		<div class="click" onclick = "test();">제휴사 관리</div>
           		</li>
           		<li>
               		<div class="click" onclick = "searchPost();">투어글 관리</div>
           		</li>
           		
       		</ul> -->
   		 </div>

	<script>
    
    	function test() {
    		location.href = "/et/selectList.co";
    		/* $("#tb1").css({"visibility":"visible"}); */
    	}
    	
    	function searchPost(){
    		/*	회원정보조회 누르면 회원현황테이블 숨기기
    		$("#tb1").css({"visibility":"hidden"}); */
    		location.href="/et/selectTour.mng";
    		
    	}
   
    	
    </script>
    
</body>
</html>