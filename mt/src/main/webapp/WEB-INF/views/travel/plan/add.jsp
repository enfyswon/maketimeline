<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>detail plan</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<form id="plan_form">
			<div id="detailplan-input">
				<input type="hidden" id="cate_no" value="${cate_no}">
				<div class="detailplan-detail">
					<p>
						<label for="plan_name" id="plan_name_label" class="write_label" ></label>
					</p>
						<input type="text" id="plan_name" name="plan_name" placeholder="여행 장소">
					</div>
					<div class="detailplan-detail">
						<p>
							<label for="plan_desc" id="plan_desc_label" class="write_label" ></label>
						</p>
							<input type="text" id="plan_desc" name="plan_desc" placeholder="세부 설명">
					</div>
					<div class="detailplan-detail">
						<p>
							<label id="plan_amount_label" class="write_label"></label>
						</p>
							<input type="text" id="plan_amount" name="plan_amount" placeholder="예상 지출 금액">	
					</div>
				<button type="button" id="add_btn" name="add_btn">등록</button>
			</div>
			</form>
		</main>
		
		<script type="text/javascript">
		$(document).ready(function() {
			$("#add_btn").click(function() {
				if ($.trim($("#plan_name").val()) == "") {
					$("#plan_name_label").text("여행 장소를 입력하세요.");
					return;
				} else {
					$("#plan_name_label").text("");
				}
				
				if ($("#plan_desc").val() == "") {
					$("#plan_desc_label").text("세부 설명을 입력하세요.");
					return;
				} else {
					$("#plan_desc_label").text("");
				}
				
				if ($("#plan_amount").val() == "") {
					$("#plan_amount_label").text("예상 지출 금액을 입력하세요.");
					return;
				} else {
					$("#plan_amount_label").text("");}

				let form = new FormData( document.getElementById("plan_form"));
				
				let cate_no = $("#cate_no").val();
				form.append('cate_no', cate_no);
				
				let keys = form.keys();
				for(key of keys) console.log(key);
				
				let values = form.values();
				for(value of values) console.log(value);

				$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/plan/insert"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("여행계획일정이 등록 되었습니다.");
						location.href="${pageContext.request.contextPath}/plan/add?plan_no=${plan.money_no}";
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