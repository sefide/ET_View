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
	@media screen and (max-width : 1200px) {
       
    }
    @media screen and (min-width : 1200px) {
         #th4_city{
        		margin-left:20%;
        	}
    }
    
        .column{
            height: 100%;
        }

        .mt-20{
            margin-top: 10%;
        }
        
        .img_best_city{
        		width : 300px;
        		height : 300px;
        		border-radius: 50%;
        }
        
        .div-best-city{
        		display:inline-block;
        		text-align : center;         		
        		margin: 2%;
        }
        
        /* #th4_city{
        		margin-left:20%;
        	}
         */
        #card{
        		margin-left : 3%;
        }
        
        
        .img_main {
        		width : 600px;
        }
        
        .div_img_main{
        		text-align : center;
        }
        
        /* #last_city{
        		float:none;
        } */
       
       
    </style>
</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file= "views/header.jsp" %>

    <!-- 주 내용 담기 -->
    <div class="ui grid">
        <div class = "two wide column"></div>
        <div class = "twelve wide column" style="margin-top:90px;">
          <!-- 내용 넣기 -->
          <div class = "container">
            <div class="ui mt-20 div_img_main"> 
                <div class="ui image ">
                    <img class = "img_main" src="https://d1blyo8czty997.cloudfront.net/tour-photos/n/2231/1200x600/2036422203.jpg">
                </div>
                
            </div>
            
            <div >

            <div class="ui mt-20"> 
                <div class="ui huge header">BEST Plan TOP 3</div>
                
                <!-- card -->
                <div class="ui special cards">
                    <div class="card" id = "card">
                        <div class="blurring dimmable image">
                        <div class="ui dimmer">
                            <div class="content">
                            <div class="center">
                                <div class="ui inverted button">Add Friend</div>
                            </div>
                            </div>
                        </div>
                        <img src="image/common/logo.png">
                        </div>
                        <div class="content">
                        	   <a class="header">플랜제목 </a>
	                    	   <div class="meta like">
	                            <i class="like icon"></i> 4 Likes
	                        </div>
                        </div>
                    </div>
                    <div class="card" id = "card">
                        <div class="blurring dimmable image">
                        <div class="ui inverted dimmer">
                            <div class="content">
                            <div class="center">
                                <div class="ui primary button">Add Friend</div>
                            </div>
                            </div>
                        </div>
                        <img src="image/common/logo.png">
                        </div>
                        <div class="content">
                        		<a class="header">플랜제목 </a>
	                        <div class="meta like">
	                             <i class="like icon"></i> 4 Likes
	                        </div>
                        </div>
                    </div>
                    <div class="card" id = "card">
                        <div class="blurring dimmable image">
                        <div class="ui inverted dimmer">
                            <div class="content">
                            <div class="center">
                                <div class="ui primary button">Add Friend</div>
                            </div>
                            </div>
                        </div>
                        <img src="image/common/logo.png">
                        </div>
                        <div class="content">
                        		<a class="header">플랜제목 </a>
	                        <div class="meta like">
	                             <i class="like icon"></i> 4 Likes
	                        </div>
                        </div>
                    </div>
                </div>

            </div>
			<div class="ui mt-20"> 
                <div class="ui huge header">BEST CITY TOP 5</div>
	           	<div class = "ui div-best-city">
	           		<img src = "image/city/paris.jpg" alt = "paris" class = "img_best_city">
	           		<h3 class ="ui header">1. &nbsp; 프랑스, 파리 </h3>
	           	</div>
	           	<div class = "ui div-best-city">
	           		<img src = "image/city/rome.png" alt = "rome" class = "img_best_city">
	           		<h3 class ="ui header">2. &nbsp; 이탈리아, 로마  </h3>
	           	</div>
	           	<div class = "ui div-best-city">
	           		<img src = "image/city/bar.jpg" alt = "barselona" class = "img_best_city">
	           		<h3 class ="ui header">3. &nbsp; 스페인, 바르셀로나  </h3>
	           	</div>
	           	<div class = "ui div-best-city 4th_city" id = "th4_city">
	           		<img src = "image/city/praha.jpg" alt = "praha" class = "img_best_city">
	           		<h3 class ="ui header">4. &nbsp; 체코, 프라하  </h3>
	           	</div>
	           	<div class = "ui div-best-city" id = "last_city" >
	           		<img src = "image/city/frank.jpg" alt = "frank" class = "img_best_city">
	           		<h3 class ="ui header">5. &nbsp; 독일, 프랑크푸르트  </h3>
	           	</div>
            </div>
            
            <div class="ui mt-20"> 
                <div class="ui huge header">인기 투어 TOP 4 </div>
            	<!-- https://semantic-ui.com/views/card.html -->
				 <div class="ui four cards">
				  <div class="card">
				    <div class="image">
				    <!-- https://semantic-ui.com/elements/label.html -->
					  <a class="ui yellow tag right label">Hot</a>
				      <img src = "image/common/logo.png">
				    </div>
				    <div class="extra">
				      Rating:
				      <div class="ui star rating" data-rating="4"></div>
				    </div>
				  </div>
				  <div class="card">
				    <div class="image">
				      <img src = "image/common/logo.png">
				    </div>
				    <div class="extra">
				      Rating:
				      <div class="ui star rating" data-rating="2"></div>
				    </div>
				  </div>
				  <div class="card">
				    <div class="image">
				       <img src = "image/logo.png">
				    </div>
				    <div class="extra">
				      Rating:
				      <div class="ui star rating" data-rating="3"></div>
				    </div>
				  </div>
				  <div class="card">
				    <div class="image">
				      <img src = "image/common/logo.png">
				    </div>
				    <div class="extra">
				      Rating:
				      <div class="ui star rating" data-rating="4"></div>
				    </div>
				  </div>
                </div>
                
            </div>
             <div class="ui mt-20"> 
                <div class="ui huge header">인기 Q&A TOP 3 </div>
                <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
                <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>

            </div>
            </div>
        </div>
    </div>
        <div class = "two wide column"></div>
    </div>

    <!-- <script>
           /*  $('.special.cards .image').dimmer({
                on: 'hover'
            }); */
            
            $(".img_best_city").mouseover({
            		//alert("hello");
            		//console.log("hello");
            });
    </script> -->

	<!-- footer -->
	<%@ include file= "views/footer.jsp" %>
	
</body>
</html>