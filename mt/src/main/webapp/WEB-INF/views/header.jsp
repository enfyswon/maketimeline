<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
	 <style>
         * {
         margin: 0 auto;
         padding: 0;
      }
      </style>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#header").mouseout(function() {
			$("#header-icon").stop().slideUp(300);
		});
		$("#header").mouseover(function() {
			$("#header-icon").css("visibility", "visible");
			$("#header-icon").stop().slideDown(300);
		});
	});
	</script>

<div id="header">
	<a href="${pageContext.request.contextPath}/" id="logo-link">
		<img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
	</a>
	<div id="header-icon">
		<div id="icon-bar">
			<div>
				<a href="${pageContext.request.contextPath}/category">
					<img alt="travel" src="${pageContext.request.contextPath}/resources/img/plane.png">
				</a>
			</div>
			<div>
				<a href="#">
					<img alt="search" src="${pageContext.request.contextPath}/resources/img/search.png">
				</a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/mypage/myprofile">
					<img alt="mypage" src="${pageContext.request.contextPath}/resources/img/mypage.png">
				</a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/memo/my_room_list">
					<img alt="chat" src="${pageContext.request.contextPath}/resources/img/chat.png">
				</a>
			</div>
		</div>
	</div>
</div>
							
						
						