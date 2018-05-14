<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INFLOW</title>
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
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>받은 메시지</h2>
			<div id="lorem">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th id="th">보낸 사람</th>
							<th id="th">내용</th>
							<td id="th">받는 사람
							<th id="th">메세지 삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${message_list}" var="m">
							<c:if test="${login_users.id eq m.receive_id}">
								<tr>
									<td id="td"><a href="m_write_view?receive_id=${m.send_id}">${m.send_id}</a></td>
									<td id="td">${m.m_contents}</td>
									<td id="td">${m.receive_id}</td>
									<td id="td"><a href="m_delete?m_num=${m.m_num}">삭제</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" onclick="location.href='m_write_view'">쪽지보내기</button>
				<div id="nav">
					<a href="#" rel="0" class="active">1</a>
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
</body>
</html>