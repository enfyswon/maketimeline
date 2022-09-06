<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
<div class="container" align="center">
			<div class="text-right">
				<c:choose>
					<c:when test="${login_info != null && login_info.mid != null}">
					${login_info.mid}
						<div class="btn-group">
							<a href="${pageContext.request.contextPath}/logout">
								<button type="button" class="btn btn-link btn-sm">LOGOUT</button>
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="btn-group">
							<a href="${pageContext.request.contextPath}/login_form">
								<button type="button" class="btn btn-link btn-sm">LOGIN</button>
							</a>
							<a href="${pageContext.request.contextPath}/join/form">
								<button type="button" class="btn btn-link btn-sm">JOIN</button>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
				<!-- Links -->
				<ul class="navbar-nav">

					<!-- Dropdown -->
				
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" href="${pageContext.request.contextPath}/chat/chat_list">
							채팅
						</a>
						</ul>
			</nav>
			</div>
			
<div id="top">
	<a class="navbar-brand" href="${pageContext.request.contextPath}/">
	<img alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
	</div>
	
	</div>
	

