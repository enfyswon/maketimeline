<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memo_style.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.1/basic/ckeditor.js"></script>
		<title> My Memo List </title>
		
		<style>
.left-box {
  float: left;
  width: 50%;
}
.right-box {
  float: right;
  

}
.center-box {
  float: center;
  width: 50%;
  margin-top: 30px;
}
h1{
 text-align: center;
 margin-top: 30px;
}
#insert{
 text-align: center;
}
</style>

	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		
		<br><br>
		<h1 class="text-center"> My Memo List </h1>
		<br>
         <div id="insert">
         <input class="bar_search" id="mno_to" name="mno_to">
         
            <button id="open_room_btn" type="button" class="btn btn-dark float-right">insert</button>
            <a href="${pageContext.request.contextPath}/memo/open_room?room_no=${dto.room_no}"
									style="text-decoration:none;" class="text-dark">
									
								</a>
         
         </div>
		<br><br>
		<div class="center-box">
		<div class='left-box' >

			<div class="input-group">
         <div class="input-group-prepend">
			<table class="table table-hover" class="mt-3 mb-3 ml-5">
				<c:forEach var="dto" items="${room_list}">
				<br>
					<tr>
						<td>
							<h5 class="text-left">
									<button type="submit" class="btn_delete" value="${dto.room_no}"> 채팅방 삭제 </button>
								<a href="${pageContext.request.contextPath}/memo/my_room_list2?room_no=${dto.room_no}"
									style="text-decoration:none;" class="text-dark">
									${dto.room_no} : ${dto.mni_from} &lt;=&gt; ${dto.mni_to} 
								</a>
							</h5>
						</td>
					</tr>
				</c:forEach>
			</table>
         </div>
      </div>
      </div>
      <div class='right-box'>
		<div id="memo_header_div">
		<h5> 닉네임 : ${room_dto.mni_from} =&gt; ${room_dto.mni_to} </h5>
		</div>
		<br><br>
		<iframe src="${pageContext.request.contextPath}/memo/chat_list?room_no=${room_dto.room_no}"
				name="chatList" width="100%" height="470px" frameborder="0" scrolling="no" class="mb-1"></iframe>
				<div id="ckd_div">
			<textarea id="cnts" name="cnts" class="form-control" style="height:100px; width:50px;"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('cnts');
			</script>
			<button id="chat_send_btn" class="btn btn-dark btn-sm float-right"> 글 전 송 </button>
			
		</div>
		</div>
		</div>
		
		
      <script type="text/javascript">
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
                        location.href="${pageContext.request.contextPath}/memo/open_room?room_no="+data;
                     } else if(data <= 0){
                        alert("쪽지방 만들기가 실패 하였습니다.");
                     } else {
                        alert("잠시 후 다시 시도해 주세요.");
                     }
                  }//call back function
            );//post
         });//click
      });//ready
      </script>
      <script type="text/javascript">
      $(document).ready(function() {
         $(".btn_delete").click(function() {
            $.post(
                  "${pageContext.request.contextPath}/memo/delete"
                  , {
                     room_no : $(this).val()
                  }
                  , function(data, status) {
                     if( data >= 1 ){
                        alert("채팅방이 삭제 되었습니다.");
                        location.href="${pageContext.request.contextPath}/memo/my_room_list";
                     } else if( data <= 0 ) {
                        alert("채팅방이 삭제를 실패 하였습니다.");
                     } else {
                        alert("잠시 후 다시 시도해 주세요.");
                     }
                  }//call back function
            );//get
         });//click
      });//ready
      </script>
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
