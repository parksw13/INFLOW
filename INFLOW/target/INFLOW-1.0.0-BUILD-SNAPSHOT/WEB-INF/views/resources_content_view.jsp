<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resources_content_view.jsp</title>

<style type="text/css">
#img{
	width:250px;
	height:150px;
}
</style>

</head>
<body>
<h1>resources_content_view.jsp 파일입니다.</h1>

<form action="resources_modify" method="post">
<table width="500" cellpadding=2 border="1">
<input type="hidden" name="code" value="${resources_content_view.code}"/>

	<tr>
	<td> 교보재 코드 </td>
	<td> ${resources_content_view.code } </td> 
	</tr>
	
	<tr>
	<td> 입고일 </td>
	<td>${resources_content_view.b_day }</td>
	</tr>
	
	<tr>
	<td> 구분 </td>
	<td>${resources_content_view.division }</td>
	</tr>
	
	<tr>
	<td> 제품 이름 </td>
	<td>${resources_content_view.r_name }</td>
	</tr>
	
	<tr>
	<td> 현 재고 </td>
	<td> <input type="text" name="stock" value="${resources_content_view.stock }"></td>
	</tr>
	
	<tr>
	<td> 총 수량 </td>
	<td> <input type="text" name="max_stock" value="${resources_content_view.max_stock }"></td>
	</tr>
	
	<tr>
	<td> 제품 사진 </td>
	<td><img id="img" src="resources/upload/${resources_content_view.r_file}"/></td>
	</tr>
	
	
	
	<tr>
		<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp;
		<a href="resources_list">목록보기</a>&nbsp;&nbsp;
		<a href="resources_delete?code=${resources_content_view.code }">제품 삭제</a>&nbsp;&nbsp;</td>
	</tr>

</table>
</form>

</body>
</html>