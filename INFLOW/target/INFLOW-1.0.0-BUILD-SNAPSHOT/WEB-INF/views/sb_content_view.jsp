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
		<form action="sb_modify" method="post">
		
			<input type="hidden" name="sb_num" value="${sb_content_view.sb_num}">
			
			<tr>
			<td>번호</td><td>${sb_content_view.sb_num}</td>
			</tr>
			
			<tr>
			<td>히트</td><td>${sb_content_view.sb_count}</td>
			</tr>
			
			<tr>
			<td>이름</td><td><input type="text" name="sb_writer" value="${sb_content_view.sb_writer}"></td>
			</tr>
			
			<tr>
			<td>제목</td><td><input type="text" name="sb_title" value="${sb_content_view.sb_title}"></td>
			</tr>
			
			<tr>
			<td>내용</td><td><textarea rows="10" name="sb_contents">${sb_content_view.sb_contents}</textarea></td>
			</tr>
			
			<tr>
			<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
			<a href="list">목록보기</a>&nbsp;&nbsp;
			<a href="sb_delete?sb_num=${sb_content_view.sb_num}">삭제</a>&nbsp;&nbsp;</td>
			</tr>
			
		</form>
	</table>	
</body>
</html>