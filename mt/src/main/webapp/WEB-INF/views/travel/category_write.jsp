<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Make Timeline</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/travel_style.css">
	</head>
<style>
#category-input {
	width: 80%;
	text-align: center;
}
.category-detail {
	width: 80%;
	margin: 10px auto;
}
.category-detail > p {
	width: 80%;
	text-align: left;
	margin-bottom: 5px;
}
.category-detail > input {
	padding: 8px;
	width: 75%;
	font-size: medium;
	margin-bottom: 5px;
}
.category-detail > input[type="date"] {
	width: 35%;
}
#category-region {
	width: 80%;
	display: flex;
	flex-direction: row;
	overflow: auto;
}
#category-region::-webkit-scrollbar {
	width: 5px;
}
#category-region::-webkit-scrollbar-thumb {
	height: 30%;
	background: #217AF4;
	border-radius: 10px;
}
#category-region::-webkit-scrollbar-track {
	background: rgba(33, 122, 244, 0.1);
	border-radius: 10px;
}
.region-box {
	width: 130px;
	margin: 5px 5px;
}
.region-img {
	width: 120px;
}
input[type="radio"] {
	visibility: hidden;
}
input[type="radio"]:checked + div {
	border: 1px solid black;
	border-radius: 5px;
}
</style>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="category-input">
				<div class="category-detail">
					<p>
						<label for="cate_name">카테고리 이름</label>
						<label for="cate_name" id="cate_name_label" class="write_label"></label><br>
					</p>
					<input type="text" id="cate_name">
				</div>
				<div class="category-detail">
					<p>
						<label for="cate_startdate">여행 기간</label><br>
					</p>
					<input type="date" id="cate_startdate" onchange="limitdate(event)">
					~
					<input type="date" id="cate_enddate">
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
					<input type="file" id="cate_photo">
				</div>
				<button type="button" id="add_btn">등록</button>
			</div>
		</main>
		<script type="text/javascript">
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/travel/region",
					function(data, status) {
						$.each(JSON.parse(data), function(idx, dto) {
							$("#category-region").append("<label>" + 
									"	<input type='radio' name='region' value='" + dto.region_no + "'>" + 
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
				
				if ($("input:radio[name=region]:checked").val() == null) {
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
			});
		});
		</script>
	</body>
</html>