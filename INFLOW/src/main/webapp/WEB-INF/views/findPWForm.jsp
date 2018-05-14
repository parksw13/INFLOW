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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#findBtn").click(function() {
			$.ajax({
				url : "find_pw",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
					location.href='login';
				},
			})
		});
	})
</script>


</head>

<body class="bg-dark">
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none; width: 500px;"
			id="dialog" class="window">
			<h3>비밀번호를 잊으셨나요?</h3>
			<p>가입시 등록한 아이디와 이메일을 입력하세요.</p>
			<div id="lorem">
				<div class="card card-login mx-auto mt-5">
					<div class="card-header"></div>
					<div class="card-body">
						<div class="text-center mt-4 mb-5"></div>
						<div class="form-group" style="text-align: center;">
							<p id="th">아이디</p>
							<input class="form-control"
								style="text-align: center; width: 95%; margin: auto;" name="id"
								id="id" type="text" placeholder="아이디를 입력해주세요"
								required="required">
						</div>
						<div class="form-group" style="text-align: center;">
							<p id="th">이메일</p>
							<input class="form-control"
								style="text-align: center; width: 95%; margin: auto;"
								name="email" id="email" type="email" placeholder="이메일을 입력해주세요"
								required="required">
						</div>

						<div style="text-align: center;">
							<button type="button" id="findBtn" class="btn btn-primary">비밀번호찾기</button>
							<button type="button" onclick="location.href='login'"
								class="btn btn-primary">취소</button>
							<!-- 	<br>
							<a class="d-block small mt-3" href="login">로그인</a> <a
								class="d-block small" href="index">HOME</a> -->
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
