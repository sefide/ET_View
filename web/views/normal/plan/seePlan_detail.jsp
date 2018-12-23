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
/* .container{
	float: center;
} */
</style>

</head>
<body>
	<!-- navigation - header.jsp -->
	<%@ include file="/views/common/normal/header.jsp"%>
	<!-- 해당 페이지를 view_template파일과 다른 경로에 만들었다	면 include path를 수정해야합니 -->

	<div class="ui grid">
		<div class="two wide column"></div>
		<div class="twelve wide column" style="margin-top: 50px;">

			<br> <br>
			<div class="container">
				<!-- 내용시작 -->
				<div class="ui segment" style="border: none;">
					<div class="ui two column very relaxed grid" style="border: none;">
						<!-- 지도 -->
						<div class="column" style="border: none;">
							<h1 class="ui header">플랜제목 HOT</h1>
							<div class="div-best-plan-map">
								
							</div>
						</div>
						<!-- 달력 -->
						<div class="column">
							<h1 class="ui header">달력</h1>
							<div class="div-best-plan-map">
								<div class="outer">
									<select name="manage">
										<option>관리</option>
										<option>수정</option>
										<option>삭제</option>
									</select> <a target="_blank"
										href="https://calendar.google.com/event?action=TEMPLATE&amp;tmeid=NmdqaGI0Z3E0bzBzbzVudmUzZ2Rjc3F1NnYgd285OTA1MTBAbQ&amp;tmsrc=wo990510%40gmail.com"><img
										border="0"
										src="https://www.google.com/calendar/images/ext/gc_button1_ko.gif"></a>
									<script
										src=https://calendar.google.com/event?action=TEMPLATE&tmeid=NWtmZ2toNWpqdDE3ZG9yYm5yaTI2MGVtdWsgd285OTA1MTBAbQ&tmsrc=wo990510%40gmail.com></script>
									<script>
//Google api console clientID and apiKey 

var clientId = "";
var apiKey = "";

// enter the scope of current project (this API must be turned on in the Google console)
  var scopes = 'https://www.googleapis.com/auth/calendar';


//OAuth2 functions
    function handleClientLoad() {
          gapi.client.setApiKey(apiKey);
          window.setTimeout(checkAuth, 1);
       }

//To authenticate
 function checkAuth() {
   gapi.auth.authorize({ client_id: clientId, scope: scopes, immediate: true }, handleAuthResult);
       }

//This is the resource we will pass while calling api function
var resource = {
           "summary": "My Event",
           "start": {
               "dateTime": today
           },
           "end": {
               "dateTime": twoHoursLater
           },
           "description":"We are organizing events",
           "location":"US",
           "attendees":[
           {
                   "email":"attendee1@gmail.com",
                   "displayName":"Jhon",
                   "organizer":true,
                   "self":false,
                   "resource":false,
                   "optional":false,
                   "responseStatus":"needsAction",
                   "comment":"This is my demo event",
                   "additionalGuests":3
                   
           },
           {    
               "email":"attendee2@gmail.com",
                   "displayName":"Marry",
                   "organizer":true,
                   "self":false,
                   "resource":false,
                   "optional":false,
                   "responseStatus":"needsAction",
                   "comment":"This is an official event",
                   "additionalGuests":3
           }
           ],
       };

function makeApiCall(){
gapi.client.load('calendar', 'v3', function () { // load the calendar api (version 3)
               var request = gapi.client.calendar.events.insert
               ({
                   'calendarId': '24tn4fht2tr6m86efdiqqlsedk@group.calendar.google.com', 
                   
//calendar ID which id of Google Calendar where you are creating events. this can be copied from your Google Calendar user view.

                   "resource": resource 	// above resource will be passed here
                  
               });                
}


</script>
									<button id="btnCreateEvents" class="btn btn-primary"
										onclick="makeApiCall();">Create Events</button>

									<div id="divifm">
										<iframe id="ifmCalendar"
											src="https://www.google.com/calendar/embed?
                    height=550&amp;wkst=1&amp;bgcolor=%23FFFFFF&
                    amp;src=24tn4fht2sssdssfdiqqlsedk%40group.calendar.google.com&
                    amp;color=%238C500B&amp;ctz=Asia%2FCalcutta"
											style="border-width: 0" width="950" height="520"
											frameborder="0" scrolling="no"> </iframe>
									</div>

								</div>














							</div>
						</div>
					</div>
				</div>

			</div>



















		</div>
		<div class="two wide column"></div>
	</div>

	<!-- footer -->
	<%@ include file="/views/common/normal/footer.jsp"%>
</body>
</html>