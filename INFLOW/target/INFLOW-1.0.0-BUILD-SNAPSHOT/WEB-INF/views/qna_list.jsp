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
<h1>Q&A</h1>

<table border="1">
<tr>
<td>번호</td>
<td>이름</td>
<td>제목</td>
<td>날짜</td>
<td>조회수</td>
</tr>

<c:forEach var="qnabean" items="${board_list}">
<tr>
<td>${qnabean.qna_num}</td>
<td>${qnabean.qna_writer}</td>
<td>
	<%-- <c:forEach begin="1" end="${bbean.bId}">-</c:forEach> --%>
	<a href="qna_content_view?qna_num=${qnabean.qna_num}">${qnabean.qna_title}</a></td>
<td>${qnabean.qna_date}</td>
<td>${qnabean.qna_count}</td>
</tr>
</c:forEach>

<tr>
	<td colspan="5"><a href="qna_write_view">글쓰기</a></td>
</tr>

</table>
</body>
</html>