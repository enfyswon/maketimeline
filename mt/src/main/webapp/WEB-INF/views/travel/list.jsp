<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
	</head>
<style>
#ticket-box {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
}
.travel-ticket {
	display: flex;
	flex-direction: row;
	border: 1px solid #5b5b5b;
	border-radius: 10px;
	width: 35%;
	height: 150px;
	overflow: hidden;
}
.ticket-desc {
	width: 70%;
}
.ticket-desc-border {
	background-color: #51BCFF;
	height: 15px;
	color: white;
}
.ticket-desc-border > p {
	margin-left: 10px;
	font-size: medium;
}
.ticket-desc-main {
	background-color: white;
	height: 120px;
	text-align: center;
}
.ticket-img {
	width: 30%;
}
.ticket-img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.none {
	visibility: hidden;
}
</style>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="ticket-box">
				<div class="travel-ticket">
					<div class="ticket-desc">
						<div class="ticket-desc-border">
							<p>Travel Ticket</p>
						</div>
						<div class="ticket-desc-main">
							<p>여행 장소 / 이름</p>
							<p>여행 날짜</p>
						</div>
						<div class="ticket-desc-border">
							<p class="none">test</p>
						</div>
					</div>
					<div class="ticket-img">
						<img alt="ticket-img" src="${pageContext.request.contextPath}/resources/img/ticket.jpg">
					</div>
				</div>
				<div class="travel-ticket">
					<div class="ticket-desc">
						<div class="ticket-desc-border">
							Travel Ticket
						</div>
						<div class="ticket-desc-main">
							<p>여행 장소 / 이름</p>
							<p>여행 날짜</p>
						</div>
						<div class="ticket-desc-border">
							<p class="none">test</p>
						</div>
					</div>
					<div class="ticket-img">
						<img alt="ticket-img" src="${pageContext.request.contextPath}/resources/img/ticket.jpg">
					</div>
				</div>
			</div>
		</main>
	</body>
</html>