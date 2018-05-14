<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#tt {
	width: 15px;
	font-size: 20px;
	text-align: center;
	font-weight: bolder;
}
</style>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
<meta charset="UTF-8">
<title>글상세보기</title>
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>공지사항</h2>
			<div id="lorem">
				<form action="nb_modify_view">
					<input type="hidden" name="nb_num"
						value="${nb_content_view.nb_num}">
					<table class="table table-bordered">
						<tr>
							<td id="tt">번호</td>
							<td>${nb_content_view.nb_num}</td>
						</tr>
						<tr>
							<td id="tt">조회수</td>
							<td>${nb_content_view.nb_count}</td>
						</tr>
						<tr>
							<td id="tt">작성자</td>
							<td>${nb_content_view.nb_writer}</td>
						</tr>
						<tr>
							<td id="tt">제목</td>
							<td>${nb_content_view.nb_title}</td>
						<tr>
						<tr>
							<td id="tt">내용</td>
							<td style="width: 200px; height: 200px;">${nb_content_view.nb_contents}</td>
						</tr>
					</table>
					<div style="text-align: center;">
						<c:if test="${nb_content_view.nb_writer eq login_users.id || login_users.grade eq 'A'}">
							<input type="submit" value="수정">&nbsp;&nbsp;
							</c:if>
						<button type="button" onclick="location.href='nb_list'">목록보기</button>
						&nbsp;&nbsp;
						<c:if test="${nb_content_view.nb_writer eq login_users.id || login_users.grade eq 'A'}">
							<button type="button"
								onclick="location.href='nb_delete?nb_num=${nb_content_view.nb_num}'">삭제</button>
						</c:if>

					</div>
				</form>
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