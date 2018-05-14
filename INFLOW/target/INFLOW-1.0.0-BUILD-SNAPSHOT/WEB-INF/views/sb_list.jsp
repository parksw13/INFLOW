<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판목록</title>
</head>
<body>
<h1>학습 게시판</h1>

<table border="1">
<tr>
<td>번호</td>
<td>이름</td>
<td>제목</td>
<td>날짜</td>
<td>조회수</td>
</tr>

<c:forEach var="sbbean" items="${board_list}">
<tr>
<td>${sbbean.sb_num}</td>
<td>${sbbean.sb_writer}</td>
<td>
	<%-- <c:forEach begin="1" end="${bbean.bId}">-</c:forEach> --%>
	<a href="sb_content_view?sb_num=${sbbean.sb_num}">${sbbean.sb_title}</a></td>
<td>${sbbean.sb_date}</td>
<td>${sbbean.sb_count}</td>
</tr>
</c:forEach>

<tr>
	<td colspan="5"><a href="sb_write_view">글쓰기</a></td>
</tr>

</table>
</body>
</html>