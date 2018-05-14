<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<h1>write_view.jsp 파일입니다.</h1>
	
	<form action="sr_write" method="post" enctype="multipart/form-data">
	<table width="500" cellpadding=0 cellspacing=0 border=1>
		<tr>
			<td>이름</td>
			<td><input type="text" name="sr_writer" size="50"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="sr_title" size="50"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="sr_contents" rows="10"></textarea></td>
		</tr>

		<tr>
			<td>첨부파일</td>
			<td><input type="file" name="sr_upload" size="50"></td>
		</tr>
		<tr>
			<td>등록</td>
			<td><input type="submit" value="전송" size="50"></td>
		</tr>
	</table>
	</form>
</body>
</html>