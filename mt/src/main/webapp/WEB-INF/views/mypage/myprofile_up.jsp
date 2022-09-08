<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>내 프로필 수정</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
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
	
							<div class="info-line">
								<div class="info-label">
									<label for="mni">닉네임</label>
								</div>
								<div class="info-label">
									<input type="text" id="mni" name="mni"  value="${dto.mni}">
									<label id="mni_label" for="mni"></label>
								</div>
							</div>
							
							<div class="info-line">
								<div class="info-label">
									<label for="mdes">소개</label>
								</div>
								<div class="info-label">
									<input type="text" id="mdes" name="mdes"  value="${dto.mdes}">
									<label id="mdes_label" for="mdes"></label>
								</div>
							</div>
							
				<div class="form-group has-feedback">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/myinfo_up'">회원정보 수정</button>
					<button class="btn btn-success" type="submit" id="submit">저장</button>
				</div>
	
	</body>
</html>