<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/category_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="category-input">
				<form id="category_form">
					<div class="category-detail">
						<p>
							<label for="cate_name">카테고리 이름</label>
							<label for="cate_name" id="cate_name_label" class="write_label"></label>
						</p>
						<input type="text" id="cate_name" name="cate_name">
					</div>
					<div class="category-detail">
						<p>
							<label for="cate_startdate">여행 기간</label>
							<label for="cate_startdate" id="cate_date_label" class="write_label"></label>
						</p>
						<input type="date" id="cate_startdate" name="cate_startdate" onchange="limitdate(event)">
						~
						<input type="date" id="cate_enddate" name="cate_enddate">
					</div>
					<div class="category-detail">
						<p>여행 지역
							<label id="cate_region_label" class="write_label"></label>
						</p>
						<div id="category-region">
							
						</div>
					</div>
					<div class="category-detail">
						<p>
							이미지
							<label id="cate_photo_label" class="write_label"></label>
						</p>
						<input type="file" id="cate_photo" name="cate_photo">
					</div>
				</form>
				<button type="button" id="add_btn" name="add_btn">등록</button>
			</div>
		</main>
		<script type="text/javascript">
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/category/region",
					function(data, status) {
						$.each(JSON.parse(data), function(idx, dto) {
							$("#category-region").append("<label>" + 
									"	<input type='radio' name='region_no' value='" + dto.region_no + "'>" + 
									"	<div class='region-box'>" + 
									"		<img alt='" + dto.region_name + "' src='${pageContext.request.contextPath}/resources/img/" + dto.region_photoname + "' class='region-img'>" + 
									"		<p>" + dto.region_name + "</p>" + 
									"	</div>" + 
									"</label>"
							);
						});
					}
			);
		});
		function limitdate(e) {
			let startdate = e.target.value;
			document.getElementById("cate_enddate").setAttribute("min", startdate);
		}
		$(document).ready(function() {
			$("#add_btn").click(function() {
				if ($.trim($("#cate_name").val()) == "") {
					$("#cate_name_label").text("이름을 입력하세요.");
					return;
				} else {
					$("#cate_name_label").text("");
				}
				
				if ($("#cate_startdate").val() == "" || $("#cate_enddate").val() == "") {
					$("#cate_date_label").text("여행 기간을 선택해주세요.");
					return;
				} else {
					$("#cate_date_label").text("");
				}
				
				if ($("input:radio[name=region_no]:checked").val() == null) {
					$("#cate_region_label").text("지역을 선택하세요.");
					return;
				} else {
					$("#cate_region_label").text("");
				}
				
				let tmp1 = $("#cate_photo").val().substring($("#cate_photo").val().length-3);
				let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
									|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
				if( $.trim( $("#cate_photo").val() ) != "" && tmp1_boolean == false ){
					$("#cate_photo_label").text("jpg/jpeg/gif/png 파일만 허용 됩니다.");
					return;
				} else { $("#cate_photo_label").text(""); }
				
				let form = new FormData( document.getElementById("category_form"));
				let keys = form.keys();
				for(key of keys) console.log(key);
				
				let values = form.values();
				for(value of values) console.log(value);
				
				$.ajax({
					type : "POST", 
					encType : "multipart/form-data", 
					url : "${pageContext.request.contextPath}/category/insert", 
					data : form, 
					processData : false, 
					contentType : false, 
					cache : false, 
					success : function(result) {
						alert("카테고리가 생성되었습니다.");
						location.href = "${pageContext.request.contextPath}/category";
					}, 
					error : function(xhr) {
						alert("잠시 후 다시 시도해 주세요.");
					}
				});
			});
		});
		</script>
	</body>
</html>