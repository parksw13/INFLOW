<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록보기</title>
<style>
a.button {
	-webkit-appearance: button;
	-moz-appearance: button;
	appearance: button;
}

input.submitLink {
	background-color: transparent;
	text-decoration: underline;
	border: none;
	cursor: pointer;
}

#td {
	text-align: center;
	vertical-align: middle;
}

#th {
	text-align: center;
	font-weight: bolder;
}

#p {
	font-size: 30px;
}

#usersimg {
	width: 70px;
	height: 70px;
}
</style>
<script>
	function formSubmit() {
		document.getElementById("frm1").submit();
	}
</script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />

</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none; width: 1500px"
			id="dialog" class="window">
			<h2>회원목록</h2>
			<div id="lorem">
				<form id="frm1" action="usersearch" method="get">
					<span style="font-weight: bolder;"> 사용자 :</span> <input
						style="width: 120px" type=text name="usersearch">
					<button class="button" onclick="formSubmit()">검색</button>
				</form>
				<table class="table table-bordered" id="lorem">
					<thead>
						<tr>
							<th id="th">사진</th>
							<th id="th">아이디</th>
							<th id="th">이름</th>
							<th id="th">주소</th>
							<th id="th">주민등록번호</th>
							<th id="th">연락처</th>
							<th id="th">등급</th>
							<th id="th">이메일</th>
							<th id="th">클래스</th>
							<th id="th">회원삭제</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="ul" items="${users_list}">
							<tr>
								<td><img id="usersimg"
									src="resources/upload/${ul.profile_img}"></td>
								<td id="td">${ul.id}</td>
								<td id="td">${ul.name}</td>
								<td id="td">${ul.addr}</td>
								<td id="td">${ul.num}</td>
								<td id="td">${ul.tel}</td>
								<td id="td">${ul.grade}</td>
								<td id="td">${ul.email}</td>
								<td id="td">${ul.class_name}</td>
								<td id="td"><c:if test="${ul.grade ne 'A'}">
										<a href="users_delete?id=${ul.id}">회원삭제</a>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="nav">
					<a href="#" rel="0" class="active">1</a>
				</div>
				<div id="popupfoot">
					<button type="button" onclick="location.href='main'"
						class="close agree">닫기</button>
				</div>
			</div>
		</div>
		<div
			style="width: 1478px; font-size: 32pt; color: white; height: 602px; display: none; opacity: 0.8;"
			id="mask"></div>
	</div>
	<!-- 페이징 스크립트 -->
	<script
		src="//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/main2.js"></script>


</body>
</html>