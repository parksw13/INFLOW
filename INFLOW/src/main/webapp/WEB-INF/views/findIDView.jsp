<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style type="text/css">
#td {
	text-align: center;
}

#th {
	text-align: center;
	font-weight: bolder;
}
</style>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>INFLOW</title>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
</head>

<body class="bg-dark">
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none; width: 500px;"
			id="dialog" class="window">
			<h3>아이디 찾기 검색결과</h3>
			<p>회원님의 아이디는 다음과 같습니다.</p>
			<div id="lorem">
				<div class="card card-login mx-auto mt-5">
					<div class="card-body">
						<div class="text-center mt-4 mb-5"></div>
						<br>
						<div class="text-center mt-4 mb-5">' ${ findIDView.id } '</div>
						<br>
						<div style="text-align: center;">
							<button type="button" onclick="location.href='login'"
								class="btn btn-info">로그인</button>
							<button class="btn btn-info" type="button"
								onclick="location.href='find_pw_form'">비밀번호찾기</button>

						</div>

					</div>
				</div>
				<div id="popupfoot">
					<button type="button" onclick="location.href='main_view'"
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
