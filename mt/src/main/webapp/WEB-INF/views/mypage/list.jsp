<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>My Page</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic_style.css" />
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<br><br><br><br><br><br>
		<br><br><br>
		<div class="row">
		<h1 style="text-align:center;"> M Y P A G E </h1>
		<br><br><br><br><br><br>
							<div>
					  		<!-- 회원 정보 start -->
									<div class="col-8">
										<div class="text center">
													<div class="text-center">	
										<h1 style="text-align:center;" font-family:Georgia;"> 회원정보 </h1>
									<br><br><br>
									<br><br><br>
									
									</div>
									
										</div>
											<table class="table table-hover">
													<tbody>
																	<tr>
																		<td><h5 style="color:gray;"> 회원 번호  :  ${dto.mno} </h5></td>	
																	</tr>
																	<tr>
																	<td> <h5 style="color:gray;">회원 아이디  : ${dto.mni}</h5></td>	
																	</tr>
																	<tr>
																		<td><h5 style="color:gray;"> 비 밀 번 호  :  ${login_info.mpwd}</h5></td>	
																	</tr>
																	<tr>
																	<td><h5 style="color:gray;"> 전 화 번 호  : ${dto.tel} </h5></td>
																	</tr>
																	<tr>
																		<td><h5 style="color:gray;"> email : ${dto.email}</h5></td>    
																	</tr>
																	<tr>
																	<td> <h5 style="color:gray;">이미지  : ${dto.mpho}</h5></td>
																	</tr>
													</tbody>
											</table>
									</div>
								</div>
													<div class="text-center">
														<a href="${pageContext.request.contextPath}/mypage/update_form?mno=${login_info.mno}">
														<button class="btn btn-dark"> 회원 정보 수정  </button>
														</a>
														
														<button class="dropdown-item memo_to_mni btn btn-link" id="${dto.mno}">
																문의하기
														</button>
														
													</div>
												<!-- 회원 정보 end -->
												</div><!-- row -->
												<br><br><br>
												<br><br><br>
												<hr>
											<!-- 채팅방으로 들어가기 start -->
											<script type="text/javascript">
												$(document).ready(function() {
													$(".memo_to_mni").click(function() {
														$.get(
																"${pageContext.request.contextPath}/memo/start"
																, {
																	mno_to : $(this).attr("mni")
																}
																, function(data, status) {
																	if(data == 0){
																		alert("잠시 후 다시 시도해 주세요.");
																	} else {
																		window.location.href="${pageContext.request.contextPath}/memo/open_room?room_no="+data;
																	}
																}//call back functiion
														);//get
											
													});//click
											
												});//ready
												</script>
											<!-- 채팅방으로 들어가기 end -->
											</body>
										</html>
