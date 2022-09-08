<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
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
			
		<div style="width:50%;margin:auto;">
			<div class="info-contents">
				<img alt="profile_photo" src="${pageContext.request.contextPath}/resources/img/user.png">
			</div>
				<hr>
			<div class="info-line">
				<div class="info-label">
					<label for="mni">닉네임</label>
					<p class="nickname">${dto.mni}</p>
				</div>
			</div>
				<hr>
			<div class="info-line">
				<div class="info-label">
					<label for="mdes">소개</label>
					<p class="introduce">${dto.mdes}</p>
				</div>
			</div>
				<hr>
			
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/myinfo_up'">회원정보 수정</button>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/myprofile_up'">프로필 수정</button>
			<button type="button" onclick="location.href='chat'">관리자 문의</button>
		</div>	
		
	</body>
</html>