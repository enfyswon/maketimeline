<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>list</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic_style.css" />
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<br><br><br><br><br><br>
		<br><br><br>
		<div class="row">
		<h1 style="text-align:center;"> list </h1>
		<br><br><br><br><br><br>
							<div>
					  		<!-- list start -->
									<div class="col-8">
										<div class="text center">
													<div class="text-center">	
										<h1 style="text-align:center;" font-family:Georgia;"> list </h1>
									<br><br><br>
									<br><br><br>
									
									</div>
									
										</div>
											<table class="table table-hover">
													<tbody>
																	<tr>
																		<td><h5 style="color:gray;"> 지출 번호  :  ${dto.money_no} </h5></td>	
																	</tr>
																	<tr>
																	<td> <h5 style="color:gray;"> 숙박비  : ${dto.stay}</h5></td>	
																	</tr>
																	<tr>
																		<td><h5 style="color:gray;"> 교통비  :  ${dto.meal}</h5></td>	
																	</tr>
																	<tr>
																	<td><h5 style="color:gray;"> 입장료  : ${dto.traffic} </h5></td>
																	</tr>
																	<tr>
																		<td><h5 style="color:gray;"> 기타 : ${dto.etc}</h5></td>    
																	</tr>
																	
													</tbody>
											</table>
									</div>
								</div>
													<div class="text-center">
														<a href="${pageContext.request.contextPath}/money/??${dto.money_no}">
														<button class="btn btn-dark"> 수정  </button>
														</a>
														
														
														
													</div>
												<!-- list end -->
												</div><!-- row -->
												<br><br><br>
												<br><br><br>
												<hr>
											
											</body>
										</html>
