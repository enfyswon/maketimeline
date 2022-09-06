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
						<label for="cate_name">카테고리 이름</label><br>
					</p>
					<input type="text" id="cate_name">
				</div>
				<div class="category-detail">
					<p>
						<label for="cate_startdate">여행 기간</label><br>
					</p>
					<input type="date" id="cate_startdate">
					~
					<input type="date" id="cate_enddate">
				</div>
				<div class="category-detail">
					<p>여행 지역</p>
					<div id="category-region">
						<label>
							<input type="radio" name="region">
							<div class="region-box">
								<img alt="서울" src="${pageContext.request.contextPath}/resources/img/seoul.png" class="region-img">
								<p>서울</p>
							</div>
						</label>
						<label>
							<input type="radio" name="region">
							<div class="region-box">
								<img alt="경기/인천" src="${pageContext.request.contextPath}/resources/img/gyeonggi.png" class="region-img">
								<p>경기/인천</p>
							</div>
						</label>
						<label>
							<input type="radio" name="region">
							<div class="region-box">
								<img alt="강원" src="${pageContext.request.contextPath}/resources/img/gangwon.png" class="region-img">
								<p>강원</p>
							</div>
						</label>
						<label>
							<input type="radio" name="region">
							<div class="region-box">
								<img alt="대전/충청" src="${pageContext.request.contextPath}/resources/img/chungcheong.png" class="region-img">
								<p>대전/충청</p>
							</div>
						</label>
						<label>
							<input type="radio" name="region">
							<div class="region-box">
								<img alt="광주/전라" src="${pageContext.request.contextPath}/resources/img/jeolla.png" class="region-img">
								<p>광주/전라</p>
							</div>
						</label>
						<label>
							<input type="radio" name="region">
							<div class="region-box">
								<img alt="경상/대구" src="${pageContext.request.contextPath}/resources/img/gyeongsang.png" class="region-img">
								<p>경상/대구</p>
							</div>
						</label>
						<label>
							<input type="radio" name="region">
							<div class="region-box">
								<img alt="부산/울산" src="${pageContext.request.contextPath}/resources/img/pusan.png" class="region-img">
								<p>부산/울산</p>
							</div>
						</label>
						<label>
							<input type="radio" name="region">
							<div class="region-box">
								<img alt="제주" src="${pageContext.request.contextPath}/resources/img/jeju.png" class="region-img">
								<p>제주</p>
							</div>
						</label>
					</div>
				</div>
				<div class="category-detail">
					<input type="file">
				</div>
				<button type="button">등록</button>
			</div>
		</main>
	</body>
</html>