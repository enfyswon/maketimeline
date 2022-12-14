<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="dto" items="${room_list}">
<div class="room-box room-box${dto.room_no}">
	<button type="button" class="room" value="${dto.room_no}" mno="${dto.other_mno}" mni="${dto.other_mni}">
		<div class="room-info">
			<div class="room-img">	
			<c:choose>
				<c:when test="${dto.mpho_path != null}">
				<img id="profile" alt="profile_photo" src="${dto.mpho_path}">
				</c:when>
				<c:otherwise>
				<img id="defaultImg" src="${pageContext.request.contextPath}/resources/img/user.png">
				</c:otherwise>
			</c:choose>  
			</div>
			<div class="room-cnts">
				<p class="room-cnts-to">${dto.other_mni}</p>
				<div class="room-cnts-chat">${dto.chat}</div>
			</div>
			<c:if test="${dto.unread > 0}">
			<div class="room-cnts-unread room-cnts-unread${dto.room_no}">
				<span>${dto.unread}</span>
			</div>
			</c:if>
		</div>
	</button>
</div>
</c:forEach>
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
