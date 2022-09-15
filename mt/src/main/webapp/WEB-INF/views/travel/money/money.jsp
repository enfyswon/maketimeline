+<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>write money</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
	</head>
	<body>
	
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<main>
			<form id="money_form">
			<div id="detailplan-input">
				<div class="detailplan-detail">
				<iframe src="${pageContext.request.contextPath}/calendar/main"
				name="calendar" width="100%" height="500px" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0>></iframe>
				</div>
				
				<div class="detailplan-detail">
					<p>
						<label for="money_no" id="money_no_label" class="write_label" ></label>
					</p>
						<input type="text" id="money_no" name="money_no" placeholder="지출 내역">
					</div>
					<div class="detailplan-detail">
						<p>
							<label for="stay" id="stay_label" class="write_label" ></label>
						</p>
							<input type="text" id="stay" name="stay" placeholder="숙박비">
					</div>
					<div class="detailplan-detail">
						<p>
							<label id="meals_label" class="write_label"></label>
						</p>
							<input type="text" id="meals" name="meals" placeholder="식비">	
					</div>
					<div class="detailplan-detail">
						<p>
							<label id="traffic_label" class="write_label"></label>
						</p>
							<input type="text" id="traffic" name="traffic" placeholder="교통비">	
					</div>
					<div class="detailplan-detail">
						<p>
							<label id="admission_label" class="write_label"></label>
						</p>
							<input type="text" id="admission" name="admission" placeholder="입장료">	
					</div>
					<div class="detailplan-detail">
						<p>
							<label id="etc_label" class="write_label"></label>
						</p>
							<input type="text" id="etc" name="etc" placeholder="기타">	
					</div>
					<div class="detailplan-detail">
						<p>
							<label id="plan_no_label" class="write_label"></label>
						</p>
							<input type="text" id="plan_no" name="plan_no" placeholder="계획번호">	
					</div>
					<button type="button" id="add_btn" name="add_btn">등록</button>
			</div>
			</form>
			
		</main>
		<br><br><br>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#add_btn").click(function() {
				if ($.trim($("#money_no").val()) == "") {
					$("#money_no_label").text("지출 제목을 입력하세요");
					return;
				} else {
					$("#money_no_label").text("");
				}
				
				if ($("#stay").val() == "") {
					$("#stay_label").text("숙박비를 입력하세요.");
					return;
				} else {
					$("#stay_label").text("");
				}
				
				if ($("#meals").val() == "") {
					$("#meals_label").text("식비를 입력하세요.");
					return;
				} else {
					$("#meals_label").text("");
					}
				
				if ($("#traffic").val() == "") {
					$("#traffic_label").text("교통비를 입력하세요.");
					return;
				} else {
					$("#traffic_label").text("");
					}
				if ($("#admission").val() == "") {
					$("#admission_label").text("입장료를 입력하세요.");
					return;
				} else {
					$("#admission_label").text("");
					}
				if ($("#etc").val() == "") {
					$("#etc_label").text("기타금액을 입력하세요.");
					return;
				} else {
					$("#etc_label").text("");
					}
				if ($("#plan_no").val() == "") {
					$("#plan_no_label").text("계획번호을 입력하세요.");
					return;
				} else {
					$("#plan_no_label").text("");
					}
				

				let form = new FormData( document.getElementById("money_form"));
				
				let plan_no = $("#plan_no").val();
				form.append('plan_no', plan_no);
				
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
						alert("지출경비가 등록 되었습니다.");
						location.href="${pageContext.request.contextPath}/money/add?plan_no=${plan.money_no}";
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