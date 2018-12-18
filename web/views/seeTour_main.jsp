<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.column {
	height: 100%;
}
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">


			<select class="ui search selection dropdown" id="search-select">
				<option value="">나라선택</option>
				<option value="France">프랑스</option>
				<option value="Germany">독일</option>
				<option value="Uk">영국</option>
				<option value="Netherlands">네덜란드</option>
				<option value="Italy">이탈리아</option>
				<option value="Czech">체코</option>
				<option value="Greece">그리스</option>
				<option value="Hungary">헝가리</option>
				<option value="Austria">오스트리아</option>
				<option value="Croatia">크로아티아</option>
				<option value="Denmark">덴마크</option>
				<option value="Switzerland">스위스</option>
				<option value="Turkey">터키</option>
				<option value="Portugal">포르투갈</option>
				<option value="Spain">스페인</option>
			</select> <select class="ui search selection dropdown" id="search-select">
				<option value="">도시선택</option>
				<option value=""></option>
				<option value=""></option>
				<option value=""></option>
				<option value=""></option>
				<option value=""></option>
			</select>

			<center>

				<form name="select">
						<select class="ui search selection dropdown" id="search-select" onChange="redirect(this.options.selectedIndex)">
							<option value="France">프랑스</option>
							<option value="Germany">독일</option>
							<option value="Uk">영국</option>
							<option value="Netherlands">네덜란드</option>
							<option value="Italy">이탈리아</option>
							<option value="Czech">체코</option>
							<option value="Greece">그리스</option>
							<option value="Hungary">헝가리</option>
							<option value="Austria">오스트리아</option>
							<option value="Croatia">크로아티아</option>
							<option value="Denmark">덴마크</option>
							<option value="Switzerland">스위스</option>
							<option value="Turkey">터키</option>
							<option value="Portugal">포르투갈</option>
							<option value="Spain">스페인</option>
							</select> 
							<select class="ui search selection dropdown" id="search-select2">
							<option value="http://www.yahoo.co.kr">야후! 코리아</option>
							<option value="http://www.naver.com">한미르</option>
							<option value="http://www.lycos.co.kr">라이코스</option>
							</select> 
							<input type="button" name="test" value=" 가자 " onClick="go()">
							</form>
					<script>
					var groups=document.select.search-select.options.length
					var group=new Array(groups)
					for (i=0; i<groups; i++)
					group[i]=new Array()
					
					<!---------- 아래와 같은 방법으로 각 항목을 설정 합니다 ---------------->
					
					group[0][0]=new Option("파리") 
					group[0][1]=new Option("리옹")           
					group[0][2]=new Option("니스") 
					
					group[1][0]=new Option("엠뷔씨~") 
					group[1][1]=new Option("한거레신문") 
					
					group[2][0]=new Option("웹마스트") 
					group[2][2]=new Option("회원문의") 
					group[2][3]=new Option("마이따링") 
					
					var temp=document.select.search-select2
					
					function redirect(x){
					for (m=temp.options.length-1;m>0;m--)
					temp.options[m]=null
					for (i=0;i<group[x].length;i++){
					temp.options[i]=new Option(group[x][i].text,group[x][i].value)
					}
					temp.options[0].selected=true
					}
					
					/* function go(){
						location=temp.options[temp.selectedIndex].value
					} */
	</script>
				
		</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>