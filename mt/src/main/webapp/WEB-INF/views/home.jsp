<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic_style.css" />

	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		
		<!-- 메인페이지 사진 -->
				<section class="carousel">
					<div class="reel" align="center">
						<article class="col-1 col-1-mobile special" >
							<a class="image featured" ><img  src="${pageContext.request.contextPath}/resources/img/pic2.jpg" alt="" style="width:400px;" /></a>
						</article >
					</div>
				</section>
				<br>
				<br>
	</body>
</html>