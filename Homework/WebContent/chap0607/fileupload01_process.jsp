<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*" %>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MultipartRequest multi = new MultipartRequest(request, "C:\\upload", 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());

	Enumeration params = multi.getParameterNames();
	
	String file = (String)multi.getFileNames().nextElement();
%>
요청 파라미터 이름 : <%=file%> <br>
실제 파일 이름 : <%=multi.getOriginalFileName(file)%> <br>
저장 파일 이름 : <%=multi.getFilesystemName(file)%> <br>
파일 컨텐츠 유형 : <%=multi.getContentType(file)%> <br>
파일 크기 : <%=file.length()%> <br>
</body>
</html>