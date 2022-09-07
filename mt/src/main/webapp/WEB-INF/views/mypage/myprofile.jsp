<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>My profile</title>
	</head>
	<body>
	
	<div class="info-contents">
		<c:if test="${myinfo.mpho_path != null && myinfo.mpho_path != '0'}">
		<img alt="profile_photo" src="${myinfo.mpho_path}">
		</c:if>
		<c:if test="${myinfo.mpho_path == null || myinfo.mpho_path == '0'}">
		<img alt="profile_photo" src="${pageContext.request.contextPath}/resources/img/user.png">
		</c:if>
		<input type="file" id="profile" name="profile">
	</div>
	
	
	
	</body>
</html>