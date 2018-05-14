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
<h1>학습자료실</h1>

<table border="1">
<tr>
<td>번호</td>
<td>이름</td>
<td>제목</td>
<td>날짜</td>
<td>조회수</td>
</tr>

<c:forEach var="srbean" items="${board_list}">
<tr>
<td>${srbean.sr_num}</td>
<td>${srbean.sr_writer}</td>
<td>
	<%-- <c:forEach begin="1" end="${bbean.bId}">-</c:forEach> --%>
	<a href="sr_content_view?sr_num=${srbean.sr_num}">${srbean.sr_title}</a></td>
<td>${srbean.sr_date}</td>
<td>${srbean.sr_count}</td>
</tr>
</c:forEach>

<tr>
	<td colspan="5"><a href="sr_write_view">글쓰기</a></td>
</tr>

</table>
</body>
</html>