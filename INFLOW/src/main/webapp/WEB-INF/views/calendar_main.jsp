<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/main2.js"></script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
<title>INFLOW</title>
</head>
<body><jsp:include page="main.jsp"></jsp:include>
	<div id="c_boxes">
		<div id="dialog" class="window"
			style="top: 0px; display: block; left: 490px;">
			달력
			<jsp:include page="calendar_view.jsp"></jsp:include>

			<div id="popupfoot">
				<button type="button" onclick="location.href='main'"
					class="close agree">닫기</button>
			</div>
		</div>
	</div>
	<div
		style="width: 1478px; font-size: 32pt; color: white; height: 602px; display: none; opacity: 0.8;"
		id="mask"></div>
</body>
</html>