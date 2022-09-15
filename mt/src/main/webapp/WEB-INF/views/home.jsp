<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
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
		        <a href="${pageContext.request.contextPath}/login/">
		        	<button id="login-btn">LOGIN</button>
		        </a>
		        <a href="${pageContext.request.contextPath}/join/">
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
					<a href="#">
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
			<div class="row" align="center">
							
								<img src="${pageContext.request.contextPath}/resources/img/pic2.jpg" alt="" />
								
							
							</div>
		</main>
	</body>
</html>