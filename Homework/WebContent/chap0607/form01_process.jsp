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
	StringBuffer name = new StringBuffer(request.getParameter("name"));
	StringBuffer address = new StringBuffer(request.getParameter("address"));
	StringBuffer mail = new StringBuffer(request.getParameter("mail"));
%>
<p>이름 : <%= name %></p>
<p>주소 : <%= address %></p>
<p>이메일 : <%= mail %></p>
</body>
</html>