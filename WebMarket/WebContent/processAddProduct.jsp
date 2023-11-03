<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// String realFolder = request.getRealPath("/")+"upload"; // 더이상 사용 X
	String realFolder = request.getServletContext().getRealPath("resources/images");
	String encType = "UTF-8"; // 인코딩 타입
	
	int maxSize = 5 * 1024 * 1024; // 최대 업로드 될 파일 크기 (5MB)
	
	File folder = new File(realFolder);
	if(!folder.exists()){
		folder.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000); // 최대크기
	upload.setSizeThreshold(maxSize); // 메모리상에 저장할 최대크기(byte)
	upload.setRepositoryPath(realFolder); // 업로드된 파일을 임시로 저장할 경로
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	String productId = "";
	String name = "";
	String unitPrice = "";
	String description = "";
	String manufacturer = "";
	String category = "";
	String unitsInStock = "";
	String condition = "";
	String fileName = "";
	
	// 일반적인 데이터를 저장할 때 사용(방법1)
	/* 	
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	*/
	
	while(params.hasNext()){
		FileItem item = (FileItem) params.next();
		
		if(item.isFormField()) { // 일반데이터 경우
			String filedName = item.getFieldName();
			
			if(filedName.equals("productId")){
				productId = item.getString(encType);
			} else if(filedName.equals("name")){
				name = item.getString(encType);
			} else if(filedName.equals("unitPrice")){
				unitPrice = item.getString(encType);
			} else if(filedName.equals("description")){
				description = item.getString(encType);
			} else if(filedName.equals("manufacturer")){
				manufacturer = item.getString(encType);
			} else if(filedName.equals("category")){
				category = item.getString(encType);
			} else if(filedName.equals("unitsInStock")){
				unitsInStock = item.getString(encType);
			} else if(filedName.equals("condition")){
				condition = item.getString(encType);
			}
		} else { // 파일데이터 경우
			String fileFieldName = item.getFieldName(); // 요청 파라미터 이름
			fileName = item.getName(); // 저장 파일의 이름
			String contentType = item.getContentType(); // 파일 컨텐츠 타입
			long filesize = item.getSize(); // 파일 크기 정보
			File saveFile = new File(realFolder+"/"+fileName);
			item.write(saveFile); // 파일복사
		}
	}
	
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
	product.setFilename(fileName);
	
	dao.addProduct(product);
	
	response.sendRedirect("products.jsp");
%>









