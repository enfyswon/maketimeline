<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타임라인 검색</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/search.css">
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5018921c91408548d9d5f456c15b27b&libraries=services"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="search-box">
				<form action="${pageContext.request.contextPath}/timeline/list" method="get">
					<div id="search">
						<select id="searchOption" name="searchOption">
							<option value="timeline_name"
								<c:if test="${search_dto.searchOption == 'timeline_name'}">selected="selected"</c:if>
							> 타임라인 제목 </option>
							<option value="timeline_desc"
								<c:if test="${search_dto.searchOption == 'timeline_desc'}">selected="selected"</c:if>
							> 글내용 </option>
						</select>
						<input type="text" id="searchWord" name="searchWord" value="${search_dto.searchWord}">
						<button type="submit" class="btn btn-primary"> 검 색 </button>
					</div>
				</form>
				<div id="search-map">
				</div>
			</div>
			<div id="timeline-box">
				<c:forEach var="dto" items="${list}">
				<div class="timeline-card">
					<div class="timeline-img">
						<a href="${dto.timeline_photopath}" data-lightbox="image">
							<img alt="timeline_img" src="${dto.timeline_photopath}">
						</a>
					</div>
					<div class="timeline-cnts">
						<p class="timeline-name">${dto.timeline_name}</p>
						<div class="timeline-profile">
							<div class="timeline-profile-img">
								<a href="${pageContext.request.contextPath}/profile?email=${dto.email}">
								<c:if test="${dto.mpho_path == null}">
									<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png">
								</c:if>
								<c:if test="${dto.mpho_path != null}">
									<img alt="profile" src="${dto.mpho_path}">
								</c:if>
								</a>
							</div>
							<div class="timeline-profile-desc">
								<p class="timeline-nick">${dto.mni}</p>
								<p class="timeline-date">${dto.timeline_startdate}</p>
							</div>
						</div>
						<p class="timeline-desc">${dto.timeline_desc}</p>
						<c:if test="${login_info.mno == dto.mno}">
						<div class="timeline-btn-box">
							<button type="button" class="timeline-update-btn"></button>
							<button type="button" class="timeline-delete-btn"></button>
						</div>
						</c:if>
					</div>
				</div>
				</c:forEach>
			</div>
			
		</main>
		<script type="text/javascript">
		var markers = [];
		var mapContainer = document.getElementById('search-map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var bounds = new kakao.maps.LatLngBounds();
		
		function addMarker(loc, name) {
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(loc, function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
		
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        bounds.extend(coords);
		
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
		
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:small;">' + name + '</div>'
			        });
			        infowindow.open(map, marker);
			        
			        markers.push(marker);
					
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setBounds(bounds);
			    } 
			});   
		}
		// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }            
		}

		// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
		function showMarkers() {
		    setMarkers(map);
		}

		// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
		function hideMarkers() {
		    setMarkers(null);    
		}
		</script>
<!-- 		<script type="text/javascript">
// 		 $(document).ready(function() {
// 			$.each(${mapList}, function(idx, dto) {
// 				addMarker(dto.timeline_loc, dto.timeline_name);
// 				showMarkers();
// 			});//each
// 		});//ready
</script> -->
		<script type="text/javascript">
		$(document).ready(function() {
	        lightbox.option({
	            'resizeDuration' : 200,
	            'wrapAround' : false,
	            'disableScrolling' : false,
	            'fitImagesInViewport' :false,
	            'maxWidth' : 600,
	            'maxHeight' : 600,
	        })		
		});//ready
		$(document).ready(function() {
			$("#plan_btn").click(function() {
				location.href="${pageContext.request.contextPath}/plan?cate_no=${category.cate_no}";
			});
		});
		$(document).ready(function() {
			$("#timeline_add_btn").click(function() {
				location.href="${pageContext.request.contextPath}/timeline/add?cate_no=${category.cate_no}";
			});
		});
		$(document).ready(function() {
			$("#timeline_money_btn").click(function() {
				location.href="${pageContext.request.contextPath}/timeline/money?cate_no=${category.cate_no}";
			});
		});
		</script>
	</body>
</html>