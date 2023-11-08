<%@page import="ch11.vo.BoardFileVO"%>
<%@page import="ch11.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ch11.dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>자료실</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
<style type="text/css">
	img {
		width: 300px !important;
	}
</style>
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
						첨부한 파일들을 확인 할 수 있는 자료실 페이지를 구성해주세요.
						- 자료실을 구성하는데 필요한 내용 모두는 board를 작성했던 방식을 참고하여 작성한다.
						
						1. 파일의 유형에 따라 유형에 맞는 default 이미지로 리스트를 구성하세요.
						
						[출력 예]
						
						자료실
						[pdf]	[excel]	[excel]	[ppt]
						[image] [txt]	[word]	[txt]
						[etc]	[etc]	[pdf]	[ppt]
						[...]
						
						목록 
					 -->
					 <input type="button" value="게시판" onclick="goList()">
					 <input type="button" value="로그아웃" onclick="goLog()">
					 <hr>
					 <h2>자료실</h2>
					 <hr>
					 <%
					 request.setCharacterEncoding("utf-8");
					 
					 BoardRepository dao = BoardRepository.getInstance();
					 ArrayList<BoardVO> list = dao.selectBoardList();
					 
					 BoardVO boardVO = null;
					 BoardFileVO fileVO = null;
					 for(int i=0;i<list.size();i++){
						 boardVO = list.get(i);
						 fileVO = boardVO.getFileVO();
					 %>
					 	<div>
					 		<img src="${pageContext.request.contextPath}/resources/<%= fileVO.getFileName() %>">
					 		<p>파일명 : <a href="${pageContext.request.contextPath}/resources/<%= fileVO.getFileName() %>" download><%= fileVO.getFileName() %></a></p>
					 		<p>크기 : <%= fileVO.getFileSize() %></p>
					 	</div>
					 <%
					 }
					 %>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>
	<%@ include file="/pageModule/footerPart.jsp" %>
	<script type="text/javascript">
		function goList(){
			location.href = "./boardList.jsp";
		}
		function goLog(){
			location.href = "./login.jsp";
		}
	</script>
</body>
</html>