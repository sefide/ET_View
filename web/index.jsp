<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.kh.et.board.model.vo.*, com.kh.et.plan.model.vo.*, com.kh.et.tourBoard.model.vo.*"%>
<%
	String msg = (String)request.getAttribute("msg");	
	HashMap<String, Object> topPlan = (HashMap<String, Object>)request.getAttribute("topPlan");
	HashMap<String, City> cityMap = (HashMap<String, City>)topPlan.get("cityMap");
	ArrayList<City> topCity = (ArrayList<City>)request.getAttribute("topCity");
	ArrayList<HashMap<String, Object>> topTour = (ArrayList<HashMap<String, Object>>)request.getAttribute("topTour");
	ArrayList<Board> topBoard = (ArrayList<Board>)request.getAttribute("topBoard");
%>

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

	<!-- googleMap -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDoMpIr7wrKdZrGsBCW1zoNesmP8fhCdH0" type="text/javascript"></script>
 	
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
        		width : 62%;
        		/* margin-right : 1%; */
        }
        
        .top-btn{
        		width : 37%;
        		/* text-align: center; */
        		margin-left :1%;
        }
        .img_main {
        		width : 100%;
        		height : 460px;
        }
        .mySlides {display:none;}
        
        .top-btn-inner, .et-main{
        		width : 100%;
        		display : flex;
        		flex-wrap : wrap;
        	}
        	#bol1{
			font-family: 'Ubuntu', sans-serif;
        		font-weight : 800;
        		font-size : 46px;
        		color : rgb(252,198,0);
        		margin-top : 5px;
        		margin-bottom : 13px;
        		text-shadow: 1px 1px 1px rgb(171, 199, 244);
        	}
        	#bol2{
        		font-family: 'Nanum Gothic', sans-serif;
        		font-weight : 800;
        		font-size : 24px;
        		margin-bottom : 10px;
        	}
        	.et-explain{
        		margin-left : 10px;
        		margin-top : 10px;
        		margin-bottom : 50px;
        		width : 100%;
        		height : 140px;
        		font-family: 'Nanum Gothic', sans-serif;
        		font-weight : 500;
        		font-size : 20px;
        		/* text-align : center; */
        	}
        	.et-logoes{
        		margin-left : 9%;
        		height : 88px;
        		margin-bottom : 10px;
        	}
        	.et-logo1 {
        		width : 300px;
        		 height : 92px; 
        		/* display : inline-block; */
        	}
        	.et-logo2{
       	 	width : 70px;
        		height : 70px;
        	}
         .btn-makePlan{
        		width : 99%;
        		height : 160px;
        	} 
        
        #a_makePlan{
        		border : none;
        		width : 93%;
	        height : 56px;
	        font-size : 18px;
	        /* top : 2%; */
	        margin: 1%;
	        background-color : rgb(171, 199, 244);
	        color : white;
	        font-family: 'Nanum Gothic', sans-serif;
        		font-weight : 800;
	        cursor : pointer;
	        box-shadow : 3px 3px 1px 0 rgb(151, 179, 234);
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
            width : 93%;
            height : 56px;
            font-size : 18px;
            /* top : 2%; */
	        margin: 2% 1%;
            background-color : rgb(171, 199, 244);
            font-family: 'Nanum Gothic', sans-serif;
        		font-weight : 800;
            color : white;
            cursor : pointer;
            box-shadow : 3px 3px 1px 0 rgb(151, 179, 234);
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
		
		.plan-map{
			width : 340px;
			height : 340px;
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
		#card-size{
			cursor : pointer;
		}
       
       	/* Q&A */
       	.div-qna {
       		margin : 0 0 0 10px;
       	}
       
       	.div-qna-inner{
       		margin-left : 15px;
       		width : 95%;
            /* height : 55px; */
            font-size : 18px;
            top : 40%;
            background-color : white;
            border : 6px solid rgb(260,220,108);
            cursor : pointer;
            box-shadow : 3px 3px 1px 0 rgba(200,180, 48);
            padding : 1%;
       	}
       	
       	.span-qna-q{
       		font-size : 40px;
       		font-weight : 600;
       	}
       
       	#img-qna-bar{
       		margin : 1%;
            width : 97%;
            border-bottom : 1px dashed gray;
            position : relative;
            /* height : 55px;
            font-size : 18px;
            top : 40%;
            background-color : white;
            border : 5px solid rgb(260,220,108);
            cursor : pointer;
            box-shadow : 3px 3px 1px 0 rgba(200,180, 48); */
       	}
       	#like-qna{
       		display : inline-block;
       		width : 100px;
			position : absolute;
			margin-right: 10%;
    			margin-top: 10px;
		}
       	
       	/* 더보기  */
       	.more-div{
			position : absolute;
			margin-top: -50px;
  			right: 10%;
  			cursor : pointer;
		}
		#more-icon {
			font-size : 18px;
		}
		#more-txt {
			color : rgb(50,50,50);
	        font-family: 'Nanum Gothic', sans-serif;
        		font-weight : 800;
		}
		
    </style>
</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file= "views/common/normal/header.jsp" %>

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
                	<div class ="top-btn-inner">
                		<div class = "et-explain"> 
                		<h3 id = "bol1"> ET Planner </h3>
                		<h3 id = "bol2">누구에게나 맞춤화된 <br>심플한 유럽 여행 계획 플랫폼  </h3>
                		우리 모두 행복한 유럽 여행에 도전하세요 ! </div>
                		<div class ="et-logoes">
                		<img src = "/et/image/common/logo_ev3.png" alt = "logo" class = "et-logo1 et-logo1">
                		</div>
                		<div class ="et-main">
	                		<div class = "btn-makePlan">
	                			<button id="a_makePlan" onclick = "goPlan();"><span>플랜 짜기</span></button> <br>
	                			<button id="a_seePlan" onclick = "goSeePlan();"><span>플랫 엿보기</span></button>
	                		</div>
                		</div>
                	</div>
                	
	       			
	       		</div>
            </div>
            
            <div >
			
            <div class="ui mt-20"> 
                <div class="ui huge header">BEST Plan TOP 3</div>
                <div class = "more-div" onclick = "location.href ='/et/views/normal/plan/seePlan_main.jsp'">
	                <i class="chevron circle right icon" id = "more-icon"></i>
	                <font id ="more-txt">더보기 </font>
                </div>
                <div> 
        				<div class = "div-plan-list">  
        				<% 
        				ArrayList<Plan> planList = (ArrayList<Plan>)topPlan.get("planList");
        				for(int i = 0; i < planList.size(); i++){
        					System.out.println("i : " + i);
        					Plan p = planList.get(i);
        				%>
        					<div class ="div-plan-map"> 
        					    <div id ="plan-map<%=i%>" class ="plan-map"></div>
        						<div class = "div-plan-title"><%=p.getpTitle() %></div>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart"><%=p.getpLike() %></i>
        						</div>
        					</div>
        				<%} %>
        				 <%-- 	<div class ="div-plan-map"> 
        					    <div id ="plan-map1"></div>
        						<div class = "div-plan-title"><%=topPlan2.getpTitle() %></div>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart"><%=topPlan2.getpLike() %></i>
        						</div>
        					</div> 
        					<div class ="div-plan-map"> 
        					    <div id ="plan-map2"></div>
        						<div class = "div-plan-title"><%=topPlan3.getpTitle() %></div>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart"><%=topPlan3.getpLike() %></i>
        						</div>
        					</div>  --%>
        					
        				</div>
        			</div>
            </div>
            
            
            
			<div class="ui mt-20"> 
                <div class="ui huge header">BEST CITY TOP 5</div>
                 
	           	<div class = "ui div-best-city" >
	           	<% 
	           	City topCity1 = (City)topCity.get(0); 
	           	City topCity2 = (City)topCity.get(1); 
	           	City topCity3 = (City)topCity.get(2); 
	           	City topCity4 = (City)topCity.get(3); 
	           	City topCity5 = (City)topCity.get(4); 
	           	%>
	           		<div class = "div-best-inner">
		           		<img src = "<%=request.getContextPath()%>/image/city/<%=topCity1.getCtName() %>.jpg" alt = "<%=topCity1.getCtName() %>" class = "img_best_city">
						<div class="ui inverted dimmer">
						    <div class="content">
						      <h3 class="ui icon header" id = "header-city">
						        <%=topCity1.getCtInfo() %>
						      </h3>
						    </div>
						</div>
					</div>
	           		<h3 class ="ui header">1. &nbsp; <%=topCity1.getCtCountry() %>,&nbsp; <%=topCity1.getCtName() %> </h3>
	           	</div>
	           	
	           	<div class = "ui div-best-city">
	           		<div class = "div-best-inner">
		           		<img src = "<%=request.getContextPath()%>/image/city/<%=topCity2.getCtName() %>.jpg" alt = "<%=topCity2.getCtName() %>" class = "img_best_city">
		           		<div class="ui inverted dimmer">
						    <div class="content">
						      <h3 class="ui icon header" id = "header-city">
						          <%=topCity2.getCtInfo() %>
						      </h3>
						    </div>
						</div>
					</div>
	           		<h3 class ="ui header">2. &nbsp; <%=topCity2.getCtCountry() %>,&nbsp; <%=topCity2.getCtName() %>  </h3>
	           	</div>
	           	
	           	<div class = "ui div-best-city">
	           		<div class = "div-best-inner">
	           			<img src = "<%=request.getContextPath()%>/image/city/<%=topCity3.getCtName() %>.jpg" alt = "<%=topCity3.getCtName() %>" class = "img_best_city">
						<div class="ui inverted dimmer">
						    <div class="content">
						      <h3 class="ui icon header" id = "header-city">
						          <%=topCity3.getCtInfo() %>
						      </h3>
						    </div>
						</div>
					</div>
	           		<h3 class ="ui header">3. &nbsp; <%=topCity3.getCtCountry() %>,&nbsp; <%=topCity3.getCtName() %>  </h3>
	           	</div>
	           	<div class = "ui div-best-city 4th_city" id = "th4_city">
	           		<div class = "div-best-inner">
	           			<img src = "<%=request.getContextPath()%>/image/city/<%=topCity4.getCtName() %>.jpg" alt = "<%=topCity4.getCtName() %>" class = "img_best_city">
						<div class="ui inverted dimmer">
						    <div class="content">
						      <h3 class="ui icon header" id = "header-city">
						          <%=topCity4.getCtInfo() %>
						      </h3>
						    </div>
						</div>
					</div>
	           		<h3 class ="ui header">4. &nbsp; <%=topCity4.getCtCountry() %>,&nbsp; <%=topCity4.getCtName() %> </h3>
	           	</div>
	           	<div class = "ui div-best-city" id = "last_city" >
	           		<div class = "div-best-inner">
	           			<img src = "<%=request.getContextPath()%>/image/city/<%=topCity5.getCtName() %>.jpg" alt = "<%=topCity5.getCtName() %>" class = "img_best_city">
						<div class="ui inverted dimmer">
						    <div class="content">
						      <h3 class="ui icon header" id ="header-city">
						          <%=topCity5.getCtInfo() %>
						      </h3>
						    </div>
						</div>
					</div>
	           		<h3 class ="ui header">5. &nbsp; <%=topCity5.getCtCountry() %>,&nbsp; <%=topCity5.getCtName() %>  </h3>
	           	</div>
            </div>
            
            <div class="ui mt-20"> 
                <div class="ui huge header">인기 투어 TOP 4 </div>
                 <div class = "more-div" onclick = "location.href ='/et/views/normal/tourBoard/seeTour_main.jsp'">
	                <i class="chevron circle right icon" id = "more-icon"></i>
	                <font id ="more-txt">더보기 </font>
                </div>
                
                <div class = "div-card-tour">
	            <div class="card-deck">
	            <%for(int i = 0; i < topTour.size(); i++){ 
	            HashMap<String,Object> tour = topTour.get(i);
	            TourBoard t = (TourBoard)tour.get("t");
	            Attachment a = (Attachment)tour.get("a");
	            %>
				  <div class="card" id = "card-size" onclick = "location.href = '<%=request.getContextPath() %>/selectOne.tb?tbno='+<%= t.getTno()%>" >
				    <img class="card-img-top" src="/et/tourUpload/<%=a.getChangeName() %>" alt="Card image cap">
				    <div class="card-body">
				      <h5 class="card-title"> [<%=t.getTctName() %>]<%= t.gettTitle() %> </h5>
				      <p class="card-text"> <%=t.gettPrice() %>원 </p>
				      <p class="card-text"><small class="text-muted"><%=t.gettConcept() %> </small></p>
				    </div>
				  </div>
				<%} %>
				  
				</div>
				</div>
                
            </div>
             <div class="ui mt-20"> 
                <div class="ui huge header">인기 Q&A </div>
                 <div class = "more-div" onclick = "location.href ='/et/views/normal/board/memberBoard.jsp'">
	                <i class="chevron circle right icon" id = "more-icon"></i>
	                <font id ="more-txt">더보기 </font>
                </div>
                
				<div class = "div-qna">
					<div class = "div-qna-inner">
					<%for(int i = 0; i < topBoard.size(); i++) {
					Board b = (Board)topBoard.get(i);
					%>
						<div id="img-qna-bar">
							<span class = "span-qna-q"> Q1. </span>
							<span>[<%= b.getBtitle() %>] <%=b.getbContent() %></span>
							<div id ="like-qna">
							<i class="heart icon" id ="like-qna"><%= b.getbLike() %></i>
							</div>
						</div>
						
					<%} %>
						<!-- <div id="img-qna-bar">
							<span class = "span-qna-q"> Q2. </span>
							<span>질문 예시 얍얍얍얍 </span>
							<div id ="like-qna">
							<i class="heart icon" id ="like-qna">23</i>
							</div>
						</div>
						<div id="img-qna-bar">
							<span class = "span-qna-q"> Q3. </span>
							<span>질문 예시 얍얍얍얍 </span>
							<div id ="like-qna">
							<i class="heart icon" id ="like-qna">23</i>
							</div>
						</div> -->
					</div>
				</div>
				<!-- <div class = "div-qna">
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
				</div> -->
            </div>
            </div>
        </div>
        <br><br><br><br><br><br><br><br><br>
        <div width = "100%" align = "center">
        <img src = "/et/image/common/logo_ev3.png" alt = "logo" ></div>
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
         
         function goPlan(){
      	  	 location.href = "/et/selectCityList.pl";
         }
         
         function goSeePlan(){
        		 location.href = "/et/views/normal/plan/Seeplan_main.jsp";
         }
         
         
		var map;
		var flightPlanCoordinatesArr = [];
		var flightPlanCoordinates = [];
		var path = {};
 	    
         $(function(){
 			<% 
 			if(msg != null){ %>
 			alert("<%=msg%>");
 			<%} %>
 			
		// 플랜 별 도시 위도 경도를 찍는다. 
		<%
		String[] planCityArr = null;
		System.out.println("잉" + planList.size());
		for (int i = 0; i < planList.size(); i++){
			planCityArr =  (planList.get(i).getpCites()).split(", "); // 이건 String
			for(String cityNo : planCityArr){
				%> path = {lat : <%=cityMap.get(cityNo).getCtLat()%>, lng : <%=cityMap.get(cityNo).getCtLng()%>};
				flightPlanCoordinates.push(path); 
			<% }%> 
			flightPlanCoordinatesArr.push(flightPlanCoordinates); 
			flightPlanCoordinates = [];
		<% } %>
		
		<%for(int i = 0; i < planList.size();  i++){ %>
    		// 해당하는 플랜의 도시 배열을 뽑아서 배열값을 나눈 다음에
    		// 여행하는 도시의 번호를 가져와서 도시리스트에서 위도, 경도를 구한다.
    		// 위도 경도 값을 해당하는 플랜의 도시 순서대로 PATH를 넣는다. 
		    var map<%=i%> = new google.maps.Map(document.getElementById('plan-map<%=i%>'), { 
		          zoom: 4.5,
		          center: new google.maps.LatLng(47.778744, 7.397438),
		          mapTypeId: google.maps.MapTypeId.ROADMAP,
		          disableDefaultUI: true,
		          styles: [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"administrative.country","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.country","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.province","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.province","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"administrative.locality","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"administrative.neighborhood","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"administrative.neighborhood","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"all","stylers":[{"hue":"#FFBB00"},{"saturation":43.400000000000006},{"lightness":37.599999999999994},{"gamma":1}]},{"featureType":"landscape","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.landcover","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.landcover","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.terrain","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural.terrain","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"poi","elementType":"all","stylers":[{"hue":"#00FF6A"},{"saturation":-1.0989010989011234},{"lightness":11.200000000000017},{"gamma":1}]},{"featureType":"poi.business","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"road","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"hue":"#FFC200"},{"saturation":-61.8},{"lightness":45.599999999999994},{"gamma":1}]},{"featureType":"road.highway.controlled_access","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"all","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":51.19999999999999},{"gamma":1}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"road.local","elementType":"all","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":52},{"gamma":1}]},{"featureType":"transit","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"transit","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"water","elementType":"all","stylers":[{"hue":"#0078FF"},{"saturation":-13.200000000000003},{"lightness":2.4000000000000057},{"gamma":1}]}]
		    });
		    
		    var lineSymbol = {
		            path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
		            scale: 4,
		            strokeColor: '#EDC53A'
	        };
		    
		   	poly<%=i%> = new google.maps.Polyline({
		    		path : flightPlanCoordinatesArr[<%=i%>],
		        strokeColor: '#2A5A85',
		        strokeOpacity: 1.0,
		        strokeWeight: 3
		    });
	        poly<%=i%>.setMap(map<%=i%>);
	        
	       
	        for (var j = 0; j < flightPlanCoordinatesArr[<%=i%>].length; j++) {
	        marker<%=i%> = new google.maps.Marker({
	            position: flightPlanCoordinatesArr[<%=i%>][j],
	            icon : lineSymbol,
	            map: map<%=i%>
	          });
	        console.log("marker"+j);
	        }
	    <%}%>
 		});
         
         
    </script>
    
	<script>
		$(document).ready(function(){
			console.log("얍");
			<% System.out.println("얍_index.jsp");%>
		});
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
	<%@ include file= "views/common/normal/footer.jsp" %>
	
</body>
</html>