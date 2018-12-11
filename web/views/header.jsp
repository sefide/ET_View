<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		.navbar {
			border-bottom : 1px solid rgba(228, 228, 228, 0.589);
			text-align : center;
			background: white;
			height : 70px;
		}
		/* .nav-top {
			top: 9%;
		} */
		
        .column{
            height: 100%;
        }


        .nav-item{
            margin: 5px 5% 0 5%;
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
		
		.header-bottom{
			display : block;
			z-index : 1030;
		} 
		
		
		.jbFixed {
        		position: fixed;
        		top: 0px;
     	 }
     	 
     	
		
       
    </style>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.header-bottom' ).offset();
        
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
        	   $('.nav-top').css("top","0%");
            $( '.header-bottom' ).addClass('jbFixed');
          }
          else {
        	  $('.nav-top').css("top","9%");
            $( '.header-bottom' ).removeClass('jbFixed');
          }
        });
      } );
    </script>
</head>
<body>
	<!-- 네비게이션 시작 -->
	<div class = "header-top">
    		<div class="ui header-top-inner">
         	<img src="image/common/logo.png" class = "header-top-img">
         	<a class="header-top-brand" id ="txt_brand" href="#">ET Planner</a>    
     	</div>
    </div>

    	<div class = "header-btn">
       <img src = "image/common/btn_login.png" class = "img_login_btn">
       <a class = "a_login" href = "views/login.jsp">로그인 </a>
       <a class = "a_join" href = "#">회원가입 </a>      
   	</div>
	   	
    <div class = "header-bottom">
    		<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white nav-top">
        	
        	<button class="navbar-toggler" type="button" data-toggle="collapse" 
        data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        		<div class="collapse navbar-collapse nav-left-mrg nav-div-50" id="navbarTogglerDemo02">
            		<ul class="navbar-nav mr-auto mt-2 mt-lg-0 nav-div-50"> 
                		<li class="nav-item  nav-item-first">
                   		 <a class="nav-link" href="#">플랜짜기</a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link" href="#">플랫엿보기</a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link" href="#">투어엿보기</a>
               		 </li>
                		<li class="nav-item">
                        	<a class="nav-link" href="#">Q&A</a>
                		</li>
            		</ul>
	        </div>
		</nav>
    </div>
</body>
</html>
