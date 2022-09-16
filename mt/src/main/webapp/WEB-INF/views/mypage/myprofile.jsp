<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>내 프로필</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
	</head>
	<body>
	
	<div id="header">
			<a href="${pageContext.request.contextPath}/">
				<img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
			</a>
	</div>
	<div class="profile">
		<div style="width:50%;margin:auto;">
			<form id="user_info">
				<div>
					<img alt="profile_photo" src="${pf.mpho_path}" width=200px, height=200px>
				</div>
					<hr>
				<div class="info-line">
					<div class="info-label">
						<p class="mni">닉네임 ${pf.mni}</p>
					</div>
				</div>
					<hr>
				<div class="info-line">
					<div class="info-label">
						<p class="mdes">소개 ${pf.mdes}</p>
					</div>
				</div>
			</form>
				<hr>
			<c:choose>
				<c:when test="${login_info.mno == pf.mno}">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/info_update'">회원정보 수정</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/profile_update'">프로필 수정</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/memo/open_room'">관리자 문의</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="location.href='chat'">채팅</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
		
		
	</body>
</html>