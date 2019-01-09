<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.kh.et.member.model.vo.*"%>
<%
	ArrayList<Member> BlackList = (ArrayList<Member>)request.getAttribute("BlackList");
	PageInfo pi=(PageInfo)request.getAttribute("pi");
	int listCount=pi.getListCount();
	int currentPage=pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	
<!-- 글꼴  -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Ubuntu" rel="stylesheet">



<style>
	.ul_01{
		list-style:none;     
		margin-top: 10px;
	  	margin-left: -30px;
	  	margin-right: 10px;
	}  
	.main_02{
	   	 margin:2%;
	   	 display:flex;
	}

	 #tb1{
	 	width:800px;
	 	text-align:center;
	 }
	/*  table,tr,td,th{
	 	border:1px solid black;
	 } */
	 td{
	 	width:50px;
	 }
	  th{
 		background-color:lightgray;
 	}
 	
	 .btn{
	 	margin-left:78%;
	 }
	 .notice{
	 	float:left;
	 	margin-left:2%;
	 }
	 .tb{
	 	width:900px;
	 }
	 .nav{
 		width:20%;
 	}
 	.sub{
 		width:75%;
 	}
 	.claim-popup{
	position : absolute ;
	width : 420px;
	background : rgba(255,255,255, 0.9);
	padding : 1%;
	border : 1px solid gray;
	text-align : center;
	top: 20%;
    left: 35%;
    	visibility : hidden;
}
.claim-popup-txt{
	font-size : 18px;
	font-weight : 700;
	margin-bottom : 10px;
}
.caution-txt{
	text-align : left;
	margin-top : 8px;
	font-size : 12px;
	color :gray;
}
.claim{
	background:lightgray;
}
</style>
</head>
<body>
<%@ include file = "/views/common/manager/header_manager.jsp" %>
   
    <div class="main_02">
    
    <div class="nav">
		<%@ include file = "/views/common/manager/manager_nav1.jsp" %>
    </div>
    
    <div class="sub">
    
	    	<div class="ui header title"><br>▶블랙리스트</div>
	    	- 블랙 회원 조회 및 회원 정지 <br><br>
	   
	    	<table id="tb1" class="table">
	    		<tr>
	    			<th>선택</th>
	    			<th>회원번호</th>
	    			<th>아이디</th>
	    			<th>이메일</th>
	    			<th>신고수</th>
	    		</tr>
	    		<% for(Member m : BlackList){ %>
	    		<tr height="27px">
	    			<td><input id = "check" type="radio" name="check" value=<%= m.getM_no() %>></td>
	    			<td><%= m.getM_no() %></td>
	    			<td><%= m.getM_id() %></td>
	    			<td><%= m.getM_email() %></td>
	    			<td><%= m.getM_point() %></td>
	    		</tr>
	    		<%} %>
	    	
	    	</table>
	    	<br>
	    <div class="pagingArea" align="center">
			<button  class="ui black basic button" onclick="location.href='<%=request.getContextPath() %>/select03.mng?currnetPage=1'"><<</button>
			<% if(currentPage <=1) {%>
			<button  class="ui black basic button" disabled><<<</button>
			<%}else{ %>
			<button  class="ui black basic button" onclick="location.href='<%=request.getContextPath()%>/select03.mng?currentPage=<%= currentPage -1%>'"><</button>		
			<%} %>
			
			<% for(int p=startPage; p<=endPage;p++){ 
				if(p==currentPage){
			%>		<button  class="ui black basic button" disabled><%= p %></button>
			<%	}else{ %>
					<button  class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select03.mng?currentPage=<%= p%>'"><%= p %></button>
			
			<% }%>
			
			<%} %>
			
			<% if(currentPage >= maxPage){ %>
			<button  class="ui black basic button" disabled>></button>
			<%}else{ %>
			<button  class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select03.mng?currentPage=<%= currentPage +1%>'">></button>
			<%} %>
			
			<button  class="ui black basic button" onclick="location.href='<%= request.getContextPath()%>/select03.mng?currentPage=<%=maxPage%>'">>></button>
		</div>
	    
	    
    	<div class = "div-claim">
			<a class = "claim"><i class="caret square right outline icon"></i> 정지시키기 </a>
		</div>
		<div class = "claim-popup">
			<i class = "close icon" onclick = "closePop1();"></i>
			<div align = "center" id = "resultClaim">
			<div class = "claim-popup-txt"> <i class="hourglass end icon"></i>정지기간을 선택해주세요</div>
			<input type ="radio" name = "reason" id = "reason1" value = "10"> <label for = "reason1"> 10일 </label> <br>
			<input type ="radio" name = "reason" id = "reason2" value = "21"> <label for = "reason2"> 3주 </label> <br>
			<button id = "stopBtn"> 정지 </button>
			<div class = "caution-txt">정지처리된 회원은 정지회원관리에서 취소시킬 수 있습니다.  </div>
			</div>
		</div>
    
     <div class="notice">
	    <br><br>
	    <b>-회원 정지 기준</b><br>
	    	<div>
	    		신고 5개 - 10일 정지 <br>
	    		신고 10개 - 3주(21일) 정지 <br>
	    		신고 20개 - 강제탈퇴 (>>회원 탈퇴시키기에서 가능)<br>
	    	</div>
	 </div>
	 
	 
     </div>
     </div>
     
     <script>

     		//팝업창닫기
			function closePop1() {
				$(".claim-popup").css("visibility" , "hidden");
			}
			
     		//정지하기 클릭시 팝업창 보임
			$(".claim").click(function(){
				$(".claim-popup").css("visibility" , "visible");
			});
			
			
			//회원정지
			$("#stopBtn").click(function(){
				var index = $("#check:checked").val();
				var day = $('input[name="reason"]:checked').val();
				console.log(index);
				console.log(day);
				
				if(index!=null){
				$.ajax({
					url:"stop.mng",
					type:"GET",
					data:{index:index, day:day},
					success:function(data){
						if(data=="성공"){
							alert("정지처리 성공!");
							window.location.reload();
						}
					},
					error:function(data){
						if(data=="실패"){
							alert("정지처리 실패ㅜㅠ");
						}
					}
				});
				}else{
					alert("정지시킬 회원을 선택해주세요!");
				}
			});
			
			<%-- $("#submitClaim").click(function(){
				<% if(loginUser != null){%>
				var radioVal = $('input[name="reason"]:checked').next().text();
				var userNo = <%= loginUser.getM_no()%>;
				var boardNo = <%= b.getbNo()%>;
				var boardwriter = '<%= b.getbWriter()%>';
				var loginUserId = "<%= loginUser.getM_id()%>";
				console.log(radioVal);
				if(radioVal != null){
					$.ajax({
						url : "claim.bo",
						data : {radioVal: radioVal, userNo : userNo, boardNo : boardNo, boardwriter : boardwriter, loginUserId : loginUserId},
						contentType : 'application/json; charset=UTF-8',
						type : "get",
						success : function(data){ 
							$("#resultClaim").html("");
							if(data.indexOf('FAIL_NORMAL')>-1){
								$("#resultClaim").append("<div class = 'claim-popup-txt'> 신고처리 중 오류가 발생했습니다. </div>");
							}
							else if(data.indexOf('FAIL_SAMEUSER')>-1) {
								$("#resultClaim").append("<div class = 'claim-popup-txt'> 본인글에 대한 신고처리는 불가능합니다.  </div>");
							}
							else if(data.indexOf('FAIL_EXIST')>-1){
								$("#resultClaim").append("<div class = 'claim-popup-txt'> 이전에 신고한 글입니다.  </div>");
							}
							else {
								$("#resultClaim").append("<div class = 'claim-popup-txt'> 신고처리가 정상적으로 완료되었습니다. </div>");
							}
							
						}, error : function(data){
							console.log("서버 전송 실패");	
						}
					});
				}else {
					alert("신고 사유를 작성해주세요 . ");
				}
				<%} else {%>
					alert("신고하려면 로그인이 필요합니다. ");
				<%}%>
			}); --%>
			
			
			
    	</script>
    
	<div class = "two wide column"></div>
	
	<%@ include file = "/views/common/company/footer_com.jsp" %>
</body>
</html>