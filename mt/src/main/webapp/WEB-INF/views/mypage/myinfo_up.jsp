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
			
			$.ajax({
				type : "POST" 
				, encType : "multipart/form-data" 
				, url : "${pageContext.request.contextPath}/mypage/myinfo_update" 
				, data : form 
				, processData : false
				, contentType : false 
				, cache : false 
				, success : function(result) {
					alert("회원 정보가 수정되었습니다.");
					location.href = "${pageContext.request.contextPath}/mypage/myinfo_update";
				}, 
				error : function(xhr) {
					alert("잠시 후 다시 시도해주세요.");
				}
			});
			
	</body>
</html>
