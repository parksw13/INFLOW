<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>INFLOW</title>
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>학습게시판</h2>
			<div id="lorem">
				<form action="sb_modify" method="post">
					<input type="hidden" name="sb_num"
						value="${sb_content_view.sb_num}">
					<table class="table table-bordered">
						<tr>
							<td id="tt">번호</td>
							<td>${sb_content_view.sb_num}</td>
						</tr>
						<tr>
							<td id="tt">조회수</td>
							<td>${sb_content_view.sb_count}</td>
						</tr>
						<tr>
							<td id="tt">작성자</td>
							<td><input type="hidden" name="sb_writer"
								value="${sb_content_view.sb_writer}">${sb_content_view.sb_writer}</td>
						</tr>
						<tr>
							<td id="tt">제목</td>
							<td><input type="text" name="sb_title"
								value="${sb_content_view.sb_title}" required="required"></td>
						<tr>
						<tr>
							<td id="tt">내용</td>
							<td><textarea rows="10" name="sb_contents"
									style="width: 824px; height: 440px;" required="required">${sb_content_view.sb_contents}</textarea></td>
						</tr>
					</table>
					<div style="text-align: center;">
						<input type="submit" value="확인">&nbsp;&nbsp;
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