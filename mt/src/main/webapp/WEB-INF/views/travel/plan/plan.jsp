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
		<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="tour-box">
			</div>
			<div id="calender-box">
				<div id='calendar'></div>
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
			<div id="modal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title"> title </h5>
							<button type="button" id="close_btn" data-bs-dismiss="modal" aria-label="Close">X</button>
						</div>
						<h4>모달</h4>
						<div class="modal-body">
							<div id="plan-input">
								<form id="plan_form">
									<input type="hidden" id="cate_no" name="cate_no" value="${cate_no}">
									<div class="plan-detail">
										<p>
											<label for="plan_name">여행 장소</label>
											<label for="plan_name" id="plan_name_label" class="write_label" ></label>
										</p>
										<input type="text" id="plan_name" name="plan_name" placeholder="여행 장소">
									</div>
									<div class="plan-detail">
										<p>
											<label for="plan_name">세부 설명</label>
											<label for="plan_desc" id="plan_desc_label" class="write_label" ></label>
										</p>
										<input type="text" id="plan_desc" name="plan_desc" placeholder="세부 설명">
									</div>
									<div class="plan-detail">
										<p>
											<label for="plan_name">예상 지출 금액</label>
											<label id="plan_amount_label" class="write_label"></label>
										</p>
										<select id="money_no" name="money_no">
											<option value="0">---종류 선택---</option>
										</select>
										<input type="text" id="plan_amount" name="plan_amount" placeholder="예상 지출 금액">	
									</div>
								</form>
								<button type="button" id="add_btn" name="add_btn">등록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	
		<script>
		var modal = document.getElementById("modal");
		$(document).ready(function() {
			/* $.get(
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
			); */
		});
		
		document.addEventListener('DOMContentLoaded', function() {
			/* var containerEl = $('#external-events-list')[0];           
			   new FullCalendar.Draggable(containerEl, {        
				   itemSelector: '.fc-event',        
				   eventData: function(eventEl) {          
					   return {            
						   title: eventEl.innerText.trim()          
						   }       
					   }      
			   });          */
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
			    timeZone: 'local',
			    allDaySlot: true,
			    displayEventTime: true,
			    displayEventEnd: true,
			    views: {
			    	month: {
			    		eventLimit : 3, 
			    		columnFormat: 'dddd'
			    	}, 
			    	agendaWeek: {
			    		columnFormat: 'M/D ddd', 
			    		titleFormat: "YYYY년 M월 D일", 
			    		eventLimit: false
			    	}, 
			    	agendaDay: {
			    		columnFormat: 'dddd', 
			    		eventLimit: false
			    	}, 
			    	listWeek: {
			    		columnFormat: ''
			    	}
			    },
			    timeFormat: 'HH:mm',
			    defaultTimedEventDuration: '01:00:00',
			    editable: true,
			    minTime: '00:00:00',
			    maxTime: '24:00:00',
			    slotLabelFormat: 'HH:mm',
			    LongPressDeley: 0,
			    eventLongPressDelay: 0,
			    selectLongPressDelay: 0,
			    selectable: true,
				eventRender: function(event, element, view) {
					element.popover({
						
					});
					return filtering(event);
				},
				select: function(startDate, endDate, jsEvent, view) {
					$(".fc-body").unbind('click');
					var today = moment();
					
						startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
						endDate = moment(endDate).subtract(1, 'days');
						
						endDate = moment(endDate).format("YYYY-MM-DD HH:mm");
					newEvent(startDate, endDate);
				}
			  });
	
			  calendar.render();
			});
		
			var newEvent = function(start, end) {
				modal.style.display = "flex";
				
			}
		</script>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#close_btn").click(function() {
				modal.style.display = "none";
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