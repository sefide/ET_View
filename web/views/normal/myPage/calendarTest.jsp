<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<link rel='stylesheet' type='text/css'
	href='http://www.blueb.co.kr/data/201010/IJ12872423858253/fullcalendar.css' />
<script type='text/javascript'
	src='http://www.blueb.co.kr/data/201010/IJ12872423858253/jquery.js'></script>
<script type='text/javascript'
	src='http://www.blueb.co.kr/data/201010/IJ12872423858253/jquery-ui-custom.js'></script>
<script type='text/javascript'
	src='http://www.blueb.co.kr/data/201010/IJ12872423858253/fullcalendar.min.js'></script>

<style type='text/css'>
/* body {
	margin-top: 40px;
	text-align: center;
	font-size: 14px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
} */

#calendar {
	margin-right: 80px;
	float: right;
	width: 400px;
}
</style>
</head>
<body>

	<script type='text/javascript'>
		var jb = jQuery.noConflict();

		jb(document).ready(
				function() {

					var date = new Date();
					var d = date.getDate();
					var m = date.getMonth();
					var y = date.getFullYear();

					var calendar = jb('#calendar').fullCalendar(
							{
								header : {
									/* left : 'title', */
									/* center : 'agendaDay,agendaWeek,month', */
									left : 'prev',
									center : 'title',
									right : 'next'
								},
								editable : false,
								firstDay : 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
								selectable : false,
								defaultView : 'month',

								axisFormat : 'h:mm',
								columnFormat : {
									month : 'ddd', // Mon
									week : 'ddd d', // Mon 7
									day : 'dddd M/d', // Monday 9/7
									agendaDay : 'dddd d'
								},
								titleFormat : {
									month : 'MMMM yyyy', // September 2009
									week : "MMMM yyyy", // September 2009
									day : 'MMMM yyyy' // Tuesday, Sep 8, 2009
								},
								allDaySlot : false,
								selectHelper : true,
								select : function(start, end, allDay) {
									var title = prompt('Event Title:');
									if (title) {
										calendar.fullCalendar('renderEvent', {
											title : title,
											start : start,
											end : end,
											allDay : allDay
										}, true // make the event "stick"
										);
									}
									calendar.fullCalendar('unselect');
								},
								droppable : true, // this allows things to be dropped onto the calendar !!!
								drop : function(date, allDay) { // this function is called when something is dropped

									// retrieve the dropped element's stored Event Object
									var originalEventObject = jb(this).data(
											'eventObject');

									// we need to copy it, so that multiple events don't have a reference to the same object
									var copiedEventObject = jb.extend({},
											originalEventObject);

									// assign it the date that was reported
									copiedEventObject.start = date;
									copiedEventObject.allDay = allDay;

									// render the event on the calendar
									// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
									jb('#calendar').fullCalendar('renderEvent',
											copiedEventObject, true);

									// is the "remove after drop" checkbox checked?
									if (jb('#drop-remove').is(':checked')) {
										// if so, remove the element from the "Draggable Events" list
										jb(this).remove();
									}

								},

							});

				});
	</script>
	<div id='calendar'></div>
	<div class="two wide column"></div>
</body>
</html>