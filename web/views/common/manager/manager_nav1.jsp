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
     	 .click:click{ 
     	 	<!--폰트적용 안됨 -->
     	 	font-weight:600;
     	 }
     	 
     	 .left-nav{
			border:1px solid black;
			margin: 5% 5%;
			height:150px;
			text-align:left;
			display : table-cell;
			vertical-align : middle;
		} 
		.root-div{
			margin:5% 5%;
			/* float:left; */
			width:15%;
			height:100%;
			
		}
		
		
</style>
</head>
<body>
<!-- 카테고리 네비게이터 -->
	<!-- <div class="root-div"> -->
   		<div class="left-nav">
       		<ul class="ul_01" >
           		<li>
               		<div class="click" id="tag1" onclick = "test();">회원현황</div>
           		</li>
           		<li>
               		<div class="click" onclick = "check_manager();">회원정보 조회</div>
           		</li>
           		<li>
               		<div>블랙리스트</div>
               		<ul>
               			<li>
               			<div class="click" onclick = "check_black();">블랙회원 조회</div>
           				</li>
           				<li>
               			<div class="click" onclick = "manager_black();">블랙회원 관리</div>
           				</li>
               		</ul>
          		 	</li>
       		</ul>
   		 </div>
	<!-- </div> -->
	
	<script>
    
    	function test() {
    		location.href = "/et/views/manager/normalMember/manager_main.jsp";
    		$("#tag1").css({"font-weight":600});
    	}
    	
    	function check_manager(){
    		location.href="/et/views/manager/normalMember/manager_check_manager.jsp";
    	}
    	
    	function check_black(){
    		location.href="/et/views/manager/normalMember/manager_check_black.jsp";
    	}
    	
    	function manager_black(){
    		location.href="/et/views/manager/normalMember/manager_black.jsp";
    	}
    	
    </script>
    
</body>
</html>