<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memo_style.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.1/basic/ckeditor.js"></script>
		<style type="text/css">
		#ckd_div {
			float: right;
			width : 50%;
			height : 670px;
			overflow : auto;
		}
		#memo_header_div {
			float: right;
			width : 50%;
			height : 50px;
			border : 1px solid gray;
		}
		.form-control:focus {
		 backgroung-color:#77adea;
		}
		
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
		<div id="memo_header_div">
		<h3> 닉네임 : ${room_dto.mni_from} =&gt; ${room_dto.mni_to} </h3>
		</div>
		
		<iframe src="${pageContext.request.contextPath}/memo/chat_list?room_no=${room_dto.room_no}"
				name="chatList" width="80%" height="470px" frameborder="0" scrolling="no" class="mb-1"></iframe>
				<div id="ckd_div">
			<textarea id="cnts" name="cnts" class="form-control" style="height:100px; width:50px;"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('cnts');
			</script>
			<button id="chat_send_btn" class="btn btn-dark btn-sm float-right"> 글 전 송 </button>
		</div>
		</main>

	

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












