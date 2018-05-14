<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>INFLOW</title>
<style type="text/css">
.img_wrap {
	text-align: center;
	margin: auto;
}

.img_wrap img {
	width: 150px;
	height: 200px;
}

#td {
	text-align: center;
}

#th {
	font-weight: bolder;
	text-align: center;
}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />

</head>


<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 50px; left: 551.5px; display: none; width: 800px;"
			id="dialog" class="window">
			<h3>MY PAGE</h3>
			<div id="lorem">
				<div class="card card-register mx-auto mt-5">
					<p id="th" style="text-align: center; font-size: 20px;">${login_users.id}
						님의 회원정보</p>
					<div class="card-body">
						<form action="usersEdit" method="post">
							<input type="hidden" name="id" value="${usersView.id}">
							<div class="form-group">
								<div class="form-row">
									<div class="col-md-12">
										<p id="th">프로필사진</p>
										<br>
										<div class="img_wrap">
											<img id="img" width=150px;
												src="resources/upload/${usersView.profile_img}" /> <br>
											<br>
										</div>
									</div>

								</div>
							</div>



							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">아이디</p>
										<div class="form-control">${usersView.id}</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">비밀번호</p>
										<div class="form-control">${usersView.pw}</div>
										<br>
									</div>
								</div>
							</div>




							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">이름</p>
										<div class="form-control">${usersView.name}</div>
									</div>
									<div class="col-md-6">
										<p id="th">이메일</p>
										<div class="form-control">${usersView.email}</div>
										<br>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="form-row">
									<div class="col-md-12">
										<p id="th">주소</p>
										<div class="form-control" style="width: 100%;">${usersView.addr}</div>
										<br>
									</div>
								</div>
							</div>



							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">주민번호("000000-0000000")</p>
										<div class="form-control">${usersView.num}</div>
									</div>
									<div class="col-md-6">
										<p id="th">전화번호("010-0000-0000")</p>
										<div class="form-control">${usersView.tel}</div>
										<br>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">구분코드</p>
										<div class="form-control">${usersView.grade}</div>
									</div>
									<div class="col-md-6">
										<p id="th">클래스코드</p>
										<div class="form-control">${usersView.class_name}</div>
										<br>
									</div>
								</div>
							</div>

							<input type="submit" class="btn btn-primary btn-block"
								value="수정하기">

						</form>
					</div>
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

</body>

</html>
