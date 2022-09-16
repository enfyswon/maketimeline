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
	  #wrap {
	  	width: 20%;
	  }
	  /* 드래그 박스의 스타일 */  
	  #external-events {    
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
	</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="tour-box">
			</div>
			<div id="calender-box">
				<div id="dialog" title="일정" style="display:none;">
					<p class="plan-detail">장소</p>
					<p class="plan-detail">위치</p>
					<p class="plan-detail">날짜</p>
					<p class="plan-detail">세부 설명</p>
					<p class="plan-detail">예상 지출 금액</p>
				</div>
				<div id='calendar'></div>
				<div id='wrap'>    
				<!-- 드래그 박스 -->    
					<div id='external-events'>      
						<h4>일정 목록</h4>      
						<div id='external-events-list'></div>    
					</div>  
					<div id="plan-button-box">
						<button type="button" id="save_btn">저장</button>
					</div>  
				</div>
			</div>
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
	
		<script>
		var diaLogOpt = {
				modal: true, 
				resizable: false, 
				width: "570",
				height: "470"
		};
		
		var calFunc = {
				calcDate: function(arg, calendar) {
					var rObj = new Object();
					var start = null;
					var end = null;
					var allDay = arg.allDay;
					var startDisp = null;
					var endDisp = null;
					var plan_name = arg.plan_name;
					var plan_desc = arg.plan_desc;
					var plan_loc = arg.plan_loc;
					var plan_startdate = null;
					var plan_enddate = null;
					var plan_amount = arg.plan_amount;
					var value_name = arg.value_name;
					
					if (allDay) {
						var start = arg.start.toISOString().slice(0, 10);
						var end = null;
						if(arg.end != "" && arg.end != null) {
							end = arg.end.toISOString().slice(0, 10);
						}
						if (start == end) {
							end = null;
						}
						
						startDisp = start;
						if (end != null) {
							endDisp = dateRel(arg.end.toISOString().slice(0, 10));
						}
					}
					rObj.start = start;
					rObj.end = end;
					rObj.startDisp = startDisp;
					rObj.endDisp = endDisp;
					rObj.plan_name = plan_name;
					rObj.plan_desc = plan_desc;
					rObj.plan_amount = plan_amount;
					rObj.plan_loc = plan_loc;
					rObj.value_name = value_name;
					
					return rObj;
				}, 
				setDataForm: function(xobj) {
					var dispStr = xobj.startDisp;
					if (xobj.endDisp != null) {
						dispStr += " ~ " + xobj.endDisp;
					}
					
				}
		}
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/plan/list?cate_no=${category.cate_no}",
					function(data, status) {
						$.each(JSON.parse(data), function(idx, dto) {
							$("#external-events-list").append(
									"<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>" + 
									"<div class='fc-event-main event'>" + 
									dto.plan_name + 
									"</div>" + 
									"</div>"
							);
						})
					}
			);
		});
		
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
			   /* for(var i=1; i<=5;i++) {        
				   var $div = $("<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'></div>");        
				   $event = $("<div class='fc-event-main'></div>").text("event " + i);        
				   $('#external-events-list').append($div.append($event));      
				}     */      
			  var calendarEl = document.getElementById('calendar');
			  var calendar = new FullCalendar.Calendar(calendarEl, {
			    initialView: 'dayGridMonth',
			    initialDate: '${category.cate_startdate}',
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
				},
				eventDrop: function(info) {               
			           alert(info.event.title + info.event.start.toISOString());
			    },
			    eventClick: function(calEvent, jsEvent) {
			    }
			  });
	
			  calendar.render();
			});
		</script>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#save_btn").click(function() {
				alert();
			});
		});
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
				location.href="${pageContext.request.contextPath}/money/add?plan_no=${plan.money_no}";
			});
		});
		</script>
	</body>
</html>