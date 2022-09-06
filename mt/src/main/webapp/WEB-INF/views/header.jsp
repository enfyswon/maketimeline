<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">

<div id="header">
	<img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
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
			<a href="#">
				<img alt="chat" src="${pageContext.request.contextPath}/resources/img/chat.png">
			</a>
		</div>
	</div>
</div>