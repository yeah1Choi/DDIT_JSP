<%@page import="java.io.File"%>
<%@page import="ch07.MemberVO"%>
<%@page import="ch07.MemberDAO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%@ include file="/pageModule/headPart.jsp" %>
</head>

<body>
    <%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">회원가입</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH07</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!--
							1. 회원가입 폼에서 넘겨받은 일반 데이터, 파일 데이터를 전달받아서 일반 데이터와 파일명을 저장하여
								회원 객체 하나를 저장 후, 회원 목록에 해당하는 리스트에 저장하여 목록 페이지에서 리스트 데이터를
								활용할 수 있도록 해주세요.
							2. 회원가입이 완료되면, ch07_test_signin.jsp로 이동하여 로그인을 진행할 수 있도록 해주세요.
						 -->
						 <%
						 	request.setCharacterEncoding("UTF-8");
						 	response.setCharacterEncoding("UTF-8");
						 
							MemberDAO dao = MemberDAO.getInstance();
							MemberVO mem = new MemberVO();
						 
	                   		mem.setMem_name(request.getParameter("id"));
	                   		mem.setMem_pw(request.getParameter("pw"));
	                   		mem.setMem_name(request.getParameter("name"));
	                   		mem.setMem_sex(request.getParameter("sex"));
	                   		
	                   		// 파일 저장
	                   		String fileUploadPath = "C:\\upload";
	                   		File file = new File(fileUploadPath);
	                   		
	                   		if(!file.exists()){ 
                   				file.mkdirs(); 	
                   			}
	                   		
	                   		DiskFileUpload upload = new DiskFileUpload();
	                   		upload.setRepositoryPath(fileUploadPath);
	                   		
	                   		List items = upload.parseRequest(request);
	                   		Iterator params = items.iterator();
	                   		
	                   		while(params.hasNext()){
                   				FileItem fileItem = (FileItem) params.next();
                   				
                   				if(!fileItem.isFormField()){ // 파일 데이터일때
                   					String fileName = fileItem.getName(); 
                   					mem.setFilename(fileName);
                   				}
                   			}
	                   		dao.insertMember(mem);
	                   		
	                   		response.sendRedirect("ch07_test_signin.jsp");
						 %>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/pageModule/footer.jsp" %>

    <%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>