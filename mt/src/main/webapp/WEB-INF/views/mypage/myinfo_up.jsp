<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
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
	<div style="width:15%;margin:auto;">
			<div id="main-content">
					<div class="info">
						
						<div class="info-box">
								
							<div class="info-line">
								<div class="info-label">
									<label for="email">이메일</label>
								</div>
								<div class="info-contents">
									<input type="text" id="email" name="email"  value="${pf.email}">
									<label id="email_label" for="email"></label>
								</div>
							</div>
							
							<div class="info-line">
								<div class="info-label">
									<label for="mpwd">새 비밀번호</label>
								</div>
								<div class="info-contents">
									<input type="password" id="mpwd" name="mpwd"  value="${pf.mpwd}">
									<label for="mpwd" id="mpwd_label"></label>
								</div>
							</div>
							
							<div class="info-line">
								<div class="info-label">
									<label for="pnum">휴대폰 번호</label>
								</div>
								<div class="info-contents">
									<input type="text" id="tel" name="tel" value="${pf.tel}">
									<label id="tel_label" for="tel"></label>
								</div>
							</div>
							
						</div>
					</div>
					
				<div id="button-box">
					<button type="button" id="save_btn" name="save_btn">저장</button>
				</div>
			</div>
	</div>
	
	</body>
</html>
