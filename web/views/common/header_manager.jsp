<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
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
<link href="https://fonts.googleapis.com/css?family=Ubuntu:700&amp;subset=latin-ext" rel="stylesheet">

<script>
	$(function() {
		$("#a_header:first").css("color","rgb(20, 91, 137)");
	});
</script>
<style>
	@media screen and (max-width : 780px) {
		.txt_header_brand{
			font-size:18px;
		}
	
	}
	
		.navbar {
			border-bottom : 1px solid rgba(228, 228, 228, 0.589);
			text-align : center;
			background: rgb(20, 91, 137);
			height : 45px;
		}
		.nav-top {
			top: 8%;
		}
		
        .column{
            height: 100%;
        }


        .nav_item{
            margin: 5px 5% 0 5%;
        }
        
        .nav_link{
	        font-weight:600;
	        font-size :16px; 
            color : white;
        }
        
        .nav_link:hover{
            color : rgb(237,197,58);
            text-decoration : none;
        }
        
        .nav-item-first{
        		margin-left:13%;
        }
       
        .mt-2{
            margin-top: 5%;
            width : 100%;
        }

		.header-top{
			display : block;
			width: 100%;
			height : 45px;
		    margin-top: 1%;
		    /* text-align : center; */
		}
		
		.header-top-img{
			width : 40px;
			margin-top : -1%;
		}
		
		.header-top-brand {
			color : black;
     	 	font-size : 20px;
     	 	font-weight : 600;
     	 	font-family: 'Ubuntu', sans-serif;
		}
		
		 #txt_brand:hover {
        		color:black;
        		text-decoration: none;
     		cursor : pointer;
        		
        }
		
		
		.a_logout{
			position: absolute;
   			top: 2.5%;
   			right: 10%;
   			color : black;
   			font-weight : 600;
		}
		
		.a_logout:hover {
			color : black;
			text-decoration: none;
		}
		
		.header-bottom{
			display : block;
			z-index : 1030;
		} 

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 제휴사 네비게이션 시작 -->
	<div class = "header-top">
    		<div class="ui header-top-inner">
         	<img src="/et/image/common/logo.png" class = "header-top-img" onclick = "goHome();">
         	<a class="header-top-brand" id ="txt_brand" onclick = "goComeHome();">ET Planner For Manager</a>    
     	</div>
    </div>

    <div class = "header-btn">
       <a class = "a_logout" href = "/et/index.jsp">로그아웃 </a>
   	</div>
	   	
    <div class = "header-bottom">
    		<nav class="navbar navbar-expand-lg navbar-light nav-top">
        	
        	<button class="navbar-toggler" type="button" data-toggle="collapse" 
        data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        		<div class="collapse navbar-collapse nav-left-mrg nav-div-50" id="navbarTogglerDemo02">
            		<ul class="navbar-nav mr-auto mt-2 mt-lg-0 nav-div-50"> 
                		<li class="nav_item  nav-item-first">
                   		 <a class="nav_link" href="/et/views/main_manager.jsp">회원관리</a>
                		</li>
                		<li class="nav_item">
                    		<a class="nav_link" href="#">커뮤니티 관리</a>
                		</li>
                		<li class="nav_item">
                    		<a class="nav_link" href="#">여행플랜&여행지 관리</a>
               		 	</li><li class="nav_item">
                    		<a class="nav_link" href="#">투어&제휴사 관리</a>
               		 	</li><li class="nav_item">
                    		<a class="nav_link" href="#">평가지 관리</a>
               		 	</li>
            		</ul>
	        </div>
		</nav>
    </div>
    
    <script>
	    function goHome() {
	   	 location.href = "/et/index.jsp";
	    }
	    
	    
	    function goComHome(){
	   	 location.href = "/views/main_com.jsp";
	    }
    </script>
</body>
</html>