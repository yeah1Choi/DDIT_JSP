<%@page import="vo.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<html>
<head>
<title>도서 목록</title>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="/pageModule/menu.jsp" %>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">도서 목록</h1>
		</div>
	</div>
    <%
    	BookRepository dao = BookRepository.getInstance();
    	ArrayList<Book> listOfBooks= dao.getAllBooks();
    %>
	<div class="container">	
		<div class="row">
			<%
				for(int i=0;i<listOfBooks.size();i++){
	                Book b = listOfBooks.get(i);
			%>
			<div class="col-md-3" align="center">	
				<img src="${pageContext.request.contextPath }/resource/images/<%=b.getFilename()%>" width="60%">
			</div>
			<div class="col-md-10">	
				<h5 ><%="["+b.getCategory()+"] " + b.getName()%></h5>
				<p style="padding-top: 10px"><%=b.getDescription()%></p> 
				<p><%=b.getAuthor() + " | " + b.getPublisher() + " | " + b.getUnitPrice() + "원"%></p>
			</div>	
			<div class="col-md-2"  style="padding-top: 60px">						    			 
				<a href="./book.jsp?id=<%=b.getBookId()%>" class="btn btn-secondary" role="button"> 상세정보 &raquo;></a>				
			</div>	
			<%
				}
			%>			
		</div>
		<hr>
	</div>	
	<%@ include file="/pageModule/bookfooter.jsp" %>
</body>
</html>
