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
		<div style="top: 199.5px; left: 551.5px; display: none; width:1350px" id="dialog"
			class="window">
			<h2>클래스등록</h2>
			<div id="lorem">
				<table class="table table-bordered" id="lorem">
					<thead>
						<tr>
							<th id="th">클래스</th>
							<th id="th">강사명</th>
							<th id="th">교재명</th>
							<th id="th">과정명</th>
							<th id="th">과정기간</th>
							<c:if test="${login_users.grade eq 'A'}">
								<th id="th">수정</th>
								<th id="th">삭제</th>
							</c:if>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="class_bean" items="${class_list}">
							<c:choose>
								<c:when test="${class_bean.class_name ne 'admin'}">
									<tr>
										<td id="td"><a
											href="class_contents_view?class_name=${class_bean.class_name}">${class_bean.class_name}</a></td>
										<td id="td">${class_bean.teacher_name}</td>
										<td id="td">${class_bean.book_name}</td>
										<td id="td">${class_bean.course_name}</td>
										<td id="td"><fmt:parseDate var="start_d"
												value="${class_bean.course_startdate}" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${start_d}" pattern="yyyy년 MM월 dd일" />
											~ <fmt:parseDate var="end_d"
												value="${class_bean.course_enddate}" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${end_d}" pattern="yyyy년 MM월 dd일" />
										</td>

										<c:if test="${login_users.grade eq 'A'}">
											<td id="td"><button type="button"
													onclick="location.href='class_modify_view?class_name=${class_bean.class_name}'">수정</button></td>
											<td id="td"><button type="button"
													onclick="location.href='class_delete?class_name=${class_bean.class_name}'">삭제</button></td>
										</c:if>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${login_users.grade eq 'A'}">
					<button type="button" onclick="location.href='class_write_view'">등록하기</button>
					<div id="nav">
						<a href="#" rel="0" class="active">1</a>
					</div>
				</c:if>
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