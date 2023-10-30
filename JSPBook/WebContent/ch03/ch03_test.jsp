<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>About Us - ClassiGrids Classified Ads and Listing Website Template</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/images/favicon.svg" />
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="/resources/assets/css/animate.css" />
    <link rel="stylesheet" href="/resources/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="/resources/assets/css/main.css" />

</head>

<body>
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">디렉티브 태그</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">INDEX</a></li>
                        <li>CH03</li>
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
                   			JSTL을 활용하여 아래 문제를 작성해주세요.
                   			1. 306호 학생 이름 모두를 Core태그 set에 저장한 후, 전체를 출력
                   				- 저장하는 방식은 다양하게
                   			2. 학생 4명씩 끊어서 출력
                   				이름 이름 이름 이름
                   				이름 이름 이름 이름
                   				이름 이름 이름 이름
                   				이름 이름 이름 이름
                   			3. 4명씩 끊어서 출력할 때, 본인의 이름은 '본인'으로 출력해주세요
                   				본인 글자는 굵은 글씨와 녹색으로 표시
                   		 -->
                   		 
                   		 <h3>306반 전체 인원</h3>
                   		 <br>
                   		 <%
                   		 	String[] names = {
                   		 		"유재석","박명수","하동훈","정준하",
                   		 		"최예원","홍길동","홍길순","정형돈",
                   		 		"노홍철","길성준","조세호","남창희",
                   		 		"김용명","이용진"
                   		 	};
                   		 
                   		 	List<String> nameList = new ArrayList<String>();

							for(int i = 0;i<names.length; i++) {
								nameList.add(names[i]);
							}
                   		 %>
                   		 <br>
                   		 <font color="red">전체 인원을 4명씩 끊어서 출력하고 자신의 이름을 달리 출력한다</font><br><br>
                   		 <c:set value="<%=nameList%>" var="names" />
                   		 <c:forEach items="${names}" var="name" varStatus="stat">
	                   		 <c:choose>
	                   		 	<c:when test="${name eq '최예원'}">
	                   		 		<font color="green"><b>본인</b></font>
	                   		 	</c:when>
	                   		 	<c:when test="${stat.count % 4 == 0}">
	                   		 		<c:out value="${name}"/> <br>
	                   		 	</c:when>
	                 		 	<c:otherwise>
									<c:out value="${name}"/>
								</c:otherwise>
	                   		 </c:choose>
                   		 </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <footer class="footer">
        <div class="footer-bottom">
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-12">
                            <div class="content">
                                <p class="copyright-text">대덕인재개발원 JSP</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <script src="/resources/assets/js/bootstrap.min.js"></script>
    <script src="/resources/assets/js/wow.min.js"></script>
    <script src="/resources/assets/js/tiny-slider.js"></script>
    <script src="/resources/assets/js/glightbox.min.js"></script>
    <script src="/resources/assets/js/count-up.min.js"></script>
    <script src="/resources/assets/js/main.js"></script>
    <script type="text/javascript">
        tns({
            container: '.client-logo-carousel',
            slideBy: 'page',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 15,
            nav: false,
            controls: false,
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 3,
                },
                768: {
                    items: 4,
                },
                992: {
                    items: 4,
                },
                1170: {
                    items: 6,
                }
            }
        });
    </script>
</body>

</html>