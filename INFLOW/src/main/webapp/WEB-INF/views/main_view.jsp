<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INFLOW</title>
</head>
<body>
	<c:if test="${empty login_users.id}">
		<jsp:include page="home.jsp" />
	</c:if>
	<c:if test="${!empty login_users.id}">
		<jsp:include page="main.jsp" />
	</c:if>
</body>
</html>