<%@page import="vo.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String realFolder = request.getServletContext().getRealPath("resource/images");
	String encType = "UTF-8";
	
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
	
	String bookId = "";
	String name = "";
	String unitPrice = "";
	String author = "";
	String publisher = "";
	String releaseDate = "";
	String totalPages = "";
	String description = "";
	String category = "";
	String unitsInStock = "";
	String condition = "";
	String bookImage = "";
	
	
	while(params.hasNext()){
		FileItem item = (FileItem) params.next();
		
		if(item.isFormField()) { // 일반데이터 경우
			String filedName = item.getFieldName();
			
			if(filedName.equals("bookId")){
				bookId = item.getString(encType);
			} else if(filedName.equals("name")){
				name = item.getString(encType);
			} else if(filedName.equals("unitPrice")){
				unitPrice = item.getString(encType);
			} else if(filedName.equals("author")){
				author = item.getString(encType);
			} else if(filedName.equals("publisher")){
				publisher = item.getString(encType);
			} else if(filedName.equals("releaseDate")){
				releaseDate = item.getString(encType);
			} else if(filedName.equals("totalPages")){
				totalPages = item.getString(encType);
			} else if(filedName.equals("description")){
				description = item.getString(encType);
			} else if(filedName.equals("category")){
				category = item.getString(encType);
			} else if(filedName.equals("unitsInStock")){
				unitsInStock = item.getString(encType);
			} else if(filedName.equals("condition")){
				condition = item.getString(encType);
			}
		} else { // 파일데이터 경우
			String fileFieldName = item.getFieldName(); // 요청 파라미터 이름
			bookImage = item.getName(); // 저장 파일의 이름
			String contentType = item.getContentType(); // 파일 컨텐츠 타입
			long filesize = item.getSize(); // 파일 크기 정보
			File saveFile = new File(realFolder+"/"+bookImage);
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
	
	// 총 페이지 수를 문자에서 숫자로 변경
	Integer pages;
	if(totalPages.isEmpty()){
		pages = 0;
	} else {
		pages = Integer.valueOf(totalPages);
	}
	
	// 재고수를 문자에서 숫자로 변경
	long stock;
	if(unitsInStock.isEmpty()){
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book book = new Book();
	book.setBookId(bookId);
	book.setName(name);
	book.setUnitPrice(price);
	book.setAuthor(author);
	book.setPublisher(publisher);
	book.setReleaseDate(releaseDate);
	book.setTotalPages(pages);
	book.setDescription(description);
	book.setCategory(category);
	book.setUnitsInStock(stock);
	book.setCondition(condition);
	book.setFilename(bookImage);
	
	dao.addBook(book);
	
	response.sendRedirect("books.jsp");
%>