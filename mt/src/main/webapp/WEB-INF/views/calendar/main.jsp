<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> Calendar Main </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memo_style.css">
	</head>
	<body>


			<form id="monthSearchForm" action="${pageContext.request.contextPath}/calendar/main"
					class="form-inline justify-content-center">
				<select id="this_year" name="this_year" class="form-control mr-1">
					<c:forEach var="selectVarYear" begin="${date_info.this_year - 10}" end="${date_info.this_year + 10}">
						<option value="${selectVarYear}"
							<c:if test="${date_info.this_year == selectVarYear}">selected="selected"</c:if>
						>${selectVarYear}</option>
					</c:forEach>
				</select>
				<select id="this_month" name="this_month" class="form-control">
					<c:forEach var="selectVarMonth" begin="1" end="12">
						<option value="${selectVarMonth}"
							<c:if test="${date_info.this_month == selectVarMonth}">selected="selected"</c:if>
						>${selectVarMonth}</option>
					</c:forEach>
				</select>
			</form>
			<script type="text/javascript">
			$(document).ready(function() {
				$("#this_year").change(function() {
					$("#monthSearchForm").submit();
				});//change
				$("#this_month").change(function() {
					$("#monthSearchForm").submit();
				});//change
			});//ready
			</script>
		<hr>

		<c:set var="num" value="1" />
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>SUN</th>	<th>MON</th>	<th>TUE</th>	<th>WED</th>	<th>THU</th>	<th>FRI</th>	<th>SAT</th>
				</tr>
			</thead>
			<tr>
				<c:forEach var="count" begin="1" end="${date_info.for_end}">
					<td style="width:3%; height:80px;" class="border-top-0">
						<c:choose>
							<c:when test="${count >= date_info.first_day && num <= date_info.last_date}">
								${num}
								<c:set var="num" value="${num + 1}" />
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</td>
					<c:if test="${count % 7 == 0}">
						</tr>
						<tr>
					</c:if>
				</c:forEach>
			</tr>
		</table>
		<hr>


	</body>
</html>
