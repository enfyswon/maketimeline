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
		<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	<style>
	  /* body 스타일 */  
	  body {    
		  	margin-top: 40px;    
		  	font-size: 14px;    
		  	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;  
	  	}  
	  /* 드래그 박스의 스타일 */  
	  #external-events {    
	  		position: fixed;    
	  		left: 20px;    
	  		top: 20px;    
	  		width: 100px;    
	  		padding: 0 10px;    
	  		border: 1px solid #ccc;    
	  		background: #eee;    
	  		text-align: left;  
	  }  
	  #external-events h4 {    
	  		font-size: 16px;    
	  		margin-top: 0;    
	  		padding-top: 1em;  
	  }  
	  #external-events .fc-event {   
	  	    margin: 3px 0;    
	  	    cursor: move;  
	  }   
	  #external-events p {    
	  		margin: 1.5em 0;    
	  		font-size: 11px;    
	  		color: #666;  
	  }   
	  #external-events p input {    
	  		margin: 0;    
	  		vertical-align: middle; 
	  }   
	  #calendar-wrap {    
	  		margin-left: 200px;  
	  }   
	  #calendar1 {    
	  max-width: 1100px;    
	  margin: 0 auto;  
	  }
	</style>
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
			<div id='wrap'>    
			<!-- 드래그 박스 -->    
			<div id='external-events'>      
				<h4>Draggable Events</h4>      
				<div id='external-events-list'></div>    
			</div>    
			<!-- calendar 태그 -->    
			<div id='calendar-wrap'>      
				<div id='calendar1'></div>    
			</div>  
			</div>
		</main>
	
		<script>
		document.addEventListener('DOMContentLoaded', function() {
			var containerEl = $('#external-events-list')[0];           
			   new FullCalendar.Draggable(containerEl, {        
				   itemSelector: '.fc-event',        
				   eventData: function(eventEl) {          
					   return {            
						   title: eventEl.innerText.trim()          
						   }       
					   }      
			   });         
			   for(var i=1; i<=5;i++) {        
				   var $div = $("<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'></div>");        
				   $event = $("<div class='fc-event-main'></div>").text("Event "+i);        
				   $('#external-events-list').append($div.append($event));      
				}          
			  var calendarEl = document.getElementById('calendar');
			  var calendar = new FullCalendar.Calendar(calendarEl, {
			    initialView: 'dayGridMonth',
			    headerToolbar: {
			      left: 'prev,next today',
			      center: 'title',
			      right: 'dayGridMonth,timeGridWeek,timeGridDay'
			    },
			    locale: 'ko',
			    selectable: true,
			    editable: true,        
				droppable: true,         
				drop: function(arg) {                  
					arg.draggedEl.parentNode.removeChild(arg.draggedEl);        
				}    
			  });
	
			  calendar.render();
			});
		</script>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#plan_add_btn").click(function() {
				location.href="${pageContext.request.contextPath}/plan/add?cate_no=${category.cate_no}";
			});
		});
		$(document).ready(function() {
			$("#timeline_btn").click(function() {
				location.href="${pageContext.request.contextPath}/timeline?cate_no=${category.cate_no}";
			});
		});
		$(document).ready(function() {
			$("#plan_money_btn").click(function() {
				location.href="${pageContext.request.contextPath}/plan/money?cate_no=${category.cate_no}";
			});
		});
		</script>
	</body>
</html>