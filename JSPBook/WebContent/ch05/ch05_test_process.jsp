<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                   		<!-- 
                   			넘겨받은 데이터를 아래와 같이 출력해주세요
                   			
                   			아이디 : a001
                   			비밀번호 : 1234
                   			이름 : 홍길동
                   			성별 : 남자
                   			전화번호 : 010-1234-1234
                   			주소 : 대전광역시 중구 오류동 대덕인재개발원
                   			
                   			데이터 출력은 1) 스크립틀릿과 표현문을 이용한 방식 1개
                   					 2)	JSTL을 이용한 방식 1개
                   					 총 2가지 방식으로 출력해주세요
                   					 
                   			** 데이터를 출력 후, 5초 뒤에 네이버 홈페이지로 이동시켜주세요
                   		 -->
                   		<%
	                   		request.setCharacterEncoding("utf-8");
	                   		String id = request.getParameter("id");
	                   		String pw = request.getParameter("pw");
	                   		String nm = request.getParameter("nm");
	                   		String gen = request.getParameter("gen");
	                   		
	                   		String tel01 = request.getParameter("tel01");
	                   		String tel02 = request.getParameter("tel02");
	                   		String tel03 = request.getParameter("tel03");

	                   		String add = request.getParameter("add");
                   		%>
                   		<p>스크립틀릿 / 표현문을 이용한 출력</p>
                   		아이디 : <%= id %> <br>
                   		비밀번호 : <%= pw %> <br>
                   		이름 : <%= nm %> <br>
                   		성별 : <%= gen %> <br>
                   		전화번호 : <%= tel01 %> - <%= tel02 %> - <%= tel03 %> <br>
                   		주소 : <%= add %> <br>
                   		
                   		<hr>
                   		
                   		<p>JSTL을 이용한 출력</p>
                   		<c:set value="<%=id %>" var="mem_id"/>
                   		<c:set value="<%=pw %>" var="mem_pw"/>
                   		<c:set value="<%=nm %>" var="mem_nm"/>
                   		<c:set value="<%=gen %>" var="mem_gen"/>
                   		
                   		<c:set value="<%=tel01 %>" var="mem_tel01"/>
                   		<c:set value="<%=tel02 %>" var="mem_tel02"/>
                   		<c:set value="<%=tel03 %>" var="mem_tel03"/>
                   		
                   		<c:set value="<%=add %>" var="mem_add"/>
                   		
                   		아이디 : <c:out value="${mem_id}"/>
                   		비밀번호 : <c:out value="${mem_pw}"/>
                   		이름 : <c:out value="${mem_nm}"/>
                   		성별 : <c:out value="${mem_gen}"/>
                   		전화번호 : <c:out value="${mem_tel01}"/> - <c:out value="${mem_tel02}"/> - <c:out value="${mem_tel03}"/>
                   		주소 : <c:out value="${mem_add}"/>
                   		
                   		<%
                   		response.setHeader("Refresh", "5; https://www.naver.com/");
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