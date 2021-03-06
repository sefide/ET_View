<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.et.member.model.vo.Member" %>
 <%
	Member loginUser = (Member)session.getAttribute("loginUser");
%> 
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
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<!-- 글꼴  -->
	<link href="https://fonts.googleapis.com/css?family=Ubuntu:700&amp;subset=latin-ext" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR" rel="stylesheet">
	
	<!-- 카카오톡 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

	
	<title>ET_Planner</title>
	<link rel="icon" href="/et/image/common/logo.png">
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
		
		.nav-link:hover{
			cursor : pointer;
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
            font-family: 'Nanum Gothic', sans-serif;
        }
        
        .nav-item-first{
        		margin-left:24%;
        }
       

        .mt-2{
            margin-top: 5%;
            width : 100%;
        }

		.header-top{
			display : flex;
			width: 98%;
			height : 70px;
		    margin: 1% 1% 0 1%;
		    /* text-align : center; */
		}
		
		.header-top-inner{
			/* margin-left : 40%; */
			width: 55%;
			text-align : right;
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
		
		/* .img_login_btn{
			position: absolute;
        		width : 190px;
        		height : 40px;
        		top: 2.5%;
    			right: 5%;
        } */
        .header-btn{
        		width : 45%;
 			text-align : right;
        }
        
        
        #a_login{
        		border : none;
            width : 90px;
            height : 35px;
            background-color : rgb(150,208,248);
            color : white;
            cursor : pointer;
            box-shadow : 3px 3px 1px 0 rgb(70,155,214);
            position:relative;
            right : 6%;
        }
        #a_login::before{
            content:"";
            position:absolute;
            left:0;
            top:0;
            width:100%;
            height:100%;
            transition:0.7s;
            background-attachment: transparent;
        }
        #a_login:hover::before{
            background-color : white;
            opacity:0.4;
        }
        
        
        #a_join{
        		border : none;
             width : 90px;
            height : 35px;
            background-color :rgb(150,208,248);
            color : white;
            cursor : pointer;
            box-shadow : 3px 3px 1px 0 rgb(70,155,214);
            position:relative;
            right : 3%;
        }
        #a_join::before{
            content:"";
            position:absolute;
            left:0;
            top:0;
            width:100%;
            height:100%;
            transition:0.7s;
            background-attachment: transparent;
        }
        #a_join:hover::before{
            background-color : white;
            opacity:0.4;
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
         	<img src="/et/image/common/logo.png" class = "header-top-img" onclick = "goHome();">
         	<a class="header-top-brand" id ="txt_brand" onclick = "goHome();">ET Planner</a>    
     	</div>
	    <div class = "header-btn">

    	 <% if(loginUser != null) {%>
	    <button id="a_login" onclick = "goMyPage();"><span>마이페이지</span></button>
	    <button id="a_join" onclick = "goLogout();"><span>로그아웃</span></button>
    <% } else { %>
	    <button id="a_login" onclick = "goLogin();"><span>로그인</span></button>
	      <button id="a_join" onclick = "goJoin();"><span>회원가입</span></button>
	     <% } %> 


	      
	  	
	  	</div>
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
                   		 	<a class="nav-link" onclick = "goPlan();">플랜짜기</a> 
                   		 	<!-- "href="/et/views/normal/plan/create_plan.jsp" -->
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link" onclick="seePlan();">플랫엿보기</a>
                    		<!-- /selectallPlan.pl 서블릿을 호출해야해 완성하면! by 아진-->
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link" href="<%=request.getContextPath()%>/memberSeeTour.tbo">투어엿보기</a>
               		 </li>
                		<li class="nav-item">
                        	<a class="nav-link" href="<%=request.getContextPath() %>/selectList.bo">Q&A</a>
                		</li>
            		</ul>
	        </div>
		</nav>
    </div>
    
    <script>
    		function goHome() {
    			location.href = "/et/first.jsp";
    		}
    		
    		function goLogin(){
    			location.href = "/et/views/normal/member/user_login.jsp";
    		}
    		
    		function goJoin(){
    			location.href = "/et/views/normal/member/user_join.jsp";
    		}
    		
    		function goMyPage() {
    			<% if(loginUser != null) { %>
    			var mno = <%=loginUser.getM_no()%>;
    			location.href = "<%=request.getContextPath()%>/selectPlanList.pl?mno="+mno;
    			<% } %>
    		}
    		
    		Kakao.init('key-value');
    		function goLogout(){
    			// 로그아웃 함수내에서 submit 함수 호출
        		//getKakaotalkUserProfile();
    			location.href = "/et/logout.me";
    		}
    		
    		function getKakaotalkUserProfile(){
		        Kakao.API.request({
				url: '/v1/user/me',
				success: function(res) {
			        //alert(Kakao.Auth.getAccessToken());
                    Kakao.Auth.logout(function () {
                    		location.href = "/et/logout.me";
                    	});
		        },fail: function(error) {
				}
			});
		}
    		function applicationApply() {
    			// submit 실행
		}
    		function goPlan(){
    			<%
        	 	if(loginUser != null){
        	 		if(loginUser.getM_plan_num() == -1){%>
        	 			alert("에러발생, 다시 로그인해주세요.");
        	 		<%} else if((loginUser.getM_storage()-loginUser.getM_plan_num()) <= 0){%>
        	 			alert("저장가능한 플랜공간이 가득찼습니다. 플랜공간부터 늘려주세요 ㅎ")	
        	 		<%} else { %>
             	  	 location.href = "/et/selectCityList.pl";
        	 		<% }
        	 	} else {%>
        	 	 alert("비회원일 경우 플랜저장이 되지 않는다는 점 유의하세요 ! ");
      	  	 location.href = "/et/selectCityList.pl";
      	  	 <%}%>
    		}
    		
    		//플랜 엿보기 메인 페이지 클릭시 이동하는 서블릿
    		function seePlan() {
    			location.href = "<%=request.getContextPath()%>/selectallPlan.pl";  			
		}
    		
    </script>
</body>
</html>
