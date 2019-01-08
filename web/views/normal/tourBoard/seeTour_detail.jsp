<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList, com.kh.et.common.NumberExec, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");
	HashMap<String, Object> tb = (HashMap<String, Object>)list.get(0);
	
	NumberExec Ne = new NumberExec(); 
	
    String endDayStr = (String.valueOf(tb.get("tEndDate"))).replace("-", "");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Semantic UI -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<title>ET_Planner</title>
<link rel="icon" href="/views/image/common/logo.png">
<style>

.contents {
	width: 80%;
	margin: 90px auto;
	border : 1px solid lightgray;
}
.contents-flex{
	width : 100%;
	display :flex;
	flex-wrap: wrap;
}
.tour-img{
	width : 42%;
}

.topArea{
	display : flex;
	flex-wrap : wrap;
	width : 56%;
	margin-bottom : 14px;
	padding-top : 1%;
}
.div-tour-city{
	font-family: 'Nanum Gothic', sans-serif;	
	font-size : 20px;
	width : 97%;
	margin-left : 1.4%;
}

.div-tour-title{
	width : 97%;
	margin : 1%;
}

#premium-label{
	position : absolute;
	margin-top : -530px;
	margin-left : 370px;
}

#title {
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 800;
	font-size : 30px;
	margin: 0px 0 5px 10px;
	height : 55px;
}

#company-name{
	color : white;
	background : rgb(20, 91, 137);
	height : 55px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 700;
	font-size : 23px;
	margin-left : 1%;
	padding: 1%;
	float : left;
}

.img-profile{
 	width: 100%;
 	height : 500px;
	margin-top: 0px;
	margin-bottom: 0px;
}

.tour-info{
	width : 98%;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 500;
	font-size : 18px;
	padding : 0 1%;
	color : #4F4F4F;
	margin-left : 1%;
}

.tour-content-two{
	width : 90%;
}
.div-tour-price{
	width : 100%;
	text-align : right;
	margin-top : 1%;
}
.tour-price {
	margin-left : 20%;
	color :  #ee685a;
	font-weight : 800;
	font-size: 30px;
}
#tour-price-txt{
	color : gray;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight : 500;
	font-size : 23px;
}

.tour-concept{
	display :block;
	border-radius : 5px;
	font-family: 'Nanum Gothic', sans-serif;
	background : lightgray;
	color : white;
	text-align : center;
	padding : 0.6% 1%;
	margin-left : 1.4%;
}

.btn-2,
.btn-2::after {
  -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
  -o-transition: all 0.3s;
    transition: all 0.3s;
}

.btn-2 {
  background: none;
  border: 3px solid rgb(237,197,58);
  border-radius: 5px;
  color: black;
  display: block;
  font-size: 1.2em;
  margin: 1em auto;
  padding: 0.17em 6em;
  position: relative;
  font-family: 'Nanum Gothic', sans-serif;
  text-transform: uppercase;
}

.btn-2::before,
.btn-2::after {
  background: rgb(237,197,58);
  content: '';
  position: absolute;
  z-index: -1;
}

.btn-2:hover {
  color: white;
}
.btn-2::after {
  height: 100%;
  left: 0;
  top: 0;
  width: 0;
}

.btn-2:hover:after {
  width: 100%;
  }
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file = "/views/common/normal/header.jsp" %>
	
	
	<div class = "contents">
		<div class = "contents-flex">
			<div class = "tour-img">
				<!-- 투어사진 -->
				<img src="/et/tourUpload/<%=tb.get("changeName")%>" class="img-profile" id="img-profile">
				<% if(tb.get("grade").equals("premium")) {%>
				<a class="ui yellow tag label" id = "premium-label">HOT</a>
				<%} %>
			</div>
			
			<div class= "topArea">
				<div class = "div-tour-city"> 
					<span>프랑스  </span> > <span> 파리 </span>
				</div>
				
				<div class = "div-tour-title"> 
					<div id = "company-name"><%=tb.get("tcname") %></div>
					<div id="title"><%=tb.get("title") %></div>
				</div>
				
				<div class = "div-tour-price">
					<span class="tour-price"><%=Ne.commaMoney((int)tb.get("price")) %>원 ~ <span id = "tour-price-txt">/ 1인 </span></span>
				</div>
				
				<div class ="tour-info">
					<div><%= tb.get("info") %></div>
				</div>
				
				<div class = "tour-concept">
					<span id="detail-txt"> <%=tb.get("concept")%></span>
				</div>
				<div>
					<span> 이 글이 내리기까지 <%=Ne.getDayDiff(endDayStr) %>일 남았어요 ! 얼른 서두르세요 !!! </span> <br>
					<label id="txt"> 투어글 만료기간 : </label>&nbsp;&nbsp;&nbsp;
					<span id="detail-txt"><%=tb.get("tdate") %> ~ <%=tb.get("tEndDate") %></span>
				</div>
				
				<div class ="tour-content-two">
					<div class = "tour-link">
						<button class="btn-2" id = "goLink"><i class="hand point right outline icon"></i>
						 투어 상세내용 보러가기</button>
						<%-- <span id="detail-txt"><a href="http://<%=tb.get("link") %>" ><%=tb.get("link") %></a></span> --%>
					</div>
				</div>
				
			</div>
			
		</div>
		
			
	</div>
	
	<script>
		$("#goLink").click(function(){
			var url = "http://<%=tb.get("link") %>";  
            window.open(url, "_blank");  
		});
	
	</script>
</body>
</html>