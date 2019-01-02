<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.et.board.model.vo.*, com.kh.et.plan.model.vo.*, com.kh.et.tourBoard.model.vo.*"%>

<%
	String msg = (String) request.getAttribute("msg");

	HashMap<String, Object> bestplanMap = (HashMap<String, Object>) request.getAttribute("bestplanMap");
	
	HashMap<String, City> cityMap = null;
	
	ArrayList<Plan> planList = null;
	
	if (bestplanMap != null) {
		cityMap = (HashMap<String, City>) bestplanMap.get("cityMap");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Semantic UI -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<!-- 버튼 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<!-- 구글 맵 -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDoMpIr7wrKdZrGsBCW1zoNesmP8fhCdH0"
	type="text/javascript"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>ET_Planner</title>
<link rel="icon" href="/views/image/common/logo.png">

<style>
/* 인기플랜  */
.div-plan-list {
	margin-left: 15px;
}

.div-plan-map {
	width: 340px;
	height: 380px;
	display: inline-block;
	margin: 5px 12px 30px 10px;
	/* background-color: yellow; */
}

.plan-map {
	width: 340px;
	height: 340px;
}

.div-plan-title {
	font-size: 25px;
	font-weight: 500;
	font-family: 'Ubuntu', sans-serif;
	display: inline-block;
}

.div-plan-like {
	width: 80px;
	height: 30px;
	color: red;
	font-size: 18px;
	font-family: 'Ubuntu', sans-serif;
	border-radius: 5px;
	text-align: center;
	float: right;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/views/common/normal/header.jsp"%>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">

			<!-- 내용 넣기 -->


			<!-- 인기플랜이 보여지는 div -->
			<div>
				<div class="ui mt-20">
					<div class="ui huge header">BEST Plan TOP 3</div>
					<div>
						<div class="div-plan-list" ">
							<% if(bestplanMap!= null){
								System.out.println("jsp에서의 bestplanMap:"+bestplanMap);
        					planList = (ArrayList<Plan>)bestplanMap.get("planList");
        					for(int i = 0; i < planList.size(); i++){
        					System.out.println("i : " + i);
        					Plan p = planList.get(i);%>
							<div class ="div-plan-map"> 
        					    <div id ="plan-map<%=i%>" class ="plan-map"></div>
        						<div class = "div-plan-title"><%=p.getpTitle() %></div>
        						<div class = "div-plan-like"> 
        							<i class = "icon heart"><%=p.getpLike() %></i>
        						</div>
        					</div>
        					<%}
        				}%>
        				 
							
						</div>
					</div>
				</div>
			</div>
			
			
			
			<br><br>
			

			<br>
			<!-- 플랜 검색 div -->
			<!-- <div>
				<div class="row">
					<div class="col-md-6">
						<!-- <h2>Custom search field</h2> 
						<div id="custom-search-input">
							<div class="input-group col-md-12" id="div-search-plan">
								<input type="text" class="form-control input-lg"
									placeholder="여행플랜검색" /> <span class="input-group-btn">
									<button class="btn btn-info btn-lg" type="button">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>  -->



			<!-- 모든 플랜 보기 -->
			<div></div>















			<!-- --------------->
		</div>
		<div class="two wide column"></div>
	</div>

	<!-- Semantic UI -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>



	<%@ include file="/views/common/normal/footer.jsp"%>



	</script>
</body>
</html>