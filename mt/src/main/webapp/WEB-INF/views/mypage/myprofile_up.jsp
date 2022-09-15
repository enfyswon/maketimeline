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
				
				<div>
					<c:choose>
								<c:when test="${pf.mpho_path != null && pf.mpho_path != ''}">
									<img src="${pf.mpho_path}">
								</c:when>
								<c:otherwise>
									<img id="defaultImg" src="${pageContext.request.contextPath}/resources/img/user.png">
									<input type="file" id="mpho" name="mpho" class="form-control">
									<label for="mpho" id="mpho_label" class="user_info"></label>
								</c:otherwise>
					</c:choose>
				</div>
							<div class="info-line">
								<div class="info-label">
									<label for="mni">닉네임</label>
								</div>
								<div class="info-label">
									<input type="text" id="mni" name="mni" value="${pf.mni}">
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

				if( $.trim($("#mpho").val()) != "" ){
					let tmp1 = $("#mpho").val().substring($("#mpho").val().length-3);
					let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
										|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
					if( $.trim( $("#mpho").val() ) == "" || tmp1_boolean == false ){
						$("#mpho_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
						return;
					} else { $("#mpho_label").text(""); }
				}
								
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
					, url : "${pageContext.request.contextPath}/mypage/profile_update" 
					, data : form 
					, processData : false
					, contentType : false 
					, cache : false 
					, success : function(result) {
						alert("프로필이 수정되었습니다.");
						window.location.reload();
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
