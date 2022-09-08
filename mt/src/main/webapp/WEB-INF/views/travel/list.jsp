<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/travel_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<br><br><br><br><br><br><br>
		<main>
			<div id="ticket-box">
				<div class="travel-ticket">
					<a href="#" class="travel-ticket-link">
						<div class="ticket-desc">
							<div class="ticket-desc-border">
								<p>Travel Ticket</p>
							</div>
							<div class="ticket-desc-main">
								<p class="ticket-title">여행 장소 / 이름</p>
								<p class="ticket-date">여행 날짜</p>
							</div>
							<div class="ticket-desc-border">
								<p class="none">test</p>
							</div>
						</div>
						<div class="ticket-img">
							<img alt="ticket-img" src="${pageContext.request.contextPath}/resources/img/ticket.jpg">
						</div>
					</a>
				</div>
				<div class="travel-ticket">
					<a href="#" class="travel-ticket-link">
						<div class="ticket-desc">
							<div class="ticket-desc-border">
								<p>Travel Ticket</p>
							</div>
							<div class="ticket-desc-main">
								<p class="ticket-title">여행 장소 / 이름</p>
								<p class="ticket-date">여행 날짜</p>
							</div>
							<div class="ticket-desc-border">
								<p class="none">test</p>
							</div>
						</div>
						<div class="ticket-img">
							<img alt="ticket-img" src="${pageContext.request.contextPath}/resources/img/ticket.jpg">
						</div>
					</a>
				</div>
				<div class="travel-ticket ticket-empty">
					<a href="${pageContext.request.contextPath}/travel/add" class="travel-ticket-link">
						<img alt="plus" src="${pageContext.request.contextPath}/resources/img/plus.png">
					</a>
				</div>
			</div>
		</main>
	</body>
</html>