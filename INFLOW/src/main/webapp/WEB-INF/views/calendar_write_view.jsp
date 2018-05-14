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
h1 {
	padding-left: 30%;
}

img {
	width: 30%;
	height: 20%;
}

body {
	padding-left: 10%;
}

#tt {
	width: 161px;
	font-size: 20px;
	font-weight: bolder;
}
</style>
<meta charset="UTF-8">
<title>INFLOW</title>
</head>
<script type="text/javascript">
	function closeWithSubmit() {

		var f = document.forms.c_write;
		opener.name = "c_write";
		f.target = opener.name;
		f.submit();
		self.close();
	}
</script>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>일정등록</h2>
			<div id="lorem">
				<form name="c_write" action="calendar_write" method="post">
					<script
						src="//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js"></script>
					<script
						src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
					<script type="text/javascript">
						var formattedDate = new Date(
								"yourUnformattedOriginalDate");
						var d = formattedDate.getDate();
						var m = formattedDate.getMonth();
						m += 1;
						// JavaScript months are 0-11 
						var y = formattedDate.getFullYear();
						$("#sDate").val(d + "." + m + "." + y);
						$("#eDate").val(d + "." + m + "." + y);
					</script>


					<table class="table table-bordered">
						<tr>
							<td id="tt">일정 제목 :</td>
							<td><input type="text" name="c_title" required="required" /></td>
						</tr>
						<tr>
							<td id="tt">일정 내용 :</td>
							<td><textarea rows="10" style="width: 100%; height: 150px;"
									name="c_contents" required="required"></textarea></td>
						</tr>
						<tr>
							<td id="tt">일정 시작 기간 :</td>
							<td><input type="date" id="sDate" name="c_start_date"
								required="required" /></td>
						</tr>
						<tr>
							<td id="tt">일정 마감 기간 :</td>
							<td><input type="date" id="eDate" name="c_end_date"
								required="required" /></td>
						</tr>
						<tr>
							<td id="tt">일정등록</td>
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