<%@page import="java.util.Enumeration"%>
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
                        <h1 class="page-title">폼 태그</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH06</li>
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
	                   	아이디 : a001
	                   	비밀번호 : 1234
	                   	이름 : 홍길동
	                   	연락처 : 010-1234-1234
	                   	성별 : 남자
	                   	취미 : 운동 독서 영화 여행
	                   	소개 : 안녕하세요! 반갑습니다!
	                   		저는 홍길동이라고 합니다!
	                   		
	                   	출력은 JSTL을 이용한 출력으로 해주세요(Core 적극 활용)
	                   	 -->
                   		<%
                   		request.setCharacterEncoding("utf-8");
                   		
                   		String id = request.getParameter("id");
                   		String pw = request.getParameter("pw");
                   		String name= request.getParameter("name");
                   		String phone1= request.getParameter("phone1");
                   		String phone2= request.getParameter("phone2");
                   		String phone3= request.getParameter("phone3");
                   		String gender= request.getParameter("gender");
                   		String gen = ""; // 성별을 출력할 문자열 변수
                   		String[] hobby= request.getParameterValues("hobby");
                   		String hobi = ""; // 취미배열을 출력할 문자열 변수
                   		String comment= request.getParameter("comment");
                   		
                   		if(gender.equals("F")){
                   			gen = "여자";
                   		} else {
                   			gen = "남자";
                   		}
                   		if(hobby != null){
       						for(int i=0;i<hobby.length;i++){
       							hobi += " "+hobby[i];
       						}
       					}
                   		%>
                   		
                   		<c:set value="<%=id %>" var="mem_id"/>
                   		<c:set value="<%=pw %>" var="mem_pw"/>
                   		<c:set value="<%=name %>" var="mem_nm"/>
                   		<c:set value="<%=phone1 %>" var="mem_tel01"/>
                   		<c:set value="<%=phone2 %>" var="mem_tel02"/>
                   		<c:set value="<%=phone3 %>" var="mem_tel03"/>
                   		<c:set value="<%=gen %>" var="mem_gen"/>
                   		<c:set value="<%=hobi %>" var="mem_hob"/>
                   		<c:set value="<%=comment %>" var="mem_com"/>
                   		
                   		아이디 : <c:out value="${mem_id}"/> <br>
                   		비밀번호 : <c:out value="${mem_pw}"/><br>
                   		이름 : <c:out value="${mem_nm}"/><br>
                   		연락처 : <c:out value="${mem_tel01}"/> - <c:out value="${mem_tel02}"/> - <c:out value="${mem_tel03}"/><br>
                   		성별 : <c:out value="${mem_gen}"/><br>
                   		취미 : <c:out value="${mem_hob}"/><br>
                   		소개 : <c:out value="${mem_com}"/><br>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%@ include file="/pageModule/footer.jsp" %>
	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>