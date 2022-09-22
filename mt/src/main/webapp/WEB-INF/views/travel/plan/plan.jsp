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
		<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5018921c91408548d9d5f456c15b27b&libraries=services"></script>
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
							<h3 class="modal-title"></h3>
							<button type="button" id="close_btn" data-bs-dismiss="modal" aria-label="Close">X</button>
						</div>
						<div class="modal-body">
							<div id="plan-input">
								<form id="plan_form">
									<input type="hidden" id="cate_no" name="cate_no" value="${category.cate_no}">
									<input type="hidden" id="plan_no" name="plan_no">
									<div class="plan-detail">
										<p>
											<label for="plan_name">여행 장소</label>
											<label for="plan_name" id="plan_name_label" class="write_label" ></label>
										</p>
										<input type="text" id="plan_name" name="plan_name" placeholder="여행 장소">
									</div>
									<div class="plan-detail">
										<p>
											<label for="plan_startdate">여행 날짜</label>
											<label for="plan_startdate" id="plan_startdate_label" class="write_label"></label>
											<input type="checkbox" id="plan_allDay" checked="checked">
											<label for="plan_allDay">하루 종일</label>
										</p>
										<input type="datetime-local" id="plan_startdate" name="plan_startdate" class="plan-date"> ~ 
										<input type="datetime-local" id="plan_enddate" name="plan_enddate" class="plan-date">
									</div>
									<div class="plan-detail">
										<p>
											<label for="plan_desc">세부 설명</label>
											<label for="plan_desc" id="plan_desc_label" class="write_label" ></label>
										</p>
										<input type="text" id="plan_desc" name="plan_desc" placeholder="세부 설명">
									</div>
									<div class="plan-detail">
										<p>
											<label for="plan_amount">예상 지출 금액</label>
											<label for="plan_amount" id="plan_amount_label" class="write_label"></label>
										</p>
										<select id="money_no" name="money_no">
											<option value="0">---종류 선택---</option>
										</select>
										<input type="text" id="plan_amount" name="plan_amount" placeholder="예상 지출 금액">	
									</div>
									<div class="plan-detail">
										<p>
											위치
											<label id="plan_loc_label" class="write_label"></label>
										</p>
										<div id="input-map-box">
											<div id="input-map">
											</div>
											<div id="menu_wrap" class="bg_white">
										        <div class="option">
										            <div>
										                <input type="text" id="keyword" size="20" placeholder="검색 키워드"> 
										            	<button type="button" onclick="searchPlaces(); return false;">검색</button> 
										            </div>
										        </div>
										        <hr>
										        <ul id="placesList"></ul>
											        <div id="pagination"></div>
										    </div>
										</div>
									</div>
								</form>
								<div id="plan-add-box">
									<button type="button" id="add_btn" name="add_btn">등록</button>
								</div>
								<div id="plan-modify-box">
									<button type="button" id="update_btn" name="update_btn">수정</button>
									<button type="button" id="delete_btn" name="delete_btn">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<script type="text/javascript">
		var markers = [];
		var plan_loc = "";
		var liClass = "";
		var mapContainer = document.getElementById('input-map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

		    var keyword = document.getElementById('keyword').value;

		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        //alert('키워드를 입력해주세요!');
		        return false;
		    }

		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);

		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);

		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === kakao.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {
				var num = i;
		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title, loc) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });

		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
		            
		            kakao.maps.event.addListener(marker, 'click', function() {
		            	chooseLoc(marker, title, loc);
		            });

		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		            
		            itemEl.onclick =  function () {
		            	liClass = $(this).attr('class');
		            	chooseLoc(marker, title, loc);
		            };
		        })(marker, places[i].place_name, places[i]);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr =   '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h3>' + places.place_name + '</h3>';

		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                 '</div>';           

		    el.innerHTML = itemStr;
		    el.className = 'item item' + (index + 1);
			
		    return el;
		}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                    window.scrollTo(0, 600);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;font-size:small;">' + title + '</div>';

		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		 
		function chooseLoc(marker, title, loc) {
			var num = liClass.substr(liClass.length-1, 1);
			//alert(num);
			$(".item").not(".item.item" + num).removeClass("active-item");
			$(".item" + num).addClass("active-item");
			if (loc.road_address_name != "") {
				plan_loc = loc.road_address_name;
			} else {
				plan_loc = loc.address_name;
			}
		}
		
		function searchLoc(loc, name) {
			geocoder.addressSearch(loc, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					var mark = new kakao.maps.Marker({
						map: map,
						position: coords
					});
					
					var window = new kakao.maps.InfoWindow({
						content: '<div style="width:150px;text-align:center;padding:6px 0;">' + name + '</div>'
					});
					window.open(map, mark);
					
					map.setCenter(coords);
				}
			});
		}
		</script>
		<script type="text/javascript">
		let onlyNum = /^[0-9]+$/;
		let allDay = 'false';
		$(document).ready(function() {
			$("#add_btn").click(function() {
				if ($.trim($("#plan_name").val()) == "") {
					$("#plan_name_label").text("여행 장소를 입력하세요.");
					return;
				} else {
					$("#plan_name_label").text("");
				}
				
				if ($("#plan_desc").val() == "") {
					$("#plan_desc_label").text("세부 설명을 입력하세요.");
					return;
				} else {
					$("#plan_desc_label").text("");
				}
				
				if ($("#money_no").val() == 0) {
					$("#plan_amount_label").text("지출 종류를 선택하세요.");
					return;
				} else {
					$("#plan_amount_label").text("");
				}
				
				let amount = $.trim($("#plan_amount").val());
				
				if (amount == "") {
					$("#plan_amount_label").text("예상 지출 금액을 입력하세요.");
					return;
				} else {
					$("#plan_amount_label").text("");
				}
				
				if ((amount != "") && (amount.match(onlyNum) == null)) {
					$("#plan_amount_label").text("숫자만 허용됩니다.");
					return;
				} else {
					$("#plan_amount_label").text("");
				}

				if ($("#plan_allDay").is(":checked")) {
					allDay = 'true';
				}
				let form = new FormData( document.getElementById("plan_form"));
				
				form.append('plan_loc', plan_loc);
				form.append('plan_allDay', allDay);
				
				let keys = form.keys();
				for(key of keys) console.log(key);
				
				let values = form.values();
				for(value of values) console.log(value);

				$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/plan/insert"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("여행 계획 일정이 등록 되었습니다.");
						location.href="${pageContext.request.contextPath}/plan?cate_no=${category.cate_no}";
					}//call back function
					, error : function(xhr) {
						alert("잠시 후 다시 시도해 주세요.");
					}//call back function//xhr : xml http request/response
				});//ajax
			});
		});
		$(document).ready(function() {
			$("#update_btn").click(function() {
				if ($.trim($("#plan_name").val()) == "") {
					$("#plan_name_label").text("여행 장소를 입력하세요.");
					return;
				} else {
					$("#plan_name_label").text("");
				}
				
				if ($("#plan_desc").val() == "") {
					$("#plan_desc_label").text("세부 설명을 입력하세요.");
					return;
				} else {
					$("#plan_desc_label").text("");
				}
				
				if ($("#money_no").val() == 0) {
					$("#plan_amount_label").text("지출 종류를 선택하세요.");
					return;
				} else {
					$("#plan_amount_label").text("");
				}
				
				let amount = $.trim($("#plan_amount").val());
				
				if (amount == "") {
					$("#plan_amount_label").text("예상 지출 금액을 입력하세요.");
					return;
				} else {
					$("#plan_amount_label").text("");
				}
				
				if ((amount != "") && (amount.match(onlyNum) == null)) {
					$("#plan_amount_label").text("숫자만 허용됩니다.");
					return;
				} else {
					$("#plan_amount_label").text("");
				}
				
				if ($("#plan_allDay").is(":checked")) {
					allDay = 'true';
				}

				let form = new FormData( document.getElementById("plan_form"));
				
				form.append('plan_loc', plan_loc);
				
				let keys = form.keys();
				for(key of keys) console.log(key);
				
				let values = form.values();
				for(value of values) console.log(value);

				$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/plan/update"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("여행 계획 일정이 수정 되었습니다.");
						location.href="${pageContext.request.contextPath}/plan?cate_no=${category.cate_no}";
					}//call back function
					, error : function(xhr) {
						alert("잠시 후 다시 시도해 주세요.");
					}//call back function//xhr : xml http request/response
				});//ajax
			});
		});
		$(document).ready(function() {
			$("#delete_btn").click(function() {
				$.get(
						"${pageContext.request.contextPath}/plan/delete",
						{
							plan_no : $("#plan_no").val()
						},
						function(data, status) {
							if (data == 1) {
								alert("여행 계획 일정이 삭제되었습니다.");
								location.href="${pageContext.request.contextPath}/plan?cate_no=${category.cate_no}";
							} else if (data <= 0) {
								alert("잠시 후 다시 시도해 주세요.");
							}
						}
				);
			});
		});
		</script>
		<script>
		var event = [];
		var plan_event;
		var modal = document.getElementById("modal");
		var addBox = document.getElementById("plan-add-box");
		var modifyBox = document.getElementById("plan-modify-box");
		var modalTitle = $(".modal-title");
		var planStart = $("#plan_startdate");
		var planEnd = $("#plan_enddate");
		var loc;
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
				select: function(info) {
					$(".fc-body").unbind('click');
					newEvent(info.startStr, info.endStr);
				},
				events : function(info, successCallback) {
					$.ajax({
							type: 'get',
							url: "${pageContext.request.contextPath}/plan/list",
							dataType: "json",
							data: {
								cate_no : "${category.cate_no}"
							},
							success: function(data) {
								if (event.length == 0) {
									$.each(data, function(idx, dto) {
										plan_event = {
												id: dto.plan_no,
												title: dto.plan_name,
												start: dto.plan_startdate,
												end: dto.plan_enddate,
												money: dto.money_no,
												amount: dto.plan_amount,
												desc: dto.plan_desc,
												loc: dto.plan_loc,
												allDay: JSON.parse(dto.plan_allDay)
										};
										event.push(plan_event);
									});
									successCallback(event);
								}
							}
					});
				},
				eventClick: function(info) {
					editEvent(info);
				},
				eventDrop : function(info) {
					$.post(
							"${pageContext.request.contextPath}/plan/dateUpdate",
							{
								plan_no : info.event.id,
								plan_startdate : moment(info.event.start).format("YYYY-MM-DD HH:mm"),
								plan_enddate : moment(info.event.end).format("YYYY-MM-DD HH:mm")
							},
							function(data, status) {
								if (data == 1) {
									alert("여행 계획 일정 시간이 수정되었습니다.");
								} else {
									alert("잠시 후 다시 시도해주세요.");
								}
							}
					);
				},
				eventResize: function(info) {
					alert(info.event.id + " : " + moment(info.event.start).format("YYYY-MM-DD HH:mm") + " : " + moment(info.event.end).format("YYYY-MM-DD HH:mm"));
				}
			  });
	
			  calendar.render();
			});
		
			var newEvent = function(start, end) {
				modal.style.display = "flex";
				modalTitle.html("여행 계획 추가");
				addBox.style.display = "flex";
				modifyBox.style.display = "none";
				planStart.val(start + " 00:00:00");
				planEnd.val(end  + " 00:00:00");
			}
			var editEvent = function(info) {
				modal.style.display = "flex";
				modalTitle.html("여행 계획 수정");
				addBox.style.display = "none";
				modifyBox.style.display = "flex";
				$("#plan_no").val(info.event.id);
				$("#plan_name").val(info.event.title);
				$("#plan_desc").val(info.event.extendedProps.desc);
				$("#plan_amount").val(info.event.extendedProps.amount);
				$("#money_no").val(info.event.extendedProps.money).prop("selected", true);
				planStart.val(moment(info.event.start).format("YYYY-MM-DD HH:mm"));
				planEnd.val(moment(info.event.end).format("YYYY-MM-DD HH:mm"));
				searchLoc(info.event.extendedProps.loc, info.event.title);
				plan_loc = info.event.extendedProps.loc;
			}
			
		</script>
		<script type="text/javascript">
		$(document).ready(function() {
			planStart.change(function() {
				$("#plan_allDay").prop("checked", false);
				let endTime = new Date(planStart.val());
				endTime.setHours(endTime.getHours() + 1);
				endTime = endTime.getFullYear() + "-" + ("0"+(endTime.getMonth()+1)).slice(-2) + "-" + ("0" + endTime.getDate()).slice(-2) 
				 + " " + ("0" + endTime.getHours()).slice(-2) + ":" + ("0" + endTime.getMinutes()).slice(-2) + ":00";
				planEnd.val(endTime);
			});
		});
		$(document).ready(function() {
			$("#close_btn").click(function() {
				modal.style.display = "none";
			});
		});
		
		$(document).ready(function() {
			$("#plan_money_btn").click(function() {
				location.href="${pageContext.request.contextPath}/plan/calc?cate_no=${category.cate_no}";
			});
		});
		</script>
		<script type="text/javascript">
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/plan/money",
					function(data, status) {
						$.each(JSON.parse(data), function(idx, dto) {
							$("#money_no").append(
								"<option value='" + dto.money_no + "'>" + dto.value_name + "</option>"	
							);
						});
					}
			);
		});
		</script>
	</body>
</html>