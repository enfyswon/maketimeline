<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<script src="https://cdn.ckeditor.com/4.19.1/standard-all/ckeditor.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memo_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="memo-box">
				<div id="memo-list-box">
					<div id="memo-room-title">
						<p>메시지 내역</p>
					</div>
					<div id="memo-room-search">
						<input id="mno_to" name="mno_to" type="text" placeholder="검색">
				        <button id="open_room_btn" type="button">생성</button>
				        <a href="${pageContext.request.contextPath}/memo/open_room?room_no=${dto.room_no}"></a>
					</div>
					<div id="room-list">
					</div>
				</div>
				<div id="memo-cnts-box">
					<div id="memo-cnts-title">
						<p id="cnts-title"></p>
					</div>
					<div id="memo-cnts">
					</div>
				</div>
			</div>
		</main>
		
		<script type="text/javascript">
		const roomList = function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/memo/my_room_list", 
				method: "get",
				data : {},
				success: function(data) {
					$("#room-list").html(data);
					
					$(".room").on('click', function() {
						let roomno = $(this).val();
						let mno = $(this).attr('mno');
						let mni = $(this).attr('mni');

						$(".room-box").not(".room-box.room-box" + roomno).removeClass("active-room");
						$(".room-box" + roomno).addClass("active-room");
						
						chatList(roomno, mni, mno);
					});
				}
			});
		}
		
		const chatList = function(roomno, mni, mno) {
			$.ajax({
				url: "${pageContext.request.contextPath}/memo/chat_list",
				method: 'get',
				data: {
					room_no: roomno,
					other_mno: mno
				},
				success: function(data) {
					$("#cnts-title").text(mni);
					$("#memo-cnts").html(data);
					$("#memo-cnts-list").scrollTop($("#memo-cnts-list")[0].scrollHeight);
					
					$("#chat_send_btn").click(function() {
						sendChat(roomno, mni, mno)
					});//click
					roomList();
				}
			});
		}
		
		const sendChat = function(roomno, mni, mno) {
			let chat = CKEDITOR.instances.cnts.getData();

			if( chat == '' ){
				alert("내용을 입력해 주세요.");
				return;
			}

			$.post(
					"${pageContext.request.contextPath}/memo/insert"
					, {
						room_no : roomno
						, mno_ins : "${login_info.mno}"
						, mno_read : mno
						, chat : chat
					}
					, function(data, status) {
						if(data >= 1){
							CKEDITOR.instances.cnts.setData("");
							chatList(roomno, mni, mno);
							roomList();
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back functiion
			);//post
		}
		$(document).ready(function() {
			roomList();
		});
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
                        	//location.href="${pageContext.request.contextPath}/memo/open_room?room_no="+data;
                     	} else if(data <= 0){
                        	alert("쪽지방 만들기가 실패 하였습니다.");
                     	} else {
                        	alert("잠시 후 다시 시도해 주세요.");
                     	}
                  	}//call back function
            	);//get
      	});//click
      });//ready
      </script>
	</body>
</html>