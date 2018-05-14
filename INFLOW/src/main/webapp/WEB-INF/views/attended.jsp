<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INFLOW</title>
<style type="text/css">
#td {
	text-align: center;
	vertical-align: middle;
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
</head>
<script type="text/javascript">
	function check() {
		alert("출석하였습니다!")
	}
</script>

<body>

	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<c:if test="${login_users.grade eq 'S'}">
				<h2>나의 출석현황</h2>
			</c:if>
			<c:if test="${login_users.grade eq 'T'}">
				<h2>'${login_users.class_name}' 과정 출석현황</h2>
			</c:if>
			<c:if test="${login_users.grade eq 'A'}">
				<h2>전체 학생 출석현황</h2>
			</c:if>

			<div id="lorem">
				<table class="table table-bordered" id="lorem">
					<thead>
						<tr>
							<th id="th">학생 ID</th>
							<c:if test="${login_users.grade eq 'A'}">
								<th id="th">클래스</th>
							</c:if>
							<th id="th">날짜</th>
							<th id="th">시간</th>
							<th id="th">출결</th>
							<c:if test="${login_users.grade ne 'A'}">
								<th id="th">비고</th>
							</c:if>
						</tr>
						<c:choose>
							<c:when test="${login_users.grade eq 'T'}">
								<c:forEach items="${attend_list}" var="attend">
									<c:if test="${login_users.class_name eq attend.class_name}">
										<c:if test="${attend.student_id ne 'admin'}">
											<tr>
												<td id="td">${attend.student_id}</td>
												<td id="td"><fmt:formatDate
														value="${attend.attended_date1}" pattern="yyyy.MM.dd" /></td>
												<td id="td">${attend.attended_date2}</td>
												<td id="td"><c:choose>
														<c:when test="${attend.attended_state eq 0}">결석</c:when>
														<c:when test="${attend.attended_state eq 1}">출석</c:when>
														<c:when test="${attend.attended_state eq 2}">지각</c:when>
														<c:when test="${attend.attended_state eq 3}">조퇴신청</c:when>
														<c:when test="${attend.attended_state eq 4}">조퇴</c:when>
													</c:choose></td>

												<td id="td"><c:choose>
														<c:when
															test="${login_users.grade eq 'T' && attend.attended_state eq 3}">
															<button type="button"
																onclick="location.href='early_signup?student_id=${attend.student_id}&&class_name=${attend.class_name}';javascript:alert('조퇴 승인하였습니다.');">조퇴신청
																승인</button>
														</c:when>
													</c:choose></td>
											</tr>
										</c:if>
									</c:if>
								</c:forEach>
							</c:when>
							<c:when test="${login_users.grade eq 'S'}">
								<c:forEach items="${attend_list}" var="attend">
									<c:if test="${attend.student_id eq login_users.id}">
										<tr>
											<td id="td">${attend.student_id}</td>
											<td id="td"><fmt:formatDate
													value="${attend.attended_date1}" pattern="yyyy.MM.dd" /></td>
											<td id="td">${attend.attended_date2}</td>
											<td id="td"><c:choose>
													<c:when test="${attend.attended_state eq 0}">결석</c:when>
													<c:when test="${attend.attended_state eq 1}">출석</c:when>
													<c:when test="${attend.attended_state eq 2}">지각</c:when>
													<c:when test="${attend.attended_state eq 3}">조퇴신청</c:when>
													<c:when test="${attend.attended_state eq 4}">조퇴</c:when>
												</c:choose></td>
											<td id="td"><c:if test="${attend.attended_state ne 3}">
													<c:choose>
														<c:when
															test="${login_users.grade eq 'S' && attend.attended_state eq 0}">
															<c:if test="${attend.student_id eq login_users.id}">
																<form action="attend">
																	<input type="hidden" name="student_id"
																		value="${login_users.id}"> <input
																		type="hidden" value="now" name="attended_date2" />
																	<script
																		src="//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js"></script>
																	<script
																		src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
																	<script type="text/javascript">
																		$(function() {
																			$(
																					'input[type="hidden"][value="now"]')
																					.each(
																							function() {
																								var d = new Date(), h = d
																										.getHours(), m = d
																										.getMinutes();
																								if (h < 10)
																									h = '0'
																											+ h;
																								if (m < 10)
																									m = '0'
																											+ m;
																								$(
																										this)
																										.attr(
																												{
																													'value' : h
																															+ ':'
																															+ m
																												});
																							});
																		});
																	</script>
																	<input type="submit" value="출석하기" onclick="check()">
																</form>
															</c:if>
														</c:when>
														<c:when test="${attend.attended_state ne 4}">
															<button type="button"
																onclick="location.href='early?student_id=${attend.student_id}&&class_name=${attend.class_name}';javascript:alert('조퇴신청하였습니다.');">조퇴신청</button>
														</c:when>
													</c:choose>
												</c:if></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:when>
							<c:when test="${login_users.grade eq 'A'}">
								<c:forEach items="${attend_list}" var="attend">
									<c:if test="${login_users.id ne attend.student_id}">
										<tr>
											<c:if test="${attend.class_name ne 'admin'}">
												<td id="td">${attend.student_id}</td>
												<td id="td">${attend.class_name}</td>
												<td id="td"><fmt:formatDate
														value="${attend.attended_date1}" pattern="yyyy.MM.dd" /></td>
												<td id="td">${attend.attended_date2}</td>
												<td id="td"><c:choose>
														<c:when test="${attend.attended_state eq 0}">결석</c:when>
														<c:when test="${attend.attended_state eq 1}">출석</c:when>
														<c:when test="${attend.attended_state eq 2}">지각</c:when>
														<c:when test="${attend.attended_state eq 3}">조퇴신청</c:when>
														<c:when test="${attend.attended_state eq 4}">조퇴</c:when>
													</c:choose></td>
											</c:if>
										</tr>
									</c:if>
								</c:forEach>
							</c:when>
						</c:choose>
				</table>

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