<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/travel_style.css">
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5018921c91408548d9d5f456c15b27b"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="map">
			</div>
			<div id="timeline-box">
			</div>
			<div id="button-box">
				<button id="plan_btn">
					<img alt="plan" src="${pageContext.request.contextPath}/resources/img/plan.png">
				</button>
				<button id="timeline_add_btn">
					<img alt="plan_plus" src="${pageContext.request.contextPath}/resources/img/travel_plus.png">
				</button>
				<button id="timeline_money_btn">
					<img alt="plan_money" src="${pageContext.request.contextPath}/resources/img/moneybox.png">
				</button>
			</div>
		</main>
		<script type="text/javascript">
		let container = document.getElementById('map');
		let options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		let map = new kakao.maps.Map(container, options);
		</script>
		<script type="text/javascript">
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