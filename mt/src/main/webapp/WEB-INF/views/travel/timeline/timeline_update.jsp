<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/travel_style.css">
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5018921c91408548d9d5f456c15b27b&libraries=services"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="timeline-input">
				<form id="timeline_form">
					<input type="hidden" id="cate_no" name="cate_no" value="${cate_no}">
					<div class="timeline-detail">
						<p>
							<label for="timeline_name">글 제목</label>
							<label for="timeline_name" id="timeline_name_label" class="write_label"></label>
						</p>
						<input type="text" id="timeline_name" name="timeline_name" placeholder="글 제목" value="${timeline.timeline_name}">
					</div>
					<div class="timeline-detail">
						<p>
							<label for="timeline_date">여행 날짜</label>
							<label for="timeline_date" id="timeline_date_label" class="write_label"></label>
						</p>
						<input type="datetime-local" id="timeline_date" name="timeline_date" value="${timeline.timeline_date}">
					</div>
					<div class="timeline-detail">
						<p>
							<label for="timeline_desc">글 내용</label>
							<label for="timeline_desc" id="timeline_desc_label" class="write_label"></label>
						</p>
						<input type="text" id="timeline_desc" name="timeline_desc" placeholder="글 내용" value="${timeline.timeline_desc}">
					</div>
					<div class="timeline-detail">
						<p>
							<label for="timeline_amount">지출 금액</label>
							<label for="timeline_amount" id="timeline_amount_label" class="write_label"></label>
						</p>
						<select id="money_no" name="money_no">
							<option value="0">---종류 선택---</option>
						</select>
						<input type="text" id="timeline_amount" name="timeline_amount" placeholder="지출 금액" value="${timeline.timeline_amount}">
					</div>
					<div class="timeline-detail">
						<p>
							사진
							<label id="timeline_photo_label" class="write_label"></label>
						</p>
						<input type="file" id="timeline_photo" name="timeline_photo" value="${timeline.timeline_photo}">
					</div>
					<div class="timeline-detail">
						<p>
							위치
							<label id="timeline_loc_label" class="write_label"></label>
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
				<button type="button" id="cancel_btn">취소</button>
				<button type="button" id="update_btn">수정</button>
			</div>
		</main>
		<script type="text/javascript">
		$(document).ready(function() {
			$.each(${money}, function(idx, dto) {
				$("#money_no").append(
					"<option value='" + dto.money_no + "'>" + dto.value_name + "</option>"	
				);
			});
		});
		</script>
		<script type="text/javascript">
		var markers = [];
		var selectedMarker = null;
		var timeline_loc = "";
		var liClass = "";
		var mapContainer = document.getElementById('input-map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

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
		    var content = '<div style="padding:5px;z-index:1;font-size:small;text-align:center;">' + title + '</div>';

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
			var num = null;
			if (liClass.length == 10) {
				num = liClass.substr(liClass.length-1, 1);
			} else if (liClass.length == 11) {
				num = liClass.substr(liClass.length-2, 2);
			}
			//alert(num);
			if (num != null) {
				$(".item").not(".item.item" + num).removeClass("active-item");
				$(".item" + num).addClass("active-item");
				if (loc.road_address_name != "") {
					timeline_loc = loc.road_address_name;
				} else {
					timeline_loc = loc.address_name;
				}
			}
		}
		</script>
		<script type="text/javascript">
		let onlyNum = /^[0-9]+$/;
		$(document).ready(function() {
			$("#cancel_btn").click(function() {
				location.href="${pageContext.request.contextPath}/category";
			});
		});
		$(document).ready(function() {
			$("#update_btn").click(function() {
				if ($.trim($("#timeline_name").val()) == "") {
					$("#timeline_name_label").text("제목을 입력하세요.");
					return;
				} else {
					$("#timeline_name_label").text("");
				}
				
				if ($("#timeline_date").val() == "") {
					$("#timeline_date_label").text("여행 날짜를 선택해주세요.");
					return;
				} else {
					$("#timeline_date_label").text("");
				}
				
				if ($.trim($("#timeline_desc").val()) == "") {
					$("#timeline_desc_label").text("내용을 입력하세요.");
					return;
				} else {
					$("#timeline_desc_label").text("");
				}
				
				if ($("#money_no").val() == 0) {
					$("#timeline_amount_label").text("지출 종류를 선택하세요.");
					return;
				} else {
					$("#timeline_amount_label").text("");
				}
				
				let amount = $.trim($("#timeline_amount").val());
				
				if (amount == "") {
					$("#timeline_amount_label").text("지출 금액을 입력하세요.");
					return;
				} else {
					$("#timeline_amount_label").text("");
				}
				
				if ((amount != "") && (amount.match(onlyNum) == null)) {
					$("#timeline_amount_label").text("숫자만 허용됩니다.");
					return;
				} else {
					$("#timeline_amount_label").text("");
				}
				
				if ($.trim($("#timeline_photo").val()) == "") {
					$("#timeline_photo_label").text("사진을 선택하세요.");
					return;
				} else {
					$("#timeline_photo_label").text("");
				}
				
				let tmp1 = $("#timeline_photo").val().substring($("#timeline_photo").val().length-3);
				let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
									|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
				if( $.trim( $("#timeline_photo").val() ) != "" && tmp1_boolean == false ){
					$("#timeline_photo_label").text("jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				} else { $("#timeline_photo_label").text(""); }
				
				if(timeline_loc == "") {
					$("#timeline_loc_label").text("위치를 선택하세요.");
					return;
				} else {
					$("#timeline_loc_label").text("");
				}
				
				let form = new FormData( document.getElementById("timeline_form"));
				form.append("timeline_loc", timeline_loc);
				
				let keys = form.keys();
				for(key of keys) console.log(key);
				
				let values = form.values();
				for(value of values) console.log(value);
				
				//return;
				$.ajax({
					type : "POST", 
					encType : "multipart/form-data", 
					url : "${pageContext.request.contextPath}/timeline/update", 
					data : form, 
					processData : false, 
					contentType : false, 
					cache : false, 
					success : function(result) {
						alert("글이 등록되었습니다.");
						location.href = "${pageContext.request.contextPath}/timeline?cate_no=${cate_no}";
					}, 
					error : function(xhr) {
						alert("잠시 후 다시 시도해 주세요.");
					}
				});
			});
		});
		</script>
	</body>
</html>