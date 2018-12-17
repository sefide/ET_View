<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		.navbar {
			border-bottom : 1px solid rgba(228, 228, 228, 0.589);
			text-align : center;
			background: white;
			height : 70px;
		}
		.nav-top {
			top: 9%;
		}
		
        .column{
            height: 100%;
        }
        
        #txt_brand:hover {
        		color:black;
        		text-decoration: none;
        		cursor : pointer;
        }
        
        .a_logout:hover {
			color : black;
			text-decoration: none;
		}


        .nav-item{
            margin: 5px 5% 0 5%;
            font-weight:600; 
        }
        
        .nav-item-first{
        	margin-left:24%;
        }
       

        .mt-2{
            margin-top: 5%;
            width : 100%;
        }

		.header-top{
			display : block;
			width: 100%;
			height : 70px;
		    margin-top: 1%;
		    /* text-align : center; */
		}
		
		.header-top-inner{
			margin-left : 40%;
		}
		
		.header-top-img{
			width : 50px;
			margin-top : -3%;
		}
		
		.header-top-brand {
			color : black;
     	 	font-size : 35px;
     	 	font-weight : 600;
  	  	 	font-family: 'Ubuntu', sans-serif;
		}
		
		.img_login_btn{
			position: absolute;
        		width : 190px;
        		height : 40px;
        		top: 2.5%;
    			right: 5%;
        }
		
		.a_login{
			position: absolute;
    			top: 4%;
    			right: 14%;
		}
		
		.a_join{
			position: absolute;
			top : 4%; 
			right : 7%;
		}
		
		.left-nav{
			float:left;
			border:1px solid black;
			margin: 5% 5%;
			height:150px;
			text-align:left;
			display : table-cell;
			vertical-align : middle;
		} 
		
		
		.jbFixed {
        		position: fixed;
        		top: 0px;
     	 }
     	 .ul_01{
			list-style:none;     
			margin-top: 10px;
    		margin-left: -30px;
    		margin-right: 10px;
			
     	 }  
     	 .main_01{
     	 	margin:2%;
     	 	float:left;
     	 }
     	 table{
     	 	width:600px;
     	 	height:120px;
     	 	text-align:center;
     	 }
     	 table,tr,td{
     	 	border:1px solid black;
     	 }
     	 td{
     	 	width:300px;
     	 }
     	 th{
     	 	background-color:lightgray;
     	 }
     	 
     	 .click{
     	 	cursor : pointer;
     	 }
     	 .click:hover{
     	 	color:red;
     	 }
     	 
    </style>
</head>
<body>
<%@ include file = "common/header_manager.jsp" %>
	
	<!-- 카테고리 네비게이터 -->
   		<div class="left-nav">
       		<ul class="ul_01">
           		<li>
               		<b><div class="click" onclick = "test();">회원현황</div></b>
           		</li>
           		<li>
               		<div class="click" onclick = "">회원정보 조회</div>
           		</li>
           		<li>
               		<div class="click" onclick = "">블랙리스트</div>
               		<ul>
               			<li>
               			<div class="click" onclick = "">블랙회원 조회</div>
           				</li>
           				<li>
               			<div class="click" onclick = "">블랙회원 관리</div>
           				</li>
               		</ul>
          		 	</li>
       		</ul>
   		 </div>

    
    <script>
    	function test() {
    		location.href = "/et/views/main_com.jsp";
    	}
    </script>
    
    <div class="main_01">
    	<div class="ui header title">▶회원현황</div>
    	- 전체현황 <br><br>
    	<table>
    		<tr>
    			<th>전체회원</th>
    			<td>0명</td>
    		</tr>
    		<tr>
    			<th>오늘의 신규회원</th>
    			<td>0명</td>
    		</tr>
    		<tr>
    			<th>탈퇴한 회원</th>
    			<td>0명</td>
    		</tr>
    	</table>
    </div>
    
    
	
	<div class = "two wide column"></div>
	
	<%@ include file = "common/footer_com.jsp" %>
</body>
</html>