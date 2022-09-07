<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
	</head>
	<body>
		<div id="header">
			<a href="${pageContext.request.contextPath}/">
				<img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
			</a>
		</div>
		<main>
		
		<div>
		<c:choose>
                        <c:when test="${login_info != null && login_info.email != null}">
                        ${login_info.email}
                           <a href="${pageContext.request.contextPath}/login/logout">
                        <button type="button">LOGOUT</button></a>
                        </c:when>
                        <c:otherwise>
                           <a href="${pageContext.request.contextPath}/login/">
                           <button>LOGIN</button></a>
                           <a href="${pageContext.request.contextPath}/join/">
                           <button>JOIN</button></a>
                        </c:otherwise>
                     </c:choose>
        </div>  
              
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
					<a href="${pageContext.request.contextPath}/mypage/list">
						<img alt="mypage" src="${pageContext.request.contextPath}/resources/img/mypage.png">
					</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/memo/my_room_list">
						<img alt="chat" src="${pageContext.request.contextPath}/resources/img/chat.png">
					</a>
				</div>
			</div>
			
			<div class="text-center">
													
			</div>
						 <!-- container start -->
						<div class="container width=100px align-center">
										<img src="${pageContext.request.contextPath}/resources/img/pic2.jpg" alt="" />
									</div >
						<!-- container end -->
		</main>
	</body>
</html>