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
<title>INFLOW</title>
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>학습자료실</h2>
			<div id="lorem">
				<form action="sr_write" method="post" enctype="multipart/form-data">
					<table class="table table-bordered">
						<tr>
							<td id="tt">작성자</td>
							<td><input type="hidden" name="sr_writer"
								value="${login_users.id}"> ${login_users.id}</td>
						</tr>
						<tr>
							<td id="tt">제목</td>
							<td><input type="text" name="sr_title" size="50" required="required"></td>
						</tr>
						<tr>
							<td id="tt">내용</td>
							<td><textarea name="sr_contents" rows="10"
									style="width: 824px; height: 440px;" required="required"></textarea></td>
						</tr>

						<tr>
							<td id="tt">첨부파일</td>
							<td><input type="file" name="sr_upload" size="50"></td>
						</tr>
						<tr>
							<td id="tt">등록</td>
							<td><input type="submit" value="확인" size="50">&nbsp;&nbsp;
								<button type="button" onclick="history.back()">취소</button></td>
						</tr>
					</table>
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