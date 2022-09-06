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
		<div id="header">
			<a href="${pageContext.request.contextPath}/">
				<img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
			</a>
		</div>
		<main>
			<div id="icon-bar">
				<div>
					<a href="${pageContext.request.contextPath}/travel">
						<img alt="travel" src="${pageContext.request.contextPath}/resources/img/plane.png">
					</a>
				</div>
				<div>
					<a href="#">
						<img alt="search" src="${pageContext.request.contextPath}/resources/img/search.png">
					</a>
				</div>
				<div>
					<a href="#">
						<img alt="mypage" src="${pageContext.request.contextPath}/resources/img/mypage.png">
					</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/chat/chat_list">
						<img alt="chat" src="${pageContext.request.contextPath}/resources/img/chat.png">
					</a>
				</div>
			</div>
			<div>
			</div>
			<!-- Carousel -->
				
					<div class="col-sm-2" align="center">
						<img id="photo" alt="photo" src="${pageContext.request.contextPath}/resources/img/pic2.jpg" alt="" />
					</div>
				
				<br>
				<br>
		</main>
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