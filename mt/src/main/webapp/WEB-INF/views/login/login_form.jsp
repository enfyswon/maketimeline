<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title> Login </title>
     
     <style type="text/css">
      h1 { 
      text-align : center; 
      }
      #buttons {
         text-align: right;
      }
      #join_btn {
         margin-right: 35%;
      }
      </style>
   </head>
   
   <body>
      <%@ include file="/WEB-INF/views/header.jsp" %>
      <br><br><br>
      <br><br><br>
      <br><br><br>
      
      <table class="table table-hover">
         <tbody>
				<tr>
					<td>
						<input type="text" id="email" name="email" maxlength="20" class="form-control" placeholder="이메일 주소">
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" id="mpwd" name="mpwd" maxlength="20" class="form-control" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td></td>
					<td id="buttons" >
						<button id="login_btn" type="button" class="btn btn-dark "> L O G I N </button>
						<a href="${pageContext.request.contextPath}/join">
						<button id="login_btn2" type="button" class="btn btn-dark "> J O I N </button>
						</a>
					</td>
				</tr>
				
			</tbody>
		</table>
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









