<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link id="callCss" rel="stylesheet"
	href="<c:url value="/template/NguyenHoangAnhVu/themes/bootshop/bootstrap.min.css"/>"
	media="screen" />
<link href="<c:url value="/template/NguyenHoangAnhVu/themes/css/base.css"/>"
	rel="stylesheet" media="screen" />
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
	<button class="btn-primary">Check</button>


</body>

</html>