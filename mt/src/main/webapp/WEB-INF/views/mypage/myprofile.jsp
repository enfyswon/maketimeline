<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>내 프로필</title>
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
	<div class="profile">
		<div style="width:50%;margin:auto;">
			<div class="info-contents">
				<img alt="profile_photo" src="${pageContext.request.contextPath}/resources/img/user.png">
			</div>
				<hr>
			<div class="info-line">
				<div class="info-label">
					<p class="mni">닉네임 ${pf.mni}</p>
				</div>
			</div>
				<hr>
			<div class="info-line">
				<div class="info-label">
					<p class="mdes">소개 ${pf.mdes}</p>
				</div>
			</div>
				<hr>
			<c:choose>
				<c:when test="${login_info.mno == pf.mno}">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/info_update'">회원정보 수정</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/profile_update'">프로필 수정</button>
					<button type="button" id="#open_room_btn">관리자 문의</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="location.href='chat'">채팅</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
		 <script type="text/javascript">
      $(document).ready(function() {
         $("#open_room_btn").click(function() {
            if( $.trim( $("#mno_to").val() ) == "" ){
               alert("대화 상대방 아이디를 입력 하세요.");
               return;
            }
            $.get(
                  "${pageContext.request.contextPath}/memo/start"
                  , {
                	  mno_to : $("#mno_to").val()
                  }
                  , function(data, status) {
                     if(data >= 1){
                        alert("쪽지방이 성공적으로 만들어졌습니다.");
                        location.href="${pageContext.request.contextPath}/memo/open_room?room_no="${'manager' == dto.mno_to}"+data;
                     } else if(data <= 0){
                        alert("쪽지방 만들기가 실패 하였습니다.");
                     } else {
                        alert("잠시 후 다시 시도해 주세요.");
                     }
                  }//call back function
            );//post
         });//click
      });//ready
      </script>
		
	</body>
</html>