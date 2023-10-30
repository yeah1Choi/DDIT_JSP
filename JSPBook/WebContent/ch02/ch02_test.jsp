<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>About Us - ClassiGrids Classified Ads and Listing Website
	Template</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/assets/images/favicon.svg" />
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
<link rel="stylesheet" href="/resources/assets/css/animate.css" />
<link rel="stylesheet" href="/resources/assets/css/tiny-slider.css" />
<link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>

<body>
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>

	<div class="breadcrumbs" style="padding-top: 40px;">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">스크립트 태그</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="index.html">INDEX</a></li>
						<li>CH02</li>
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
							구구단 1~9단까지 출력해주세요
							짝수 단인 경우에는 빨간색으로 출력
							정렬 기준을 2가지로 제공하고, 제공된 정렬에 따라 출력을 다르게 한다
							가로로 정렬, 세로로 정렬
						 -->
						<h3>구구단 1-9단까지 출력해주세요. 짝수 단인 경우에는 빨간색으로 출력해주세요!</h3>
						<select id="orderSelect">
							<option>--선택해주세요--</option>
							<option value=1>가로정렬</option>
							<option value=2>세로정렬</option>
						</select>
						<br>
						<div id="t1">
						<%
						String color = "";
						out.println("<table class='table tale-bordered' width='100%'>");
							for (int i = 1; i <= 9; i++) { // 앞 수 (단수)
								out.println("<tr align='center'>");
								for (int j = 1; j <= 9; j++) { // 뒷 수
									if (i % 2 == 0) { // 짝수조건
										color = "red";
									} else {
										color ="black";
									}
									out.println("<td><font color='"+color+"'>"+(i)+ " X " + (j) + " = " + (i) * (j) + "</font></td>");
								}
								out.println("</tr>");
							}
							out.println("</table>");
						%>
						</div>
						<div id="t2">
						<%
						out.println("<table class='table tale-bordered' width='100%'>");
							for (int i = 1; i <= 9; i++) { // 앞 수 (단수)
								out.println("<tr align='center'>");
								for (int j = 1; j <= 9; j++) { // 뒷 수
									if (j % 2 == 0) { // 짝수조건
										color = "red";
									} else {
										color ="black";
									}
									out.println("<td><font color='"+color+"'>"+(j)+ " X " + (i) + " = " + (i) * (j) + "</font></td>");
								}
								out.println("</tr>");
							}
							out.println("</table>");
						%>
						</div>
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
								<p class="copyright-text">
									대덕인재개발원 JSP</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<a href="#" class="scroll-top btn-hover"> <i
		class="lni lni-chevron-up"></i>
	</a>

	<script src="/resources/assets/js/bootstrap.min.js"></script>
	<script src="/resources/assets/js/wow.min.js"></script>
	<script src="/resources/assets/js/tiny-slider.js"></script>
	<script src="/resources/assets/js/glightbox.min.js"></script>
	<script src="/resources/assets/js/count-up.min.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script type="text/javascript">
		tns({
			container : '.client-logo-carousel',
			slideBy : 'page',
			autoplay : true,
			autoplayButtonOutput : false,
			mouseDrag : true,
			gutter : 15,
			nav : false,
			controls : false,
			responsive : {
				0 : {
					items : 1,
				},
				540 : {
					items : 3,
				},
				768 : {
					items : 4,
				},
				992 : {
					items : 4,
				},
				1170 : {
					items : 6,
				}
			}
		});
	</script>
	<script type="text/javascript">
	
	$(function(){
		var orderSelect = $("#orderSelect");
		$("#t1").hide();
		$("#t2").hide();
		
		orderSelect.on("change",function(){
			var value = $(this).val();
			
			if(value == "1"){
				$("#t1").show();
				$("#t2").hide();
			}
			else{
				$("#t2").show();
				$("#t1").hide();
			}
		});
	});
	
	</script>
</body>

</html>