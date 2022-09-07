<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> ChatRoom </title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memo_style.css">
		<script src="//cdn.ckeditor.com/4.19.1/basic/ckeditor.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<br><br><br><br><br>
		<h3> ChatRoom : ${room_dto.mno_from} &lt;=&gt; ${room_dto.mno_to} </h3>
		
		<hr>
		<iframe src="${pageContext.request.contextPath}/memo/chat_list?room_no=${room_dto.room_no}"
				name="chatList" width="100%" height="600px" frameborder="0" scrolling="no" class="mb-1"></iframe>
		
		
		<div>
			<textarea id="cnts" name="cnts" class="form-control" style="height:100px;"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('cnts');
			</script>
		<hr>
		<hr>
			<button id="chat_send_btn" class="btn btn-primary btn-block float-right"> 글 전 송 </button>
		</div>
		

	<script type="text/javascript">
	$(document).ready(function() {

		$("#chat_send_btn").click(function() {

			let chat = CKEDITOR.instances.cnts.getData();

			if( chat == '' ){
				alert("내용을 입력해 주세요.");
				return;
			}

			$.post(
					"${pageContext.request.contextPath}/memo/insert"
					, {
						room_no : "${room_dto.room_no}"
						, mno_ins : "${room_dto.mno_from}"
						, mno_read : "${room_dto.mno_to}"
						, chat : chat
					}
					, function(data, status) {
						if(data >= 1){
							CKEDITOR.instances.cnts.setData("");
							chatList.pageReload();
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back functiion
			);//post

		});//click

	});//ready
	</script>

	</body>
</html>












