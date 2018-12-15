<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
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
			background: rgb(254, 200, 0);
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
            color : rgb(42,90,133);
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
		
		
		.a_logout{
			position: absolute;
   			top: 2.5%;
   			right: 10%;
   			color : black;
   			font-weight : 600;
		}
		
		.header-bottom{
			display : block;
			z-index : 1030;
		} 

</style>
</head>
<body>
	<!-- 제휴사 네비게이션 시작 -->
	<div class = "header-top">
    		<div class="ui header-top-inner">
         	<img src="/et/image/common/logo.png" class = "header-top-img">
         	<a class="header-top-brand" id ="txt_brand" href="#">ET Planner For Travel Agency</a>    
     	</div>
    </div>

    <div class = "header-btn">
       <a class = "a_logout" href = "">로그아웃 </a>
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
                   		 <a class="nav_link" href="#">투어관리</a>
                		</li>
                		<li class="nav_item">
                    		<a class="nav_link" href="#">쿠폰 히스토리</a>
                		</li>
                		<li class="nav_item">
                    		<a class="nav_link" href="#">쿠폰상점</a>
               		 </li>
            		</ul>
	        </div>
		</nav>
    </div>
</body>
</html>