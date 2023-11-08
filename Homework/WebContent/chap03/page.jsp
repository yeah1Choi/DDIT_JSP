<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Date day = new Date();
Double math = Math.pow(5, 2);
%>
현재 날짜 : <%=day%><br/>
5의 제곱 : <%=math%><br/>
</body>
</html>