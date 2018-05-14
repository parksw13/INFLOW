<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#td {
	text-align: center;
}

#th {
	text-align: center;
	font-weight: bolder;
}
</style>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
<meta charset="UTF-8">
<title>INFLOW</title>
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>상세일정</h2>
			<div id="lorem">
				<table class="table table-bordered" id="lorem">
					<thead>
						<tr>
							<th id="th">일정 제목</th>
							<th id="th">일정 내용</th>
							<th id="th">시작 일정</th>
							<th id="th">종료 일정</th>
						</tr>
					</thead>
					<tr>
						<td id="td">${contents_view.c_title}</td>
						<td id="td">${contents_view.c_contents}</td>
						<td id="td"><fmt:parseDate var="start_d"
								value="${contents_view.c_start_date}" pattern="yyyy-MM-dd" /> <fmt:formatDate
								value="${start_d}" pattern="yyyy년 MM월 dd일" /></td>
						<td id="td"><fmt:parseDate var="end_d"
								value="${contents_view.c_end_date}" pattern="yyyy-MM-dd" /> <fmt:formatDate
								value="${end_d}" pattern="yyyy년 MM월 dd일" /></td>
					</tr>

				</table>
				<div id="popupfoot">
					<button type="button" onclick="history.back()" class="close agree">닫기</button>
				</div>
			</div>
		</div>
		<div
			style="width: 1478px; font-size: 32pt; color: white; height: 602px; display: none; opacity: 0.8;"
			id="mask"></div>
	</div>

</body>
</html>