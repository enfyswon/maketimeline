<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Make Timeline</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member-style.css"> 
   </head>
    <body>
    <%@ include file="/WEB-INF/views/header.jsp" %>
		<main id="login-main">
			<div id="img-box">
				<img alt="login-pic" src="${pageContext.request.contextPath}/resources/img/login-pic.png">
			</div>
			<div id="login-box">
				<div class="login-input">
					<input type="text" id="email" name="email" maxlength="30" placeholder="이메일 주소">
				</div>
				<div class="login-input">
					<input type="password" id="mpwd" name="mpwd" maxlength="20" placeholder="비밀번호">
				</div>
				<div class="login-input">
					<button id="login_btn" type="button" class="btn btn-dark "> L O G I N </button>
				</div>
			</div>
		</main>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#login_btn").click(function() {

			$.post(
					"${pageContext.request.contextPath}/login/"
					, {
						email : $("#email").val()
						, mpwd : $("#mpwd").val()
					}
					, function(data, status) {
						if(data == 0){
							alert("아이디와 패스워드가 올바르지 않습니다.");
						} else if(data == 1){
							location.href = "${pageContext.request.contextPath}/";
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









