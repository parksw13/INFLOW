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
			<h2>학습게시판</h2>
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
						<c:forEach var="sbbean" items="${board_list}">
							<tr>
								<td id="td">${sbbean.sb_num}</td>
								<td id="td">${sbbean.sb_writer}</td>
								<td id="td"><a
									href="sb_content_view?sb_num=${sbbean.sb_num}"><c:if
											test="${sbbean.sb_re_seq>0}">&nbsp; ㄴ▶RE:</c:if>${sbbean.sb_title}

								</a></td>
								<td id="td"><fmt:parseDate var="date"
										value="${sbbean.sb_date}" pattern="yyyy-MM-dd" /> <fmt:formatDate
										value="${date}" pattern="yyyy년 MM월 dd일" /></td>
								<td id="td">${sbbean.sb_count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${login_users.grade ne 'A'}">
					<button type="button" onclick="location.href='sb_write_view'">글쓰기</button>
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