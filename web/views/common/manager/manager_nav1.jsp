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
			margin: 5% 5%;
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
   		
		<!-- 2019-01-09 새로운 네비생성(아래)
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
               			<div class="click" onclick = "check_black();">회원 정지시키기</div>
           				</li>
           				<li>
               			<div class="click" onclick = "manager_black();">정지회원 관리</div>
           				</li>
           				<li>
               			<div class="click" onclick = "manager_out_do();">회원 탈퇴시키기</div>
           				</li>
           				<li>
               			<div class="click" onclick = "manager_out();">탈퇴회원 관리</div>
           				</li>
               		</ul>
          		 	</li>
       		</ul> -->
       		
       			
			<div class="ui vertical menu">
			  <a class="item">
			    <h4 class="ui header" id="tag1" onclick = "test();">회원현황</h4>
			  </a>
			  <a class="item">
			    <h4 class="ui header"onclick = "check_manager();">회원정보 조회</h4>
			  </a>
			  <a class="item">
			    <h4 class="ui header">블랙리스트</h4>
			    <p onclick = "check_black();">회원 정지시키기</p>
			    <p onclick = "manager_black();">정지회원 관리</p>
			    <p onclick = "manager_out_do();">회원 탈퇴시키기</p>
			    <p onclick = "manager_out();">탈퇴회원 관리</p>
			  </a>
			</div>
       		
   		 </div>
	
	<script>
    
    	function test() {
    		location.href = "<%=request.getContextPath()%>/select01.mng";
    		/* $("#tag1").css({"font-weight":600}); */
    	}
    	
    	//회원정보 조회
    	function check_manager(){
    		location.href="<%=request.getContextPath()%>/select02.mng";
    	}
    	
    	/*블랙리스트관리*/
    	
    	//회원 정지시키기
    	function check_black(){
    		location.href="<%=request.getContextPath()%>/select03.mng";
    	}
    	
    	//정지회원 관리
    	function manager_black(){
    		location.href="<%=request.getContextPath()%>/select04.mng";
    	}
    	
    	//회원 탈퇴시키기
    	function manager_out_do(){
    		location.href="<%=request.getContextPath()%>/select06.mng";
    	}
    	
    	//탈퇴회원 관리
    	function manager_out(){
    		location.href="<%=request.getContextPath()%>/select05.mng";
    	}
    	
    </script>
    
</body>
</html>