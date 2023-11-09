<%@page import="java.util.ArrayList"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	// 상품 ID 얻어오기
	String id = request.getParameter("id");

	// 상품 ID가 존재하지 않는 경우, 상품 목록 화면으로 이동
	if(id == null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	// dao instance 얻어오기
	ProductRepository dao = ProductRepository.getInstance();
	
	// 상품 ID로 상품 조회
	Product product = dao.getProductById(id);
	if(product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	// 상품 전체 조회
	ArrayList<Product> goodsList = dao.getAllProducts();
	
	// 전체 목록에서 ID에 해당하는 상품 꺼내기
	Product goods = new Product();
	for(int i = 0;i<goodsList.size(); i++){
		goods = goodsList.get(i);
		
		if(goods.getProductId().equals(id)){
			break;
		}
		// 상품 전체에서 ID가 같은 상품일 때 for문을 끝낸다.
	}
	
	// 카트 목록 꺼내오기
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	
	if(list == null){
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	
	// 세션에서 얻어온 cartlist에서 index에 해당하는 product를 꺼내 goodsQnt 변수에 주소 전달
	// 그 주소에 같은 상품일 경우 수량만 카운팅해서 셋팅
	int cnt = 0;
	Product goodsQnt = new Product();
	
	for(int i = 0; i < list.size(); i++){
		goodsQnt = list.get(i);
		
		if(goodsQnt.getProductId().equals(id)){
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	// 상품 수량이 0일 떄 1개로 셋팅
	if(cnt == 0){
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("product.jsp?id="+id);
%>