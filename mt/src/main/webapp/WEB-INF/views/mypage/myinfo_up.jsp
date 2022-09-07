<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</head>
	<body>

			<div id="main-content">
					<div class="info">
						
						<div class="info-box">
								
							<div class="info-line">
								<div class="info-label">
									<label for="email">이메일</label>
								</div>
								<div class="info-contents">
									<input type="text" id="email" name="email"  value="${myinfo.email}">
									<label id="email_label" for="email"></label>
								</div>
							</div>
							
							<div class="info-line">
								<div class="info-label">
									<label for="mpwd">비밀번호</label>
								</div>
								<div class="info-contents">
									<input type="password" id="mpwd" name="mpwd"  value="${myinfo.mpwd}">
									<input type="password" id="repwd" name="repwd"  value="${myinfo.mpwd}">
									<label for="mpwd" id="mpwd_label"></label>
								</div>
							</div>
							
							<div class="info-line">
								<div class="info-label">
									<label for="pnum">휴대폰 번호</label>
								</div>
								<div class="info-contents">
									<input type="text" id="pnum" name="pnum" value="${myinfo.pnum}">
									<label id="pnum_label" for="pnum"></label>
								</div>
							</div>
							
						</div>
					</div>
					
				<div id="button-box">
					<button type="button" id="save_btn" name="save_btn">저장</button>
				</div>
			</div>
	</body>
</html>
