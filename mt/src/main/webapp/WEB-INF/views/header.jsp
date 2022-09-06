<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
	<div class="container text-right">
			<div class="text-right">
				<c:choose>
                        <c:when test="${login_info != null && login_info.mem_nick != null}">
                        ${login_info.mem_nick}
                           <a href="${pageContext.request.contextPath}/logout">
                        <button type="button">LOGOUT</button></a>
                        </c:when>
                        <c:otherwise>
                           <a href="${pageContext.request.contextPath}/login_form">
                           <button>LOGIN</button></a>
                           <a href="${pageContext.request.contextPath}/join_form">
                           <button>JOIN</button></a>
                        </c:otherwise>
                     </c:choose>
			</div>
			</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#header").mouseover(function() {
			$("#icon-bar").stop().slideDown(300);
		});
		$("#header").mouseout(function() {
			$("#icon-bar").stop().slideUp(300);
		});
	});
	</script>

<div id="header">
	<a href="${pageContext.request.contextPath}/">
		<img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
	</a>
	<div id="icon-bar">
		<div>
			<a href="${pageContext.request.contextPath}/travel">
				<img alt="travel" src="${pageContext.request.contextPath}/resources/img/plane.png">
			</a>
		</div>
		<div>
			<a href="#">
				<img alt="search" src="${pageContext.request.contextPath}/resources/img/search.png">
			</a>
		</div>
		<div>
			<a href="#">
				<img alt="mypage" src="${pageContext.request.contextPath}/resources/img/mypage.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/chat/chat_list">
				<img alt="chat" src="${pageContext.request.contextPath}/resources/img/chat.png">
			</a>
		</div>
	</div>
</div>
