<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	// 가격을 문자에서 숫자로 변경
	Integer price;
	if(unitPrice.isEmpty()){
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}
	
	// 재고수를 문자에서 숫자로 변경
	long stock;
	if(unitsInStock.isEmpty()){
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = new Product();
	product.setProductId(productId);
	product.setPname(name);
	product.setUniPrice(price);
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitsInStock(stock);
	product.setCondition(condition);
	
	dao.addProduct(product);
	
	response.sendRedirect("products.jsp");
%>









