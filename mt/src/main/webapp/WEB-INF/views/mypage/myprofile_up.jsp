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
	
	<div id="header">
			<a href="${pageContext.request.contextPath}/">
				<img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
			</a>
	</div>
	
	<div style="width:15%;margin:auto;">
		<div id="main-content">
			<form id="user_info">
			
		<div class="info-contents">
			<c:if test="${myinfo.mpho_path != null && myinfo.mpho_path != '0'}">
			<img alt="profile_photo" src="${myinfo.mem_photopath}">
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
									<input type="text" id="mni" name="mni"  value="${pf.mni}">
									<label id="mni_label" for="mni"></label>
								</div>
							</div>
							
							<div class="info-line">
								<div class="info-label">
									<label for="mdes">소개</label>
								</div>
								<div class="info-label">
									<input type="text" id="mdes" name="mdes"  value="${pf.mdes}">
									<label id="mdes_label" for="mdes"></label>
								</div>
							</div>
			</form>
				<div class="form-group has-feedback">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/info_update'">회원정보 수정</button>
					<button type="button" id="save_btn" name="save_btn">저장</button>
				</div>
		</div>
	</div>
		
	<script type="text/javascript">
	$(document).ready(function() {
		$("#save_btn").click(function() {

			let mni = $.trim($("#mni").val());
			if( mni == "") {
				$("#mni_label").text("닉네임을 입력해주세요.");
				return;
			} else { $("#mni_label").text(""); }

			let mdes = $.trim($("#mdes").val());
			if (mdes == "") {
				$("#mdes_label").text("자기소개를 입력해주세요.");
				return;
			} else { $("#mdes_label").text(""); }

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
					alert("프로필이 수정되었습니다.");
					location.href = "${pageContext.request.contextPath}/mypage/myinfo_up";
				}, 
				error : function(xhr) {
					alert("잠시 후 다시 시도해주세요.");
				}
			});
		});//click
	</script>
	</body>
</html>
