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
				<form id="user_info">
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
									<label for="mpwd">비밀번호</label>
								</div>
								<div class="info-contents">
									<input type="password" id="mpwd" name="mpwd"  value="${pf.mpwd}">
									<label for="mpwd" id="mpwd_label"></label>
								</div>
							</div>
							
							<div class="info-line">
								<div class="info-label">
									<label for="tel">휴대폰 번호</label>
								</div>
								<div class="info-contents">
									<input type="text" id="tel" name="tel" value="${pf.tel}">
									<label id="tel_label" for="tel"></label>
								</div>
							</div>
							
						</div>
					</div>
					</form>
				<div id="button-box">
					<button type="button" id="save_btn" name="save_btn">저장</button>
				</div>
			</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
		let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
		let onlyNum = /^[0-9]+$/;
		$("#save_btn").click(function() {

			let pwd = $.trim($("#mpwd").val());
			if( pwd.match(onlyPwd) == null ){//허용되지 않은 글자는 null.
				$("#mpwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
				return;
			} else { $("#mpwd_label").text(""); }

			let email = $.trim($("#email").val());
			if( email == "") {
				$("#email_label").text("이메일을 입력해주세요.");
				return;
			} else { $("#email_label").text(""); }

			let tel = $.trim($("#tel").val());
			if (tel == "") {
				$("#tel_label").text("전화번호를 입력해주세요.");
				return;
			} else { $("#tel_label").text(""); }

			if( ( tel != "" && tel.match(onlyNum) == null )){
				$("#tel_label").text("숫자만 허용 됩니다.");
				return;
			} else { $("#tel_label").text(""); }

			let form = new FormData( document.getElementById( "user_info" ) );
			
			let keys = form.keys();
			for(key of keys) console.log(key);

			let values = form.values();
			for(value of values) console.log(value);
			
			$.ajax({
				type : "POST" 
				, encType : "multipart/form-data" 
				, url : "${pageContext.request.contextPath}/mypage/info_update" 
				, data : form 
				, processData : false
				, contentType : false 
				, cache : false 
				, success : function(result) {
					alert("회원 정보가 수정되었습니다.");
					location.href = "${pageContext.request.contextPath}/mypage/myinfo_up";
				}, 
				error : function(xhr) {
					alert("잠시 후 다시 시도해주세요.");
				}
			});
			
		});//click
	});//ready
	</script>
	
	</body>
</html>
