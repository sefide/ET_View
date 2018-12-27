<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel='stylesheet' type='text/css'
	href='http://www.blueb.co.kr/data/201010/IJ12872423858253/fullcalendar.css' />
<script type='text/javascript'
	src='http://www.blueb.co.kr/data/201010/IJ12872423858253/jquery.js'></script>
<script type='text/javascript'
	src='http://www.blueb.co.kr/data/201010/IJ12872423858253/jquery-ui-custom.js'></script>
<script type='text/javascript'
	src='http://www.blueb.co.kr/data/201010/IJ12872423858253/fullcalendar.min.js'></script>

	<script>
	var jb = jQuery.noConflict();
	
	jb(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		jb('#calendar').fullCalendar({
			editable: true,
			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: 'Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				}
				
			]
		});
		
	});

</script>
<style>
	#calendar {
		
	}
</style>

</head>
<body>
  	<!-- 달력 -->
	
	<div id='calendar'></div>
</body>
</html>