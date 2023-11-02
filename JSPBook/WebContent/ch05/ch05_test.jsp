<%@page import="java.util.Calendar"%>
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
                        <h1 class="page-title">내장객체</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH05</li>
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
                   		<!-- 
                   			아이디, 비밀번호, 이름, 성별, 전화번호, 주소를 입력받는 폼 양식을 구성하고
                   			ch05_test_process.jsp로 method방식 post로 전송해주세요
                   			
                   			작성을 완료했으면 ch05_test_process.jsp로 넘어가 처리를 마무리 해주세요
                   			
                   			아이디는 type = text
                   			비밀번호는 text
                   			이름은 text
                   			성별은 radio
                   			전화번호는 첫번째 자리 select
                   				       두번째 자리 text
                   				       세번째 자리 text
                   			주소는 text
                   			성별의  value는 한글이 아닌 영문으로 설정 후 데이터를 넘겨주세요.
                   		 -->
                   		 
                   		 <form action="ch05_test_process.jsp" method="post">
                   		 	아이디 : <input type="text" name="id" /> <br>
                   			비밀번호 : <input type="text" name="pw" /> <br>
                   			이름 : <input type="text" name="nm" /> <br>
                   			성별 : 
                   			<input type="radio" value="female" name="gen" id="r1"/> <label for="r1">여자</label> 
                   			<input type="radio" value="male"  name="gen" id="r2"/> <label for="r2">남자</label>  <br>
                   			전화번호 : <br>
                   			1) 첫번째 자리 : <select name="tel01">
                   						<option>010</option>
                   						<option>011</option>
                   						</select> <br>
                   			2) 두번째 자리 : <input type="text" name="tel02"/> <br>
                   			3) 세번째 자리 : <input type="text" name="tel03" /> <br>
                   			주소 : <input type="text" name="add" /> <br>
                   			<input type="submit" value="전송">
                   		 </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%@ include file="/pageModule/footer.jsp" %>
	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>