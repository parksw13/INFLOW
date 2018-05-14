<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>resources_list.jsp</title>
</head>
<body>



<table border="1">

<tr>
<td>교보재 코드</td>
<td>입고일</td>
<td>구분</td>
<td>제품 이름</td>
<td>현 재고</td>
<td>총 수량</td>
<td>물품사진</td>
</tr>

<c:forEach var="resourcesbean" items="${resources_list}">
<tr>
<td>${resourcesbean.code}</td>
<td>${resourcesbean.b_day}</td>
<td>${resourcesbean.division}</td>
<td><a href="resources_content_view?code=${resourcesbean.code}">${resourcesbean.r_name}</a></td>
<td>${resourcesbean.stock}</td>
<td>${resourcesbean.max_stock}</td>
<td><img style="width:70; height:70;" src="resources/upload/${resourcesbean.r_file}"/></td>
</tr>
</c:forEach>

<tr>
<td><button type="button" onclick="location.href='resources_write_view'">제품 등록</button></td>
</tr>

</table>



</body>
</html>
