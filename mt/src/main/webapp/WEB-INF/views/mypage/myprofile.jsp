<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
	</head>
	<body>
	
	<div id="header">
			<a href="${pageContext.request.contextPath}/">
				<img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
			</a>
	</div>
	
	
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
				<a href="${pageContext.request.contextPath}/mypage/myprofile">
						<img alt="mypage" src="${pageContext.request.contextPath}/resources/img/mypage.png">
					</a>
				</div>
				<div>
					<a href="#">
						<img alt="chat" src="${pageContext.request.contextPath}/resources/img/chat.png">
					</a>
				</div>
			</div>
			<div>
			</div>
			
		<div class="info-contents">
		<img alt="profile_photo" src="${pageContext.request.contextPath}/resources/img/user.png">
		</div>
		<hr>
		<div class="info-line">
			<div class="info-label">
				<label for="mni">닉네임</label>
			</div>
		</div>
		<hr>
		<div class="info-line">
			<div class="info-label">
				<label for="mdes">소개</label>
			</div>
		</div>
		<hr>
		
		<button type="button" onclick="location.href='/src/WEB-INF/views/mypage/myinfo_up'">회원정보 수정</button>
		<button type="button" onclick="location.href='/src/WEB-INF/views/mypage/myprofile_up'">프로필 수정</button>
		<button type="button" onclick="location.href='chat'">관리자 문의</button>
		
	</body>
</html>