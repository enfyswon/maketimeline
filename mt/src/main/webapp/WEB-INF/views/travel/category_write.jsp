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
<style>
#category-input {
	width: 80%;
}
</style>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="category-input">
				<div>
					<input>
				</div>
				<div>
					<input>
				</div>
				<div>
					<img alt="gyeongsang" src="${pageContext.request.contextPath}/resources/img/gyeongsang.png">
				</div>
				<div>
				</div>
				<button type="button">등록</button>
			</div>
		</main>
	</body>
</html>