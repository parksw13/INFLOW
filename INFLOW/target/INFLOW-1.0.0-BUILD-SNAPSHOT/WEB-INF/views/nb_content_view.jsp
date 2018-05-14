<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세보기</title>
</head>
<h1>content_view.jsp</h1>
<body>
	<table width="500" cellpadding=0 border="1">
		<form action="nb_modify" method="post">
		
			<input type="hidden" name="nb_num" value="${nb_content_view.nb_num}">
			
			<tr>
			<td>번호</td><td>${nb_content_view.nb_num}</td>
			</tr>
			
			<tr>
			<td>히트</td><td>${nb_content_view.nb_count}</td>
			</tr>
			
			<tr>
			<td>이름</td><td><input type="text" name="nb_writer" value="${nb_content_view.nb_writer}"></td>
			</tr>
			
			<tr>
			<td>제목</td><td><input type="text" name="nb_title" value="${nb_content_view.nb_title}"></td>
			</tr>
			
			<tr>
			<td>내용</td><td><textarea rows="10" name="nb_contents">${nb_content_view.nb_content}</textarea></td>
			</tr>
			
			<tr>
			<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
			<a href="list">목록보기</a>&nbsp;&nbsp;
			<a href="nb_delete?nb_num=${nb_content_view.nb_num}">삭제</a>&nbsp;&nbsp;</td>
			</tr>
			
		</form>
	</table>	
</body>
</html>