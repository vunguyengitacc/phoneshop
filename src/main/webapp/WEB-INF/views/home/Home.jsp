<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>
</head>

<body>

	<c:if test="${not empty lst }">
		<c:forEach var="listValue" items="${lst}">
			<h1>Phone: ${listValue.phone}</h1>
			<h1>Password: ${listValue.password }</h1>
			<h1>Email: ${listValue.email }</h1>
		</c:forEach>
	</c:if>
	<c:if test="${empty lst }">
		<h1>Không tìm thấy tài khoản</h1>
	</c:if>



</body>

</html>