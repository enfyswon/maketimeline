<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 조회  </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<form id="plan_form">
			<h3> 정산  </h3>
			<div id="detailplan-input">
				<input type="hidden" id="money_no" value="${money_no}">
				<div class="detailplan-detail">
					<p>
						<label for="money_name" id="money_name_label" class="write_label" ></label>
					</p>
						<input type="text" id="money_name" name="money_name" placeholder="지출 제목">
					</div>
					</div>
					<table class="table table-hover">
						<tbody>
							<tr>
								<th> 지출 조회 </th>
								<td>
									<select id="value_no" name="value_no">
										<option value="5">선택하세요</option>
									</select>
								</td>
							</tr>
							
						</tbody>
					</table>
					<button type="button" id="add_btn" name="add_btn">등록</button>
					</form>
					</main>
					<script type="text/javascript">
					$(document).ready(function() {
						$("#value_no").change(function() { 
							alert( $("#value_no").val() );
							$.get(
									"${pageContext.request.contextPath}/test/gugun"
									, { value_name : $("#value_name").val() }
									, function(data, status) { //alert(data);
										$("#value_name").empty();
										$("#value_name").append("<option value='5'>선택하세요</option>");
										$.each(JSON.parse(data), function(idx, dto) {
											$("#value_name").append("<option value='" + dto.value_no + "'>" + dto.value_name + "</option>");
										});//each
									}//call back function
							);//get
						});//change
					});//ready
					</script>
					<script type="text/javascript">
						$(document).ready(function() {
							$("#add_btn").click(function() {
								if ($.trim($("#money_name").val()) == "") {
									$("#money_name_label").text("여행 장소를 입력하세요.");
									return;
								} else {
									$("#money_name_label").text("");
								}
								
								
								let form = new FormData( document.getElementById("money_form"));
								
								let money_no = $("#money_no").val();
								form.append('money_no', money_no);
								
								let keys = form.keys();
								for(key of keys) console.log(key);
								
								let values = form.values();
								for(value of values) console.log(value);
				
								$.ajax({
									type : "POST"
									, encType : "multipart/form-data"
									, url : "${pageContext.request.contextPath}/money/insert"
									, data : form
									, processData : false
									, contentType : false
									, cache : false
									, success : function(result) {
										alert("여행계획일정이 등록 되었습니다.");
										location.href="${pageContext.request.contextPath}/money/add?money_no=${dto.money_no}";
									}//call back function
									, error : function(xhr) {
										alert("잠시 후 다시 시도해 주세요.");
									}//call back function//xhr : xml http request/response
							});//ajax
						});
						});
						</script>
	</body>
</html>





