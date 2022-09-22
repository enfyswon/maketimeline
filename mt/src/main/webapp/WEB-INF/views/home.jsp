<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
	</head>
	<body>
		<div id="header">
			<a href="${pageContext.request.contextPath}/" id="logo-link">
				<img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
			</a>
			<div id="member-box">
			<c:choose>
		        <c:when test="${login_info != null && login_info.mni != null}">
		        ${login_info.mni}
		        <a href="${pageContext.request.contextPath}/login/logout">
		        	<button type="button" id="logout-btn">LOGOUT</button></a>
		        </c:when>
		        <c:otherwise>
		        <a href="${pageContext.request.contextPath}/login/" id="a-link">
		        	<button id="login-btn">LOGIN</button>
		        </a>
		        <a href="${pageContext.request.contextPath}/join/" id="a-link">
		        	<button id="join-btn">JOIN</button>
		        </a>
		        </c:otherwise>
	        </c:choose>
	        </div>  
		</div>
		<main>
			<div id="icon-bar">
				<div>
					<a href="${pageContext.request.contextPath}/category">
						<img alt="travel" src="${pageContext.request.contextPath}/resources/img/plane.png">
					</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/timeline/search">
						<img alt="search" src="${pageContext.request.contextPath}/resources/img/search.png">
					</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/mypage/myprofile">
						<img alt="mypage" src="${pageContext.request.contextPath}/resources/img/mypage.png">
					</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/memo/my_room_list">
						<img alt="chat" src="${pageContext.request.contextPath}/resources/img/chat.png">
					</a>
				</div>
			</div>
			<div id="test" class="carousel slide" align="center" data-ride="carousel">
				<ul class="carousel-indicators">
					<li data-target="#test" data-slide-to="0" class="active"></li>
					<li data-target="#test" data-slide-to="1" ></li>
				</ul>	
					<div class="carousel-inner">
						<div class="carousel-item active">
								<img src="${pageContext.request.contextPath}/resources/img/pic2.jpg"/>
						</div>
					<div class="carousel-item">
								<img src="${pageContext.request.contextPath}/resources/img/pic3.jpg" />
						</div>
					</div>
					<a class="carousel-control-prev" href="#text" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>				
					</a>
					<a class="carousel-control-next" href="#text" data-slide="next">
						<span class="carousel-control-next-icon"></span>				
					</a>
			</div>
		</main>
	</body>
	<br>
</html>