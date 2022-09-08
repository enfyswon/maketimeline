<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/category_style.css">
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="ticket-box">
				<c:forEach var="dto" items="${catelist}">
				<div class="ticket">
					<div class="travel-ticket">
						<a href="${pageContext.request.contextPath}/plan?cate_no=${dto.cate_no}" class="travel-ticket-link">
							<div class="ticket-desc">
								<div class="ticket-desc-border">
									<p>Travel Ticket</p>
								</div>
								<div class="ticket-desc-main">
									<p class="ticket-title">${dto.cate_name}</p>
									<c:if test="${dto.cate_startdate != null}">
										<p class="ticket-date">${dto.cate_startdate} ~ ${dto.cate_enddate}</p>
									</c:if>
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
					<div class="ud-box">
						<button class="update_btn" value="${dto.cate_no}">
							<img alt="update" src="${pageContext.request.contextPath}/resources/img/update.png" class="update-img">
						</button>
						<button class="delete_btn" value="${dto.cate_no}">
							<img alt="delete" src="${pageContext.request.contextPath}/resources/img/delete.png" class="delete-img">
						</button>
					</div>
				</div>
				</c:forEach>
				<div class="ticket">
					<div class="travel-ticket ticket-empty">
						<a href="${pageContext.request.contextPath}/category/add" class="travel-ticket-link">
							<img alt="plus" src="${pageContext.request.contextPath}/resources/img/plus.png">
						</a>
					</div>
				</div>
			</div>
		</main>
		
		<script type="text/javascript">
		$(document).ready(function() {
			$(".delete_btn").click(function() {
				$.get(
						"${pageContext.request.contextPath}/category/delete", 
						{
							cate_no : $(this).val()
						},
						function(data, status) {
							if (data >= 1) {
								alert("카테고리를 삭제했습니다.");
								location.href="${pageContext.request.contextPath}/category";
							} else if (data == 0) {
								alert("삭제에 실패했습니다.");
							} else {
								alert("잠시 후 다시 시도해주세요.");
							}
						}
				);
			});
		});
		$(document).ready(function() {
			$(".update_btn").click(function() {
				location.href="${pageContext.request.contextPath}/category/update?cate_no=" + $(this).val();
			});
		});
		</script>
	</body>
</html>