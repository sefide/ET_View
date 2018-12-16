<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<!-- Semantic UI -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	<title>ET_Planner</title>
	<link rel="icon" href="image/common/logo.png">
	
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
        
        /* 인기플랜  */
        .div-plan-list{
			margin-left : 15px;
		}
		
		.div-plan-map{
			width : 340px;
			height : 380px;
			display :inline-block;
			margin : 5px 12px 30px 10px;
			
		}
		
		.div-plan-title{
			font-size : 25px;
			font-weight : 500;
			font-family: 'Ubuntu', sans-serif;
			display : inline-block;
		}
		
		.div-plan-like{
			width : 80px;
			height : 30px;
			color : red;
			font-size : 18px;
			font-family: 'Ubuntu', sans-serif;
			border-radius : 5px;
			text-align : center;
			float:right;
			cursor : pointer;
		}
		
        /* 인기도시 */
        
        /* 인기질문  */
        .div-best-inner{
        		width : 310px;
        		height : 310px;
        		position: relative;
        		border-radius: 50%;
        }
        
        .img_best_city{
        		width : 310px;
        		height : 310px;
        		border-radius: 50%;
        		border : 1px solid lightgray;
        }
        
        .div_best_city_ex {
        		width : 310px;
        		height : 310px;
        		border-radius: 50%;
        		background : rgba(2,2,2,0.3);
        		color : white;
        		text-align : center;
        		/* display : table-cell;
        		vertical-align : middle; */
        		font-size : 20px;
        		visibility : hidden; 
        		position : absolute;
        		margin-top : -300px;
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
        
        #header-city{
        		color : gray;
        }
        
        .card-img-top{
			height : 230px;
		} 
       
       	/* Q&A */
       	.div-qna {
       		margin : 0 0 0 10px;
       	}
       
       	.div-qna-inner{
       		margin-left : 15px;
       	}
       	
       	.span-qna-q{
       		font-size : 40px;
       		font-weight : 600;
       	}
       
       	.img-qna-bar{
       		background : rgb(254, 200, 0);
       		width : 700px;
       		height : 45px;
       		border : 4px dotted rgba(238, 238, 238, 0.589);
       		display : inline-block;
       	}
    </style>
</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file= "views/common/header.jsp" %>

    <!-- 주 내용 담기 -->
    <div class="ui grid">
        <div class = "two wide column"></div>
        <div class = "twelve wide column" style="margin-top:50px;">
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
                
                <div> 
        				<div class = "div-plan-list">  
        					<div class ="div-plan-map"> 
        					    <iframe class = "plan-map" src="https://snazzymaps.com/embed/120714" width="340px" height="340px" style="border:none;"></iframe>
        						<div class = "div-plan-title"> 플랜 제목 </div>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart">34</i>
        						</div>
        					</div>
        					<div class ="div-plan-map"> 
        					    <iframe class = "plan-map" src="https://snazzymaps.com/embed/120714" width="340px" height="340px" style="border:none;"></iframe>
        						<div class = "div-plan-title"> 플랜 제목 </div>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart">34</i>
        						</div>
        					</div> 
        					<div class ="div-plan-map"> 
        					    <iframe class = "plan-map" src="https://snazzymaps.com/embed/120714" width="340px" height="340px" style="border:none;"></iframe>
        						<div class = "div-plan-title"> 플랜 제목 </div>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart">34</i>
        						</div>
        					</div>
        					
        				</div>
        			</div>
        			
                <!-- card -->
                <!-- <div class="ui special cards">
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
                </div> -->

            </div>
            
            
            
			<div class="ui mt-20"> 
                <div class="ui huge header">BEST CITY TOP 5</div>
                
	           	<div class = "ui div-best-city" >
	           		<div class = "div-best-inner">
		           		<img src = "image/city/paris.jpg" alt = "paris" class = "img_best_city">
						<div class="ui inverted dimmer">
						    <div class="content">
						      <h3 class="ui icon header" id = "header-city">
						        도시 설명 
						      </h3>
						    </div>
						</div>
					</div>
	           		<h3 class ="ui header">1. &nbsp; 프랑스, 파리 </h3>
	           	</div>
	           	
	           	<div class = "ui div-best-city">
	           		<div class = "div-best-inner">
		           		<img src = "image/city/rome.png" alt = "rome" class = "img_best_city">
		           		<div class="ui inverted dimmer">
						    <div class="content">
						      <h3 class="ui icon header" id = "header-city">
						        도시 설명 
						      </h3>
						    </div>
						</div>
					</div>
	           		<h3 class ="ui header">2. &nbsp; 이탈리아, 로마  </h3>
	           	</div>
	           	
	           	<div class = "ui div-best-city">
	           		<div class = "div-best-inner">
	           			<img src = "image/city/bar.jpg" alt = "barselona" class = "img_best_city">
						<div class="ui inverted dimmer">
						    <div class="content">
						      <h3 class="ui icon header" id = "header-city">
						        도시 설명 
						      </h3>
						    </div>
						</div>
					</div>
	           		<h3 class ="ui header">3. &nbsp; 스페인, 바르셀로나  </h3>
	           	</div>
	           	<div class = "ui div-best-city 4th_city" id = "th4_city">
	           		<div class = "div-best-inner">
	           			<img src = "image/city/praha.jpg" alt = "praha" class = "img_best_city">
						<div class="ui inverted dimmer">
						    <div class="content">
						      <h3 class="ui icon header" id = "header-city">
						        도시 설명 
						      </h3>
						    </div>
						</div>
					</div>
	           		<h3 class ="ui header">4. &nbsp; 체코, 프라하  </h3>
	           	</div>
	           	<div class = "ui div-best-city" id = "last_city" >
	           		<div class = "div-best-inner">
	           			<img src = "image/city/frank.jpg" alt = "frank" class = "img_best_city">
						<div class="ui inverted dimmer">
						    <div class="content">
						      <h3 class="ui icon header" id ="header-city">
						        도시 설명 
						      </h3>
						    </div>
						</div>
					</div>
	           		<h3 class ="ui header">5. &nbsp; 독일, 프랑크푸르트  </h3>
	           	</div>
            </div>
            
            <div class="ui mt-20"> 
                <div class="ui huge header">인기 투어 TOP 4 </div>
                
                <div class = "div-card-tour">
	            
	            <div class="card-deck">
				  <div class="card" id = "card-size">
				    <img class="card-img-top" src="/et/image/city/bar.jpg" alt="Card image cap">
				    <div class="card-body">
				      <h5 class="card-title"> [도시이름]투어명 </h5>
				      <p class="card-text"> 69,900원 </p>
				      <p class="card-text"><small class="text-muted">투어컨셉 </small></p>
				    </div>
				  </div>
				  <div class="card" id = "card-size">
				    <img class="card-img-top" src="/et/image/city/bar.jpg" alt="Card image cap">
				    <div class="card-body">
				      <h5 class="card-title"> [도시이름]투어명 </h5>
				      <p class="card-text"> 69,900원 </p>
				      <p class="card-text"><small class="text-muted">투어컨셉 </small></p>
				    </div>
				  </div>
				  <div class="card">
				    <img class="card-img-top" src="/et/image/city/bar.jpg" alt="Card image cap">
				    <div class="card-body">
				       <h5 class="card-title"> [도시이름]투어명 </h5>
				      <p class="card-text"> 69,900원 </p>
				      <p class="card-text"><small class="text-muted">투어컨셉 </small></p>
				    </div>
				  </div>
				  <div class="card">
				    <img class="card-img-top" src="/et/image/city/bar.jpg" alt="Card image cap">
				    <div class="card-body">
				      <h5 class="card-title"> [도시이름]투어명 </h5>
				      <p class="card-text"> 69,900원 </p>
				      <p class="card-text"><small class="text-muted">투어컨셉 </small></p>
				    </div>
				  </div>
				</div>
				</div>
            	<!-- https://semantic-ui.com/views/card.html -->
				 <!-- <div class="ui four cards">
				  <div class="card">
				    <div class="image">
				    https://semantic-ui.com/elements/label.html
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
				       <img src = "image/common/logo.png">
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
                </div> -->
                
            </div>
             <div class="ui mt-20"> 
                <div class="ui huge header">인기 Q&A </div>
				<div class = "div-qna">
					<div class = "div-qna-inner">
						<span class = "span-qna-q"> Q. </span>
						<div class = "img-qna-bar">
							<p class = "">질문 예시 얍얍얍 </p>
							<i class="heart icon">23</i>
						</div>
					</div>
				</div>
				<div class = "div-qna">
					<div class = "div-qna-inner">
						<span class = "span-qna-q"> Q. </span>
						<div class = "img-qna-bar">
							<p class = "">질문 예시 얍얍얍 </p>
							<i class="heart icon">23</i>
						</div>
					</div>
				</div>
				<div class = "div-qna">
					<div class = "div-qna-inner">
						<span class = "span-qna-q"> Q. </span>
						<div class = "img-qna-bar">
							<p class = "">질문 예시 얍얍얍 </p>
							<i class="heart icon">23</i>
						</div>
					</div>
				</div>
            </div>
            </div>
        </div>
    </div>
        <div class = "two wide column"></div>
    </div>

	<!-- Semantic UI -->
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <script>
	    /* $(".img_best_city").mouseover(function() {
			$('.div-best-inner').dimmer('show');
		}); */
	    $('.div-best-inner').dimmer({
	    		on : 'hover'
	    });
	    
         $('.special.cards .image').dimmer({
             on: 'hover'
         });
       
         function goHome() {
    	   	 	location.href = "/et/index.jsp";
    	   	 }
           
    </script>
    

	<!-- footer -->
	<%@ include file= "views/common/footer.jsp" %>
	
</body>
</html>