<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>INFLOW</title>
<style type="text/css">
#td {
	text-align: center;
}

#th {
	text-align: center;
	font-weight: bolder;
}
</style>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />

<script>
	/* id 및 pw 확인을 위한 처리  */
	function loginCheck() {
		//ajax시작
		$.ajax({
			//get or post 지정
			type : 'post',
			//호출하고자 하는 주소값
			url : "loginCheck",
			//전송하고자 하는 데이터
			data : {
				"id" : frm.id.value,
				"pw" : frm.pw.value
			},
			//ajax로 호출한 페이지의 리턴 형식. xml, json, html, text 등을 사용할 수 있음.
			dataType : "text",
			//처리가 성공했을 때 처리하는 내용
			success : function(data) {
				if (data == "1") {
					alert("아이디 혹은 비밀번호를 확인해주세요");
				} else {
					alert(frm.id.value + "님 환영합니다!");
					document.frm.submit();
				}
			}
		}); //ajax종료
	}
</script>
</head>
<jsp:include page="main.jsp" />
<body class="bg-dark">
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none; width: 500px;"
			id="dialog" class="window">
			<h3>로그인</h3>
			<div id="lorem">

				<div class="card card-login mx-auto mt-5">
					<div class="card-body">
						<form action="loginForm" method="post" name="frm" id="frm">
							<div style="text-align: center;">
								<p id="th">아이디</p>
								<input class="form-control"
									style="text-align: center; width: 95%; margin: auto;" id="id"
									name="id" type="text" placeholder="아이디를 입력해주세요"> <br>
								<p id="th">비밀번호</p>
								<input class="form-control"
									style="text-align: center; width: 95%; margin: auto;" id="pw"
									name="pw" type="password" placeholder="비밀번호를 입력해주세요">
							</div>
							<br>
							<button type="button" class="btn btn-primary btn-block"
								onclick="loginCheck()">로그인</button>
						</form>
						<div style="text-align: center;">
							<button class="btn btn-info" type="button"
								onclick="location.href='find_id_form'">아이디찾기</button>
							<button class="btn btn-info" type="button"
								onclick="location.href='find_pw_form'">비밀번호찾기</button>
							<!-- <a href="find_id_form" >아이디찾기</a><br>
								<a href="find_pw_form" >비밀번호찾기</a> -->
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
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
	<script src="resources/js/main.js"></script>

</body>
</html>