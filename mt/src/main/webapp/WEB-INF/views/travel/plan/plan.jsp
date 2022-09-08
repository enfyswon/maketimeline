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
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- 
		<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5/locales-all.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5/main.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5/main.min.css">
 -->		
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="tour-box">
			</div>
			<div id='calendar'></div>
			<div id="button-box">
				<button id="timeline_btn">
					<img alt="timeline" src="${pageContext.request.contextPath}/resources/img/timeline.png">
				</button>
				<button id="plan_add_btn">
					<img alt="plan_plus" src="${pageContext.request.contextPath}/resources/img/travel_plus.png">
				</button>
				<button id="plan_money_btn">
					<img alt="plan_money" src="${pageContext.request.contextPath}/resources/img/moneybox.png">
				</button>
			</div>
		</main>
	</body>
	<script>
	document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');

		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    initialView: 'dayGridMonth',
		    headerToolbar: {
		      left: 'prev,next today',
		      center: 'title',
		      right: 'dayGridMonth,timeGridWeek,timeGridDay'
		    },
		    locale: 'ko',
		    selectable: true
		  });

		  calendar.render();
		});
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#plan_add_btn").click(function() {
			//location.href="${pageContext.request.contextPath}/plan/plan_add?cate_no=${category.cate_no}";
		});
	});
	$(document).ready(function() {
		$("#timeline_btn").click(function() {
			//location.href="${pageContext.request.contextPath}/plan/timeline?cate_no=${category.cate_no}";
		});
	});
	$(document).ready(function() {
		$("#plan_money_btn").click(function() {
			//location.href="${pageContext.request.contextPath}/plan/plan_money?cate_no=${category.cate_no}";
		});
	});
	</script>
</html>