<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> My Memo List </title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memo_style.css">
		
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<br><br><br><br>
		<br><br><br><br>
		<h1> My Memo List </h1>
		
			<table class="table table-hover">
				<c:forEach var="dto" items="${room_list}">
					<tr>
						<td>
							<h3 class="text-center">
									<button type="submit" class="btn_delete" value="${dto.room_no}"> 채팅방 삭제 </button>
								<a href="${pageContext.request.contextPath}/memo/open_room?room_no=${dto.room_no}"
									style="text-decoration:none;" class="text-dark">
									${dto.mno_from} &lt;=&gt; ${dto.mno_to} 
								</a>
							</h3>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div class="input-group">
         <div class="input-group-prepend">
         </div>
         <input class="bar_search" id="mno_to" name="mno_to">
         <div class="input-group-append">
            <button id="open_room_btn" type="button" class="btn btn-dark float-right">insert</button>
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
                        location.href="${pageContext.request.contextPath}/memo/open_room?room_no=mno";
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
	</body>
</html>
