<%@page import="ch11.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch11.dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<%
	request.setCharacterEncoding("utf-8");
	
	String noParam = request.getParameter("no");
	int no = Integer.parseInt(noParam);
	
	BoardRepository dao = BoardRepository.getInstance();
	ArrayList<BoardVO> list = dao.selectBoardList();
	
	BoardVO boardVO = null;
	for(int i = 0; i < list.size(); i++){
		BoardVO board = list.get(i);
		if (board != null && board.getNo() == no) {
			boardVO = new BoardVO();
			boardVO = board;
			break;
		}
	}
	%>
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
						1. 게시글 상세보기를 출력해주세요.
							> JSTL을 활용해주세요. 
						
						[출력 예]
						
						게시판 상세보기
						──────────────────────────────────────────────
						제목 : 
						작성자 작성일 조회수
						──────────────────────────────────────────────
						내용
						──────────────────────────────────────────────
						
						[ 수정  ] [ 삭제  ] [ 목록  ]
						
						2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
						3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
							> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
							> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
						4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
					 -->
					 
					 <table class="table table_bordered">
					 	<tr>
					 		<th>제목 : </th>
					 		<td colspan="2"><%=boardVO.getTitle()%></td>
					 	</tr>
					 	<tr>
					 		<td><%=boardVO.getWriter()%></td>
					 		<td><%=boardVO.getRegDate()%></td>
					 		<td><%=boardVO.getHit()%></td>
					 	</tr>
					 	<tr>
					 		<td colspan="3"><%=boardVO.getContent()%></td>
					 	</tr>
					 	<tr>
					 		<th>첨부파일 : </th>
					 		<td colspan="2"><a href="${pageContext.request.contextPath}/resources/<%= boardVO.getFileVO().getFileName() %>" download ><%=boardVO.getFileVO().getFileName()%></a></td>
					 	</tr>
					 	<tr>
					 		<td colspan="3">
					 			<input type="button" value="수정" onclick="goUpdate(<%= no %>)">
					 			<input type="button" value="삭제" onclick="goDelete(<%= no %>)">
					 			<input type="button" value="목록" onclick="goList()">
					 		</td>
					 	</tr>
					 </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>
	<%@ include file="/pageModule/footerPart.jsp" %>
	<script type="text/javascript">
		function goUpdate(no){
			location.href = "./boardUpdateForm.jsp?no="+no;
		}
		function goDelete(no){
			console.log(no)
		 	var result = confirm('정말로 삭제하시겠습니까?');

	        if(result) {
	           //yes
	        	location.href = "./boardRemove.jsp?no="+no;
	        } else {
	            //no
	        }
		}
		function goList(){
			location.href = "./boardList.jsp";
		}
	</script>
</body>
</html>