<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>INFLOW</title>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
<style type="text/css">
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
</style>
<script>
	function formSubmit() {
		document.getElementById("frm1").submit();
	}
</script>
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>재고관리</h2>
			<div id="lorem">
				<form action="search" method="get" id="frm1">
					<p id="p">제품 이름</p>
					<input type="text" name="search" />
					<button class="button" onclick="formSubmit(); return false;">검색</button>
				</form>
				<!-- <form action="" id="setRows"></form> -->
				<table class="table table-bordered" id="lorem">
					<thead>
						<tr>
							<th id="th">교보재 코드</th>
							<th id="th">입고일</th>
							<th id="th">구분</th>
							<th id="th">제품 이름</th>
							<th id="th">현 재고</th>
							<th id="th">총 수량</th>
							<th id="th">물품사진</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="resourcesbean" items="${resources_list}">
							<tr>
								<td id="td">${resourcesbean.code}</td>
								<td id="td"><fmt:parseDate var="date"
										value="${resourcesbean.b_day}" pattern="yyyy-MM-dd" /> <fmt:formatDate
										value="${date}" pattern="yyyy년 MM월 dd일" /></td>
								<td id="td">${resourcesbean.division}</td>
								<td id="td"><a
									href="resources_content_view?code=${resourcesbean.code}">${resourcesbean.r_name}</a></td>
								<td id="td">${resourcesbean.stock}</td>
								<td id="td">${resourcesbean.max_stock}</td>
								<td id="td"><img style="width: 70; height: 70;"
									src="resources/upload/${resourcesbean.r_file}" /></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<c:if test="${login_users.grade eq 'A'}">
					<button type="button"
						onclick="location.href='resources_write_view'">제품등록</button>
				</c:if>
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
