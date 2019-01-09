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
			border:1px solid black;
			margin: 5% 5%;
			height:100px;
			text-align:left;
			display : table-cell;
			vertical-align : middle;
		} 
		.ul_01 {
			margin-top:24px;
		}
		
</style>
</head>
<body>

<!-- 카테고리 네비게이터 -->
   		<div class="left-nav">
       		<ul class="ul_01">
           		<li>
               		<div class="click" onclick = "test();">커뮤니티 현황</div>
           		</li>
           		<li>
               		<div class="click" onclick = "check_manager();">게시글 조회</div>
           		</li>
           		
       		</ul>
   		 </div>

	<script>
    
    	function test() {
    		location.href = "<%=request.getContextPath()%>/total.mng";
    		/* $("#tb1").css({"visibility":"visible"}); */
    	}
    	
    	function check_manager(){
    		/*	회원정보조회 누르면 회원현황테이블 숨기기
    		$("#tb1").css({"visibility":"hidden"}); */
    		location.href="<%=request.getContextPath()%>/boardList.mng";
    	}
    	
    
    	
    </script>
    
</body>
</html>