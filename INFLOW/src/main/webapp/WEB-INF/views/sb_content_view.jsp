<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#tt {
	width: 15px;
	font-size: 20px;
	text-align: center;
	font-weight: bolder;
}
</style>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
<meta charset="UTF-8">
<title>INFLOW</title>
</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>학습게시판</h2>
			<div id="lorem">
				<form action="sb_modify_view">
					<input type="hidden" name="sb_num"
						value="${sb_content_view.sb_num}">
					<table class="table table-bordered">
						<tr>
							<td id="tt">번호</td>
							<td>${sb_content_view.sb_num}</td>
						</tr>
						<tr>
							<td id="tt">조회수</td>
							<td>${sb_content_view.sb_count}</td>
						</tr>
						<tr>
							<td id="tt">작성자</td>
							<td>${sb_content_view.sb_writer}</td>
						</tr>
						<tr>
							<td id="tt">제목</td>
							<td>${sb_content_view.sb_title}</td>
						<tr>
						<tr>
							<td id="tt">내용</td>
							<td style="width: 200px; height: 200px;">${sb_content_view.sb_contents}</td>
						</tr>
					</table>
					<div style="text-align: center;">
						<c:if test="${sb_content_view.sb_writer eq login_users.id}">
							<input type="submit" value="수정">&nbsp;&nbsp;
						</c:if>
						<button type="button" onclick="location.href='sb_list'">목록보기</button>
						&nbsp;&nbsp; 
						<c:if test="${sb_content_view.sb_writer eq login_users.id || login_users.grade eq 'A'}">	
						<button type="button"
							onclick="location.href='sb_delete?sb_num=${sb_content_view.sb_num}'">삭제</button>
						&nbsp;&nbsp;</c:if>
						<c:if test="${login_users.grade eq 'T'}">
							<c:if test="${sb_content_view.sb_re_seq eq 0}">
								<button type="button"
									onclick="location.href='sb_re_write_view?sb_num=${sb_content_view.sb_num}'">답글쓰기</button>
							</c:if>
						</c:if>
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