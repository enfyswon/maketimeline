<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
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
				<div id="profile-info">
					<div class="profile-detail">
						<p class="profile-label">닉네임</p>
						<p class="profile-desc">${pf.mni}</p>
					</div>
					<div class="profile-detail">
						<p class="profile-label">소개</p>
						<p class="profile-desc"><span class="none">test</span>${pf.mdes}</p>
					</div>
				</div>
			</form>
			<div id="button-box">
			<c:choose>
				<c:when test="${login_info.mno == pf.mno}">
				<div id="left-button-box">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/info_update'">회원정보 수정</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/profile_update'">프로필 수정</button>
				</div>
				<div id="right-button-box">
					<button id="open_room_btn" type="button" >관리자 문의</button>
				</div>
				</c:when>
				<c:otherwise>
				<div id="left-button-box">
					<p class="none">test</p>
				</div>
				<div id="right-button-box">
					<button type="button" onclick="location.href='chat'">채팅</button>
				</div>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</main>
		
		
	 <script type="text/javascript">
      $(document).ready(function() {
         $("#open_room_btn").click(function() {
          $.get(
               "${pageContext.request.contextPath}/memo/start"
               , {
                  mno_to : 0
               }
               , function(data, status) {
                  if(data == 0){
                     alert("잠시 후 다시 시도해 주세요.");
                  } else {
                     window.location.href="${pageContext.request.contextPath}/memo/open_room?room_no="+data;
                      // location.href="${pageContext.request.contextPath}/memo/start?mno_to=8";
                  }
               }//call back functiion
         );//get

         });//click
      });//ready
      </script>   
   </body>
</html>