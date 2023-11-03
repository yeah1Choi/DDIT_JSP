<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="exceptionNoProductId.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-5">
				<img alt="" src="${pageContext.request.contextPath }/resources/images/<%=product.getFilename()%>" style="width: 100%"/>
			</div>
			<div class="col-md-6">
				<h3></h3>
				<p></p>
				<p><b>상품 코드 : <%=product.getProductId() %></b><span class="badge badge-danger"></span></p>
				<p><b>제조사 : <%=product.getManufacturer() %></b></p>
				<p><b>분류 : <%=product.getCategory()%> </b></p>
				<p><b>재고수 : <%=product.getUnitsInStock()%></b></p>
				<h4><%=product.getUniPrice()%>원</h4>
				<form action="addCart.jsp?id=" method="post" name="addForm">
					<p>
						<a href="#" class="btn btn-info">상품 주문 &raquo;</a>
						<a href="cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
						<a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
					</p>
				</form>
			</div>
		</div>
		<hr/>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>