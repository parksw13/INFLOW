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

#tt {
	width: 15px;
	font-size: 20px;
	text-align: center;
	font-weight: bolder;
}

#rr {
	font-size: 20px;
	font-weight: bolder;
	vertical-align: top;
	height: 50px
}

#r1 {
	width: 50px;
	font-size: 20px;
	text-align: center;
	font-weight: bolder;
}
</style>
<script>
	function formSubmit() {
		document.getElementById("frm1").submit();
	}
	function formSubmit2() {
		document.getElementById("frm2").submit();
	}
</script>
<meta charset="UTF-8">
<title>INFLOW</title>
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>Q&A</h2>
			<div id="lorem">
				<form action="qna_modify_view" id="frm2">
					<input type="hidden" name="qna_num"
						value="${qna_content_view.qna_num}">
					<table class="table table-bordered">
						<thead>
							<tr>
								<td id="tt">번호</td>
								<td>${qna_content_view.qna_num}</td>
							</tr>
							<tr>
								<td id="tt">조회수</td>
								<td>${qna_content_view.qna_count}</td>
							</tr>
							<tr>
								<td id="tt">작성자</td>
								<td>${qna_content_view.qna_writer}</td>
							</tr>
							<tr>
								<td id="tt">제목</td>
								<td>${qna_content_view.qna_title}</td>
							<tr>
							<tr>
								<td id="tt">내용</td>
								<td style="width: 200px; height: 200px;">${qna_content_view.qna_contents}</td>
							</tr>
						</thead>
					</table>
					<div style="text-align: center;">
						<c:if test="${qna_content_view.qna_writer eq login_users.id}">
							<button type="button" onclick="formSubmit2()">수정</button>&nbsp;&nbsp;
							</c:if>
						<button type="button" onclick="location.href='qna_list'">목록보기</button>
						&nbsp;&nbsp;
						<c:if test="${qna_content_view.qna_writer eq login_users.id || login_users.grade eq 'A'}">
							<button type="button"
								onclick="location.href='qna_delete?qna_num=${qna_content_view.qna_num}'">삭제</button>
						</c:if>
					</div>
				</form>
				<br> <br>
				<div style="text-align: center;">
					<c:if
						test="${login_users.grade eq 'A'|| login_users.id eq qna_content_view.qna_writer}">

						<form action="reply" method="post" id="frm1">
							<input type="hidden" name="qna_num"
								value="${qna_content_view.qna_num}"> <input
								type="hidden" name="reply_writer" value="${login_users.id}">
							<textarea rows="2" cols="50" name="reply_contents"
								style="width: 750px; height: 52px;"></textarea>
							<button type="button" onclick="formSubmit()" id="rr" >댓글작성</button>
						</form>
					</c:if>
				</div>
				<br> <br>
				<table class="table table-bordered" id="lorem">
					<thead>
						<tr>
							<td id="r1">댓글 번호</td>
							<td id="r1">댓글 내용</td>
							<td id="r1">댓글 작성자</td>
							<td id="r1">댓글 작성일</td>
							<c:if
								test="${login_users.id eq qna_content_view.qna_writer || login_users.grade eq 'A'}">
								<td id="r1">삭제</td>
							</c:if>
						</tr>
					</thead>

					<tbody>

						<c:forEach items="${reply_list}" var="reply">
							<tr>
								<td id="td">${reply.reply_num}</td>
								<td id="td">${reply.reply_contents}</td>
								<td id="td">${reply.reply_writer}</td>
								<td id="td"><fmt:formatDate value="${reply.reply_date}"
										pattern="yyyy.MM.dd" /></td>
								<td id="td"><c:if
										test="${login_users.id eq reply.reply_writer || login_users.grade eq 'A'}">
										<a
											href="reply_delete?reply_num=${reply.reply_num}&&qna_num=${qna_content_view.qna_num}">댓글
											삭제</a>
									</c:if></td>
							</tr>

						</c:forEach>


					</tbody>
				</table>


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