<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="refresh" content="30">
		<title> Chat List </title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memo_style.css">
		<script src="//cdn.ckeditor.com/4.19.1/basic/ckeditor.js"></script>
		<style type="text/css">
		#chat_list_div {
			width : 100%;
			height : 470px;
			border : 1px solid gray;
			overflow : auto;
		}
		</style>
	</head>
	<body>


		<div id="chat_list_div">
			<c:forEach var="dto" items="${chat_list}">
				<c:choose>
					<c:when test="${dto.mno_ins == login_info.mno}">
						<div class="clearfix mt-3 mb-3 mr-5">
							<div class="w-25 float-right">
								${dto.chat_date}
								<div class="card w-100">
									<div class="card-header">${dto.mno_ins}</div>
									<div class="card-body">${dto.chat}</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="mt-3 mb-3 ml-5">
							${dto.chat_date}
							<div class="card w-25">
								<div class="card-header">${dto.mno_ins}</div>
								<div class="card-body">${dto.chat}</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	
	
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#chat_list_div").scrollTop($("#chat_list_div")[0].scrollHeight);
	});//ready
	function pageReload() {
		alert();
		window.location.reload();
	}
	</script>
	
	</body>
</html>
