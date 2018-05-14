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
<h1>공지사항</h1>

<table border="1">
<tr>
<td>번호</td>
<td>이름</td>
<td>제목</td>
<td>날짜</td>
<td>조회수</td>
</tr>

<c:forEach var="nbbean" items="${board_list}">
<tr>
<td>${nbbean.nb_num}</td>
<td>${nbbean.nb_writer}</td>
<td>
	<%-- <c:forEach begin="1" end="${bbean.bId}">-</c:forEach> --%>
	<a href="nb_content_view?nb_num=${nbbean.nb_num}">${nbbean.nb_title}</a></td>
<td>${nbbean.nb_date}</td>
<td>${nbbean.nb_count}</td>
</tr>
</c:forEach>

<tr>
	<td colspan="5"><a href="nb_write_view">글쓰기</a></td>
</tr>

</table>
</body>
</html>