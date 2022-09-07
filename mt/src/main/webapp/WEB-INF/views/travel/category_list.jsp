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
		<main>
			<div id="ticket-box">
				<c:forEach var="dto" items="${catelist}">
				<div class="travel-ticket">
					<a href="#" class="travel-ticket-link">
						<div class="ticket-desc">
							<div class="ticket-desc-border">
								<p>Travel Ticket</p>
							</div>
							<div class="ticket-desc-main">
								<p class="ticket-title">${dto.cate_name}</p>
								<p class="ticket-date">${dto.cate_startdate} ~ ${dto.cate_enddate}</p>
							</div>
							<div class="ticket-desc-border">
								<p class="none">test</p>
							</div>
						</div>
						<div class="ticket-img">
							<c:choose>
								<c:when test="${dto.cate_photoname != null}">
								<img alt="ticket-img" src="${dto.cate_photopath}">
								</c:when>
								<c:otherwise>
								<img alt="ticket-img" src="${pageContext.request.contextPath}/resources/img/ticket.jpg">
								</c:otherwise>
							</c:choose>
						</div>
					</a>
				</div>
				</c:forEach>
				<div class="travel-ticket ticket-empty">
					<a href="${pageContext.request.contextPath}/travel/add" class="travel-ticket-link">
						<img alt="plus" src="${pageContext.request.contextPath}/resources/img/plus.png">
					</a>
				</div>
			</div>
		</main>
	</body>
</html>