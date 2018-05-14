<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
<title>INFLOW</title>
<script type="text/javascript">
	function closeWithSubmit() {
		var f = document.forms.c_delete;
		opener.name = "c_delete";
		f.target = opener.name;
		f.submit();
		self.close();
	}
</script>
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>일정삭제</h2>
			<div id="lorem">
				<form name="c_delete" action="delete">
					<div style="text-align: center;">
						삭제할 일정의 번호를 입력해주세요.<br> <input type="text" name="c_num"
							style="width: 5%; text-align: center;" required="required" /><br>
						<input type="submit" onclick="closeWithSubmit()" value="일정삭제" />
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