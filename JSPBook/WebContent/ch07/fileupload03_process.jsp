<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
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
                        <h1 class="page-title">파일업로드</h1>
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
                   		<!-- 내용 -->
                   		<%
                   			// 폼 페이지에서 전송된 파일을 저장할 서버의 경로를 작성
                   			String fileUploadPath = "C:\\upload";
                   		
                   			File file = new File(fileUploadPath);
                   			
                   			if(!file.exists()){ // 설정한 경로에 폴더가 없으면
                   				file.mkdirs(); 	// 폴더를 생성
                   			}
                   			
                   			// Commons-fileupload를 이용하여 파일을 업로드하려면 제일 먼저 common-fileupload 라이브러리가 필요
                   			// 파일 업로드를 위해 패티지를 포함되어있는 DiskFileUpload 객체를 생성함
                   			DiskFileUpload upload = new DiskFileUpload();
                   			// 생성된 객체를 통해 DiskFileUpload 클래스가 제공하는 메소드를 사용하여 웹 브라우저가 전송한
                   			// multipart/form-data 유형의 요청 파라미터를 가져옴
                   			// 폼 페이지에서 전송된 요청 파라미터를 전달받도록 DiskFileUpload 객체 타입의 parseRequest() 메소드를 작성
                   			List items = upload.parseRequest(request);
                   			// 폼 페이지에서 전송된 요청 파라미터를 Iterator 클래스로 변환
                   			Iterator params = items.iterator();
                   			
                   			// 폼 페이지에서 전송된 요청 파라미터가 없을 때까지 반복하도록 Iterator 객체 타입의
                   			// hasnext() 메소드를 작성
                   			while(params.hasNext()){
                   				FileItem fileItem = (FileItem) params.next();
                   				
                   				if(!fileItem.isFormField()){ // 파일 데이터일때
                   					String fileName = fileItem.getName(); // 파일명
                   					
                   					%>
                   						<p><%=fileName %>이 저장되었습니다!</p>
                   					<%
                   					// 이곳으로 업로드가 됩니다
                   					// C:\\upload\\KaKaoTalk+20231102_14_56.jpg
                   					File newFile = new File(fileUploadPath + "/" + fileName);
                   					fileItem.write(newFile); // 파일복사
                   				}
                   			}
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