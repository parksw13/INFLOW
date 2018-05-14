<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
<style type="text/css">
#tt {
	width: 150px;
	font-size: 20px;
	text-align: center;
	font-weight: bolder;
}
</style>
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
				<form action="nb_modify" method="post">
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
							<td><input type="hidden" name="nb_writer"
								value="${nb_content_view.nb_writer}">${nb_content_view.nb_writer}</td>
						</tr>
						<tr>
							<td id="tt">제목</td>
							<td><input type="text" name="nb_title"
								value="${nb_content_view.nb_title}" required="required"></td>
						<tr>
						<tr>
							<td id="tt">내용</td>
							<td><textarea rows="10" name="nb_contents"
									style="width: 824px; height: 440px;" required="required">${nb_content_view.nb_contents}</textarea></td>
						</tr>
					</table>
					<div style="text-align: center;">
						<input type="submit" value="확인">
						<button type="button" onclick="history.back()">취소</button>

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