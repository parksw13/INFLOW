<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function viewCheck() {
		$("#uv").click(function() {
			if ('${login_users.id}' == "") {
				alert('로그인 해주세요');
			} else {
				document.form1.action = "usersView";
				document.form1.submit();
			}
		})
	})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<link href="resources/css/main.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="resources/css/me.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>INFLOW</title>

</head>
<body>
	<%-- <c:if test=""> --%>
	<nav class="green lighten-1" role="navigation">
		<div class="container">
			<div class="nav-wrapper">
				<a id="logo-container" class="brand-logo">INFLOW</a>
			</div>

			<div style="float: right;">
				<c:choose>
					<c:when test="${empty login_users.id}">
						<a href="login" class="btn btn-warning">로그인</a>
					</c:when>
					<c:when test="${!empty login_users.id}">${login_users.id}님 환영합니다.
               &nbsp;&nbsp;&nbsp;&nbsp;         
               <a href="logout" class="btn btn-danger">로그아웃</a>
					</c:when>
				</c:choose>
			</div>
			<form name="form1" method="POST">
				<input type="hidden" name="id" value="${login_users.id}"> <a
					style="padding-left: 200px;" id="uv" href="#" onclick="viewCheck()">MY
					PAGE</a>

			</form>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="section">
			<!--   Icon Section   -->
			<article>
				<section>
					<!-- 메인 아이콘의 1번째 행 -->
					<div class="row">
						<a class="modal-trigger" href="nb_list">
							<div
								class="col s12 m2 btn-large waves-effect waves yellow z-depth-4">
								<h2 class="center black-text">
									<i class="fa fa-cog fa-spin"></i>
								</h2>
								<h5 class="center black-text">공지사항</h5>
							</div>
						</a> <a class="modal-trigger z-depth-5" href="qna_list">
							<div
								class="col s12 m4 btn-large waves-effect waves cyan z-depth-4">
								<h2 class="center black-text">
									<i class="xi-quicktime"></i>
								</h2>
								<h5 class="center black-text">Q&A</h5>
							</div>
						</a> <a class="modal-trigger" href="sb_list">
							<div
								class="col s12 m4 btn-large waves-effect waves orange z-depth-4">
								<h2 class="center black-text">
									<i class="xi-book"></i>
								</h2>
								<h5 class="center black-text">학습게시판</h5>
							</div>
						</a> <a class="modal-trigger" href="sr_list">
							<div
								class="col s12 m2 btn-large waves-effect waves red z-depth-4">
								<h2 class="center black-text">
									<i class="xi-paper"></i>
								</h2>
								<h5 class="center black-text">
									<font color="black">학습자료실</font>
								</h5>
							</div>
						</a>
					</div>

					<!--메인 아이콘 2번째 행 시작  -->
					<div class="row">
						<a class="modal-trigger" href="class_list">
							<div
								class="col s12 m2 btn-large waves-effect waves blue z-depth-4">
								<h2 class="center black-text">
									<i class="xi-copyright"></i>
								</h2>
								<h5 class="center black-text">
									<font color="black">클래스</font>
								</h5>
							</div>
						</a> <a class="modal-trigger" href="calendar_main">
							<div
								class="col s12 m4 btn-large waves-effect waves green z-depth-4">
								<h2 class="center black-text">
									<i class="xi-calendar-check"></i>
								</h2>
								<h5 class="center black-text">
									<font color="black">달력</font>
								</h5>
							</div>
						</a>
						<div
							class="col s12 m2 btn-large waves-effect waves orange z-depth-4">
							<div id="bg"></div>
							<div class="contact">
								<div class="envelope" style="top: 130px;">
									<div class="top">
										<div class="outer">
											<div class="inner"></div>
										</div>
									</div>
									<div class="bottom"></div>
									<div class="left"></div>
									<div class="right"></div>
									<div class="cover"></div>
									<div class="paper">
										<a class="modal-trigger" href="message_sendlist"
											style="font-size: 1.64rem; font-weight: 400;">보낸 메세지</a> <a
											class="modal-trigger" href="message_relist"
											style="font-size: 1.64rem; font-weight: 400;">받은 메세지</a>
									</div>
								</div>
							</div>
						</div>
						<a class="modal-trigger" href="attended">
							<div
								class="col s12 m4 btn-large waves-effect waves purple z-depth-4">
								<h2 class="center black-text">
									<i class="fas fa-chart-bar"></i>
								</h2>
								<h5 class="center black-text">출석현황</h5>
							</div>
						</a>
					</div>

					<!-- 메인 아이콘 3번째 행 시작 -->
					<c:if test="${login_users.grade eq 'A'}">
						<div class="row">
							<a class="modal-trigger" href="join">
								<div
									class="col s12 m4 btn-large waves-effect waves cyan z-depth-4">
									<h2 class="center black-text">
										<i class="fas fa-address-card"></i>
									</h2>
									<h5 class="center black-text">회원등록</h5>
								</div>
							</a> <a class="modal-trigger" href="resources_list">
								<div
									class="col s12 m2 btn-large waves-effect waves red z-depth-4">
									<h2 class="center black-text">
										<i class="fas fa-boxes"></i>
									</h2>
									<h5 class="center black-text">
										<font color="black">재고관리</font>
									</h5>
								</div>
							</a> <a class="modal-trigger" href="insert_attended">
								<div
									class="col s12 m2 btn-large waves-effect waves green z-depth-4">
									<h2 class="center black-text">
										<i class="fas fa-edit"></i>
									</h2>
									<h5 class="center black-text">
										<font color="black">출석부등록</font>
									</h5>
								</div>
							</a>
							<!--facebook link instead of modal-->
							<c:if test="${login_users.grade eq 'A'}">
								<a class="modal-trigger" href="usersList">
									<div
										class="col s12 m4 btn-large waves-effect waves blue z-depth-4">
										<h2 class="center black-text">
											<i class="fas fa-users"></i>
										</h2>
										<h5 class="center black-text">
											<font color="black">회원관리</font>
										</h5>
									</div>
								</a>
							</c:if>
						</div>
					</c:if>
		</div>

		</section>
		</article>
		<!--End Icon Section   -->
	</div>
	<!--  Scripts-->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

</body>
</html>