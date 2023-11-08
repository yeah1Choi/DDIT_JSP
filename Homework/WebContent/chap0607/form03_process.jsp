<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>선택한 과일</h4>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String[] fruits = request.getParameterValues("fruit");
		
		for(int i = 0; i < fruits.length; i++){
			out.print(fruits[i] + " ");
		}
	%>
</body>
</html>