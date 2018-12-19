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
            margin-top: 8%;
        }
        
        /* 상단  */
        .top-div{
        		display: flex;
        }
        
        .top-img{
        		width : 70%;
        }
        
        .top-btn{
        		width : 30%;
        		text-align: center;
        }
        .img_main {
        		width : 100%;
        		height : 500px;
        }
        .mySlides {display:none;}
        
        #a_makePlan{
        		border : none;
            width : 160px;
            height : 42px;
            font-size : 18px;
            top : 30%;
            background-color : rgb(237,197,58);
            color : white;
            cursor : pointer;
            box-shadow : 3px 3px 1px 0 rgb(200,180, 48);;
            position:relative;
        }
        #a_makePlan::before{
            content:"";
            position:absolute;
            left:0;
            top:0;
            width:100%;
            height:100%;
            transition:0.7s;
            background-attachment: transparent;
        }
        #a_makePlan:hover::before{
           background-color : gray;
            opacity:0.2;
        }
        
        
         #a_seePlan{
        		border : none;
            width : 160px;
            height : 42px;
            font-size : 18px;
            top : 40%;
            background-color : rgb(237,197,58);
            color : white;
            cursor : pointer;
            box-shadow : 3px 3px 1px 0 rgb(200,180, 48);
            position:relative;
        }
        #a_seePlan::before{
            content:"";
            position:absolute;
            left:0;
            top:0;
            width:100%;
            height:100%;
            transition:0.7s;
            background-attachment: transparent;
        }
        #a_seePlan:hover::before{
            background-color : gray;
            opacity:0.2;
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
        
        #card{
        		margin-left : 3%;
        }
        
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
       	
       	#img-qna-bar{
       		border : none;
            width : 700px;
            height : 42px;
            font-size : 18px;
            top : 40%;
            background-color : rgb(237,197,58);
            cursor : pointer;
            box-shadow : 3px 3px 1px 0 rgb(200,180, 48);
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
            <div class="ui mt-20 top-div"> 
                <div class="ui top-img">
                    <img class = "img_main mySlides" src="https://d1blyo8czty997.cloudfront.net/tour-photos/n/2231/1200x600/2036422203.jpg">
                    <img class = "img_main mySlides" src="https://img-wishbeen.akamaized.net/plan/1466139331562_shutterstock_128300366.jpg">
               	    <img class = "img_main mySlides" src="http://www.travelnbike.com/news/photo/201706/40021_37790_466.jpg">
                    <img class = "img_main mySlides" src="https://previews.123rf.com/images/ventdusud/ventdusud1601/ventdusud160100003/50960502-%EB%91%90%EC%98%A4%EB%AA%A8-%EC%9D%BC%EC%B6%9C-%EB%B0%80%EB%9D%BC%EB%85%B8-%EC%9C%A0%EB%9F%BD%EC%9E%85%EB%8B%88%EB%8B%A4-.jpg">
        		        <img class = "img_main mySlides" src="http://www.seoulmilkblog.co.kr/wp/wp-content/uploads/2016/10/%EA%B2%A8%EC%9A%B8%EC%9C%A0%EB%9F%BD%EC%97%AC%ED%96%892.jpg">
                	</div>
                <div class ="top-btn">
          	      	<button id="a_makePlan" onclick = "goPlan();"><span>플랜 짜기</span></button>
          	      	<br>
	       			<button id="a_seePlan" onclick = "go"><span>플랫 엿보기</span></button>
	       		</div>
            </div>
            
            <div >

            <div class="ui mt-20"> 
                <div class="ui huge header">BEST Plan TOP 3</div>
                
                <div> 
        				<div class = "div-plan-list">  
        					<div class ="div-plan-map"> 
        					    <iframe class = "plan-map" src="#" width="340px" height="340px" style="border:none;"></iframe>
        						<div class = "div-plan-title"> 플랜 제목 </div>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart">34</i>
        						</div>
        					</div>
        					<div class ="div-plan-map"> 
        					    <iframe class = "plan-map" src="#" width="340px" height="340px" style="border:none;"></iframe>
        						<div class = "div-plan-title"> 플랜 제목 </div>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart">34</i>
        						</div>
        					</div> 
        					<div class ="div-plan-map"> 
        					    <iframe class = "plan-map" src="#" width="340px" height="340px" style="border:none;"></iframe>
        						<div class = "div-plan-title"> 플랜 제목 </div>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart">34</i>
        						</div>
        					</div>
        					
        				</div>
        			</div>
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
                
            </div>
             <div class="ui mt-20"> 
                <div class="ui huge header">인기 Q&A </div>
				<div class = "div-qna">
					<div class = "div-qna-inner">
						<!-- <span class = "span-qna-q"> Q. </span> -->
						<!-- <div class = "img-qna-bar">
							<p class = "">질문 예시 얍얍얍 </p>
							<i class="heart icon">23</i>
						</div> -->
						<div id="img-qna-bar">
							<span class = "span-qna-q"> Q1. </span>
							<span>질문 예시 얍얍얍얍 </span>
							<i class="heart icon">23</i>
						</div>
					</div>
				</div>
				<div class = "div-qna">
					<div class = "div-qna-inner">
						<div id="img-qna-bar">
							<span class = "span-qna-q"> Q2. </span>
							<span>질문 예시 얍얍얍얍 </span>
							<i class="heart icon">23</i>
						</div>
					</div>
				</div>
				<div class = "div-qna">
					<div class = "div-qna-inner">
						<div id="img-qna-bar">
							<span class = "span-qna-q"> Q3. </span>
							<span>질문 예시 얍얍얍얍 </span>
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
    
	<script>
		var myIndex = 0;
		carousel();
		
		function carousel() {
		    var i;
		    var x = document.getElementsByClassName("mySlides");
		    for (i = 0; i < x.length; i++) {
		       x[i].style.display = "none";  
		    }
		    myIndex++;
		    if (myIndex > x.length) {myIndex = 1}    
		    x[myIndex-1].style.display = "block";  
		    setTimeout(carousel, 2000); // Change image every 2 seconds
		}
	</script>
	<!-- footer -->
	<%@ include file= "views/common/footer.jsp" %>
	
</body>
</html>