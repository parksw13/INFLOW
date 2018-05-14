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
		<form action="sr_modify" method="post">
		
			<input type="hidden" name="sr_num" value="${sr_content_view.sr_num}">
			
			<tr>
			<td>번호</td><td>${sr_content_view.sr_num}</td>
			</tr>
			
			<tr>
			<td>히트</td><td>${sr_content_view.sr_count}</td>
			</tr>
			
			<tr>
			<td>이름</td><td><input type="text" name="sr_writer" value="${sr_content_view.sr_writer}"></td>
			</tr>
			
			<tr>
			<td>제목</td><td><input type="text" name="sr_title" value="${sr_content_view.sr_title}"></td>
			</tr>
			
			<tr>
			<td>내용</td><td><textarea rows="10" name="sr_contents">${sr_content_view.sr_contents}</textarea></td>
			</tr>
			<tr>
			<td>첨부파일</td><td><a href="file_down?sr_upload=${sr_content_view.sr_upload}">${sr_content_view.sr_upload}</a><%-- <img src="resources/upload/${sr_content_view.sr_upload}"> --%> </td>
			</tr>
			<tr>
			<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
			<a href="sr_list">목록보기</a>&nbsp;&nbsp;
			<a href="sr_delete?sr_num=${sr_content_view.sr_num}">삭제</a>&nbsp;&nbsp;</td>
			</tr>
			
		</form>
	</table>	
</body>
</html>