<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>메뉴</title>
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
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH01</li>
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
						1. 메뉴 페이지를 작성해주세요.
						
						[출력 예시]
						
						메뉴
						_____________________
						[  게시판    ] [  자료실    ]
						
						2. 게시판 버튼을 클릭 시, 게시판 페이지(boardList.jsp)로 이동합니다.
						3. 자료실 버튼을 클릭 시, 자료실 페이지(dropbox.jsp)로 이동합니다.  
					 -->
					 <h3>메뉴를 선택해주세요 !!</h3>
					 <p>1. <input type="button" value="게시판" onclick="goBoard()"></p>
					 <p>2. <input type="button" value="자료실" onclick="goList()"></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>
	<%@ include file="/pageModule/footerPart.jsp" %>
	<script type="text/javascript">
		function goBoard(){
			location.href = "./boardList.jsp";
		}
		function goList(){
			location.href = "./dropbox.jsp";
		}
	</script>
</body>
</html>