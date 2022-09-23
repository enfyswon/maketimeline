<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>내 프로필 수정</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="profile">
				<form id="user_info">
					<div id="profile-img">
						<c:choose>
							<c:when test="${pf.mpho_path != null && pf.mpho_path != ''}">
							<img id="profile" alt="profile_photo" src="${pf.mpho_path}">
							</c:when>
							<c:otherwise>
							<img id="defaultImg" src="${pageContext.request.contextPath}/resources/img/user.png">
							</c:otherwise>
						</c:choose>
					</div>
					<label for="profile" id="profile_label" class="write_label"></label>
					<input type="file" id="profile" name="profile" class="form-control">
					<button type="button" id="delete_btn" name="delete_btn" value="${pf.mpho_path}">프로필 사진 삭제</button>
					<div id="profile-info">
						<div class="profile-detail">
							<p class="profile-label"><label for="mni">닉네임</label></p>
							<div class="profile-desc">
								<input type="text" id="mni" name="mni" value="${pf.mni}"><br>
								<label id="mni_label" for="mni" class="write_label"></label>
							</div>
						</div>
						<div class="profile-detail">
							<p class="profile-label"><label for="mdes">소개</label></p>
							<div class="profile-desc">
								<input type="text" id="mdes" name="mdes"  value="${pf.mdes}"><br>
								<label id="mdes_label" for="mdes" class="write_label"></label>
							</div>
						</div>
					</div>
				</form>
				<div id="button-box">
					<div id="left-button-box">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/info_update'">회원정보 수정</button>
					</div>
					<div id="right-button-box">
						<button type="button" id="save_btn" name="save_btn">저장</button>
					</div>
				</div>
			</div>
		</main>
		
		<script type="text/javascript">
		$(document).ready(function() {
			
			$(document).ready(function() {
				$("#delete_btn").click(function() {
					$.get(
							"${pageContext.request.contextPath}/delete"
							, function(data, status) {
								if(data >= 1){
									alert("프로필 사진을 삭제 하였습니다.");
									window.location.reload();
								} else {
									alert("프로필 사진 삭제를 실패 하였습니다.");
								}
							}//call back function
					);//get
				});//click
			});//ready
			
			$("#save_btn").click(function() {
				
				if( $.trim($("#profile").val()) != "" ){
					let tmp = $("#profile").val().substring($("#profile").val().length-3);
					let tmp_boolean = (tmp == "jpg" || tmp == "jpeg" || tmp == "gif" || tmp == "png"
										|| tmp == "JPG" || tmp == "JPEG" || tmp == "GIF" || tmp == "PNG");
					if( $.trim( $("#profile").val() ) == "" || tmp1_boolean == false ){
						$("#profile_label").text("jpg/jpeg/gif/png 파일만 허용 됩니다.");
						return;
					} else { $("#profile_label").text(""); }
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
						location.href="${pageContext.request.contextPath}/mypage/myprofile";
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
