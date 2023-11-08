<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach begin="0" end="10" step="2" var="num">
	<c:out value="${num}"/>
</c:forEach>
<br/>
<c:forEach begin="0" end="10" step="1" var="num">
	<c:if test="${num%2==0}">
		<c:out value="${num}"/>
	</c:if>
</c:forEach>
</body>
</html>