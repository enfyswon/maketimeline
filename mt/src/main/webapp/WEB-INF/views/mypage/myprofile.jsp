<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>내 프로필</title>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
								<div class="info-contents">
									<input type="text" id="mni" name="mni"  value="${myinfo.mni}">
									<label id="mni_label" for="mni"></label>
								</div>
							</div>
							
							<div class="info-line">
								<div class="info-label">
									<label for="mdes">소개</label>
								</div>
								<div class="info-contents">
									<input type="text" id="mdes" name="mdes"  value="${myinfo.mdes}">
									<label id="mdes_label" for="mdes"></label>
								</div>
							</div>
							
							<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">저장</button>
				</div>
	
	</body>
</html>