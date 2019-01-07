<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");
	HashMap<String, Object> tb = (HashMap<String, Object>)list.get(0);
	
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
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<title>ET_Planner</title>
<link rel="icon" href="/views/image/common/logo.png">
<style>
body {
	width: 100%;
}

body>div {
	text-align: center;
	width: 90%;
	margin: 0 auto;
}

.div-img-profile {
	width: 240px;
	height: 240px;
	border: 1px solid gray;
	background: rgba(42, 90, 133, 0.5);;
	margin-left: 50px;
}


td {
	padding: 10px;
}

#txt {
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 800;
	font-size: 15px;
	text-align: left;
}
#detail-txt {
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 500;
	font-size: 15px;
	text-align: left;
}

#title {
	font-family: 'Ubuntu', sans-serif;
	margin: 0 0 5px 0;
}
img{
 	width: 500x;
	height: 250px;
	border: 1px solid gray;
	margin-top: 0px;
	margin-bottom: 0px;
}
.photo{
	width: 500x;
	height: 250px;
}
</style>

</head>
<body>
	<div>
		<br>
		<h1 id="title">투어 제목</h1>
		<form action="" method="post" encType="multipart/form-data">

			<div class="insertArea">
				<table align="center">
					<tr>
						<td id="txt"><label id="txt"> <%=tb.get("title") %></label></td>
					</tr>
					<tr>
						<td class="photo">
							<!-- 투어사진 -->
								<img src="/et/tourUpload/<%=tb.get("changeName")%>" class="img-profile"
									id="img-profile">
						</td>
					</tr>

					<tr>
						<td>
							<div class="ui form">
								<div class="field">
									<label id="txt"> 투어 설명 </label>
									<textarea name="profileTxt" rows="3" cols="50"
										style="resize: none" placeholder="투어에 대한 설명"><%= tb.get("info") %></textarea>
								</div>
							</div>

						</td>							
						
					</tr>
					<tr>
						<td align="left"><label id="txt"> 투어 기간  </label>&nbsp;&nbsp;&nbsp;
						 <span id="detail-txt"><%=tb.get("tdate") %> ~ <%=tb.get("tEndDate") %></span></td>				
					</tr>
					<tr>
						<td align="left"><label id="txt"> 투어 가격  </label>&nbsp;&nbsp;&nbsp;
						 <span id="detail-txt"><%= tb.get("price") %></span></td>				
					</tr>
					<tr>
						<td align="left"><label id="txt"> 투어 컨셉 </label>&nbsp;&nbsp;&nbsp;
						 <span id="detail-txt"> <%=tb.get("concept")%></span></td>				
					</tr>					<tr>
						<td align="left"><label id="txt"> 연결 링크 </label>&nbsp;&nbsp;&nbsp;
						 <span id="detail-txt"><a href="http://<%=tb.get("link") %>" ><%=tb.get("link") %></a></span></td>				
					</tr>

				</table>

			</div>
			<br>
			<div class="btnArea">
				
			</div>
			<script>
			
			</script>
		</form>
	</div>
</body>
</html>