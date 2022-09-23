<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/travel_style.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="calender-box">
				<div id='calendar'></div>
			</div>
			<div id="money-box">
				<div class="money-title">
					<h1><span id="date"></span> 지출 사항</h1>
				</div>
				<div class="money-detail">
					<h3>숙박비</h3>
					<p><span id="bedamount">0</span> 원</p>
				</div>
				<div class="money-detail">
					<h3>식비</h3>
					<p><span id="foodamount">0</span> 원</p>
				</div>
				<div class="money-detail">
					<h3>교통비</h3>
					<p><span id="trafficamount">0</span> 원</p>
				</div>
				<div class="money-detail">
					<h3>입장료</h3>
					<p><span id="enteramount">0</span> 원</p>
				</div>
				<div class="money-detail">
					<h3>기타</h3>
					<p><span id="etcamount">0</span> 원</p>
				</div>
				<hr>
				<div class="money-detail">
					<h3>총액</h3>
					<p><span id="amount">0</span> 원</p>
				</div>
			</div>
			<div id="button-box">
				<button id="timeline_btn">
					<img alt="plan" src="${pageContext.request.contextPath}/resources/img/timeline.png">
				</button>
			</div>
		</main>
		<script>
		var event = [];
		var timeline_event;
		console.log(event);
		document.addEventListener('DOMContentLoaded', function() {
			  var calendarEl = document.getElementById('calendar');
			  var calendar = new FullCalendar.Calendar(calendarEl, {
			    initialView: 'dayGridMonth',
			    initialDate: '${category.cate_startdate}',
			    headerToolbar: {
			      left: 'prev,next today',
			      center: 'title',
			      right: 'dayGridMonth,timeGridWeek,timeGridDay'
			    },
			    navLink: true,
			    locale: 'ko',
			    timeZone: 'local',
			    allDaySlot: true,
			    displayEventTime: false,
			    displayEventEnd: false,
			    defaultTimedEventDuration: '01:00:00',
			    editable: true,
			    slotLabelFormat: 'HH:mm',
			    dayMaxEvents: true,
			    eventLongPressDelay: 0,
			    selectLongPressDelay: 0,
			    selectable: true,
				events : function(info, successCallback) {
					$.ajax({
							type: 'get',
							url: "${pageContext.request.contextPath}/timeline/list",
							dataType: "json",
							data: {
								cate_no : "${category.cate_no}"
							},
							success: function(data) {
								if (event.length == 0) {
									$.each(data, function(idx, dto) {
										timeline_event = {
												id: dto.timeline_no,
												title: dto.timeline_name,
												start: dto.timeline_startdate,
												end: dto.timeline_enddate,
												money: dto.money_no,
												amount: dto.timeline_amount,
												desc: dto.timeline_desc,
												loc: dto.timeline_loc,
												allDay: JSON.parse(dto.timeline_allDay)
										};
										event.push(timeline_event);
									});
									successCallback(event);
								}
							}
					});
				},
				dateClick: function(info) {
					var eventCnt = 0;
					var date = moment(info.date).format("YYYY-MM-DD");
					var amount = 0;
					var bedamount = 0;
					var foodamount = 0;
					var trafficamount = 0;
					var enteramount = 0;
					var etcamount = 0;
					
					for (let i = 0; i < event.length; i++) {
						var start = moment(event[i].start).format("YYYY-MM-DD");
						var end = moment(event[i].end).format("YYYY-MM-DD");
						//alert(date + " : " + start + " : " + end);
						if (date == start) {
							eventCnt++;
							amount += Number(event[i].amount);
							switch (Number(event[i].money)) {
								case 1:
									bedamount += Number(event[i].amount);
									break;
								case 2:
									foodamount += Number(event[i].amount);
									break;
								case 3:
									trafficamount += Number(event[i].amount);
									break;
								case 4:
									enteramount += Number(event[i].amount);
									break;
								case 5:
									etcamount += Number(event[i].amount);
									break;
							}
						} else if (date > start && date <= end) {
							eventCnt++;
							amount += Number(event[i].amount);
							
							switch (Number(event[i].money)) {
								case 1:
									bedamount += Number(event[i].amount);
									break;
								case 2:
									foodamount += Number(event[i].amount);
									break;
								case 3:
									trafficamount += Number(event[i].amount);
									break;
								case 4:
									enteramount += Number(event[i].amount);
									break;
								case 5:
									etcamount += Number(event[i].amount);
									break;
							}
							if (date == end) {
								eventCnt--;
								amount -= Number(event[i].amount);
								
								switch (Number(event[i].money)) {
									case 1:
										bedamount -= Number(event[i].amount);
										break;
									case 2:
										foodamount -= Number(event[i].amount);
										break;
									case 3:
										trafficamount -= Number(event[i].amount);
										break;
									case 4:
										enteramount -= Number(event[i].amount);
										break;
									case 5:
										etcamount -= Number(event[i].amount);
										break;
								}
							}
						}
					}
		            $("#date").html(moment(date).format("YYYY년 MM월 DD일"));
		            $("#bedamount").text(bedamount);
		            $("#foodamount").text(foodamount);
		            $("#trafficamount").text(trafficamount);
		            $("#enteramount").text(enteramount);
		            $("#etcamount").text(etcamount);
		            $("#amount").text(amount);
		            //alert(bedamount + " : " + foodamount + " : " + trafficamount + " : " + enteramount + " : " + etcamount + " : " + amount);
				}
			  });
	
			  calendar.render();
			});
		
		</script>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#timeline_btn").click(function() {
				location.href="${pageContext.request.contextPath}/timeline?cate_no=${category.cate_no}";
			});
		});
		</script>
	</body>
</html>