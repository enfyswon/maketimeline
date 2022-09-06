<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>프로필 수정</title>
	</head>
	<script type="text/javascript">
		
			$("#submit").on("click", function(){
				if($("#mem_nick").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#mem_nick").focus();
					return false;
				}
				if($("#mem_desc").val()==""){
					alert("자기소개를 입력해주세요.");
					$("#mem_desc").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/mypage/myprofile_edit" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_nick">닉네임</label>
					<input class="form-control" type="text" id="mem_nick" name="mem_nick" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="mem_desc">소개</label>
					<input class="form-control" type="text" id="userName" name="mem_desc" value="${member.mem_desc}"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
				</div>
			</form>
		</section>
		
	</body>
	

</head>

</body>
</html>