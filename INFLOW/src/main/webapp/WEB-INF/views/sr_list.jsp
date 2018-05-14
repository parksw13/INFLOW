<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
<style type="text/css">
#td {
	text-align: center;
}

#th {
	text-align: center;
	font-weight: bolder;
}
</style>
<meta charset="UTF-8">
<title>INFLOW</title>
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>학습자료실</h2>
			<div id="lorem">
				<table class="table table-bordered" id="lorem">
					<thead>
						<tr>
							<th id="th">번호</th>
							<th id="th">작성자</th>
							<th id="th">제목</th>
							<th id="th">날짜</th>
							<th id="th">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="srbean" items="${board_list}">
							<tr>
								<td id="td">${srbean.sr_num}</td>
								<td id="td">${srbean.sr_writer}</td>
								<td id="td">
									<%-- <c:forEach begin="1" end="${bbean.bId}">-</c:forEach> --%>
									<a href="sr_content_view?sr_num=${srbean.sr_num}">${srbean.sr_title}
										<c:if test="${!empty srbean.sr_upload}">
											<!-- <img src="resources/img/FD_icon2.png"
												style="width: 4%; height: 4%"> -->
											<i class="xi-diskette"></i>
										</c:if>
								</a>
								</td>
								<td id="td"><fmt:parseDate var="date"
										value="${srbean.sr_date}" pattern="yyyy-MM-dd" /> <fmt:formatDate
										value="${date}" pattern="yyyy년 MM월 dd일" /></td>
								<td id="td">${srbean.sr_count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${login_users.grade eq 'T'}">
					<button type="button" onclick="location.href='sr_write_view'">글쓰기</button>
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