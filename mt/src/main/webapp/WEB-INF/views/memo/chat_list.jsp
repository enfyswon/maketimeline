<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="memo-cnts-list">
<c:forEach var="dto" items="${chat_list}">
	<c:choose>
		<c:when test="${dto.mno_ins == login_info.mno}">
			<div class="outgoing-memo">
				<div class="memo-chat">
					<div class="chat-cnts">${dto.chat}</div>
					<p class="chat-date">${dto.chat_date}</p>
				</div>
				<div class="memo-profile">
				<c:choose>
					<c:when test="${login_info.mpho_path != null && login_info.mni_from != ''}">
					<img alt="profile_photo" src="${login_info.mpho_path}">
					</c:when>
					<c:otherwise>
					<img alt="profile_photo" src="${pageContext.request.contextPath}/resources/img/user.png">
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="receive-memo">
				<div class="memo-profile">
				<c:choose>
					<c:when test="${login_info.mpho_path != null && login_info.mni_from != ''}">
					<img alt="profile_photo" src="${login_info.mpho_path}">
					</c:when>
					<c:otherwise>
					<img alt="profile_photo" src="${pageContext.request.contextPath}/resources/img/user.png">
					</c:otherwise>
				</c:choose>
				</div>
				<div class="memo-chat">
					<div class="chat-cnts">${dto.chat}</div>
					<p class="chat-date">${dto.chat_date}</p>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>
<div id="send-box">
	<div id="editor">
		<textarea id="cnts" name="cnts"></textarea>
		<script type="text/javascript">
			CKEDITOR.inline('cnts');
		</script>
	</div>
	<button type="button" id="chat_send_btn">전송</button>
</div>
	<script type="text/javascript">
	$(document).ready(function() {

	});//ready
	function pageReload() {
		alert();
		window.location.reload();
	}
	
	</script>

	</body>
</html>
