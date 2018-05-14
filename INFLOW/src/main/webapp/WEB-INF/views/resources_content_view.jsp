<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
<meta charset="UTF-8">
<title>INFLOW</title>
<style type="text/css">
#img {
	width: 250px;
	height: 150px;
}

img {
	width: 30%;
	height: 20%;
	margin-bottom: 5%;
	margin-top: 1%;
}

#tt {
	width: 150px;
	font-size: 20px;
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
			<h2>교보재</h2>
			<div id="lorem">
				<form action="resources_modify" method="post">
					<input type="hidden" name="code"
						value="${resources_content_view.code}" />
					<table class="table table-bordered">
						<tr>
							<td id="tt">교보재 코드</td>
							<td>${resources_content_view.code }</td>
						</tr>

						<tr>
							<td id="tt">입고일</td>
							<td>${resources_content_view.b_day }</td>
						</tr>

						<tr>
							<td id="tt">구분</td>
							<td>${resources_content_view.division }</td>
						</tr>
						<tr>
							<td id="tt">제품 이름</td>
							<td>${resources_content_view.r_name }</td>
						</tr>
						<tr>
							<td id="tt">현 재고</td>
							<td><input type="text" name="stock"
								value="${resources_content_view.stock }"></td>
						</tr>
						<tr>
							<td id="tt">총 수량</td>
							<td><input type="text" name="max_stock"
								value="${resources_content_view.max_stock }"></td>
						</tr>
						<tr>
							<td id="tt">제품 사진</td>
							<td><img id="img"
								src="resources/upload/${resources_content_view.r_file}" /></td>
						</tr>
					</table>
					<div style="text-align: center;">
						<input type="submit" value="수정"> &nbsp;&nbsp;
						<button onclick="resources_list">목록보기</button>
						&nbsp;&nbsp;
						<button type="button"
							onclick="location.href='resources_delete?code=${resources_content_view.code }'">제품
							삭제</button>
						&nbsp;&nbsp;
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