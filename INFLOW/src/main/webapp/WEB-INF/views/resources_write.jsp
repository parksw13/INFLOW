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
<meta charset="UTF-8">
<title>INFLOW</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(
			function() {

				//교보재명을 실시간 중복확인 위한 ajax
				$("#r_name").keyup(
						function() {
							$.ajax({
								url : "check_rname",
								type : "POST",
								data : {
									r_name : $("#r_name").val()
								},
								success : function(result) {
									if (result == 1) {
										$('font[name=check]').html(
												"등록된 교보재입니다.").css("color",
												"red");
										$("#sendbtn").attr("disabled",
												"disabled");

									} else {
										$('font[name=check]').html(
												"등록가능한 교보재입니다.").css("color",
												"green");
										$("#sendbtn").removeAttr("disabled");

									}
								},
							})
						});
			})
</script>
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>재고관리</h2>
			<div id="lorem">
				<form action="resources_write" method="post"
					enctype="multipart/form-data">
					<table class="table table-bordered">
						<tr>
							<td id="tt">구분</td>
							<td><select class="form-control" name="division">
									<option value="교보재">교보재</option>
									<option value="장비">장비</option>
							</select><br /></td>
						</tr>
						<tr>
							<td id="tt">제품 이름</td>
							<td><input type="text" name="r_name" id="r_name"
								required="required" /><font name="check" size="2"></font></td>
						</tr>
						<tr>
							<td id="tt">현 재고</td>
							<td><input type="text" name="stock" required="required" /></td>
						</tr>
						<tr>
							<td id="tt">총수량</td>
							<td><input type="text" name="max_stock" required="required" /></td>
						</tr>
						<tr>
							<td id="tt">제품 사진 등록</td>
							<td><input type="file" name="r_file" required="required"/></td>
						</tr>
						<tr>
							<td id="tt">등록</td>
							<td><input type="submit" value="확인" size="50" id="sendbtn">&nbsp;&nbsp;
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