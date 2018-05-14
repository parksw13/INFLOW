<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#tt {
	width: 150px;
	font-size: 20px;
	text-align: center;
	font-weight: bolder;
}

#td {
	text-align: center;
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
			<h2>클래스</h2>
			<div id="lorem">
				<table class="table table-bordered">
					<tr>
						<td id="tt">클래스</td>
						<td id="td">${contents_view.class_name}</td>
					</tr>
					<tr>
						<td id="tt">강사명</td>
						<td id="td">${contents_view.teacher_name}</td>
					</tr>
					<tr>
						<td id="tt">교재명</td>
						<td id="td">${contents_view.book_name}</td>
					</tr>
					<tr>
						<td id="tt">과정명</td>
						<td id="td">${contents_view.course_name}</td>
					</tr>
					<tr>
						<td id="tt">과정기간</td>
						<td id="td"><fmt:parseDate var="start_d"
								value="${contents_view.course_startdate}" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${start_d}" pattern="yyyy년 MM월 dd일" /> ~
							<fmt:parseDate var="end_d"
								value="${contents_view.course_enddate}" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${end_d}" pattern="yyyy년 MM월 dd일" /></td>
					</tr>
					<tr>
						<td id="tt">현 수강인원</td>
						<td id="td">${count.student_count}</td>
					</tr>
					<tr>
						<td id="tt">최대 수강인원</td>
						<td id="td">${contents_view.max_student}</td>
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