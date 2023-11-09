<%@page import="java.util.ArrayList"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	if(id == null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	ArrayList<Product> cartlist = (ArrayList<Product>)session.getAttribute("cartlist");
	Product goodsQnt = new Product();
	
	for(int i=0;i < cartlist.size(); i++){
		goodsQnt = cartlist.get(i);
		
		if(goodsQnt.getProductId().equals(id)){
			cartlist.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>