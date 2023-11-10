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
                        <h1 class="page-title">쿠키</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH14</li>
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
                   			넘겨받은 아이디와 비밀번호를 꺼낸 후
                   			임의로 설정한 아이디와 비밀번호가 일치하는 경우에 인증 성공! 메시지를 출력하고
                   			쿠키를 저장한다.
                   			
                   			일치하지 않는 정보인 경우 인증 실패! 메시지를 출력하고
                   			다시 로그인 페이지로 이동할 수 있는 버튼 제공
                   		 -->
                   		 <%
                   		 	String id = request.getParameter("id");
                   		 	String pw = request.getParameter("pw");
                   		 	String check = request.getParameter("check");
                   		 	
                   		 	if(id.equals("admin") && pw.equals("1234")){
                				out.println("인증 성공 ! <br/>");
                				out.println(id+"님 환영합니다 !<br/>");
                				out.println("<input type='button' value='로그인' onclick='goLog()' />");
	
                				Cookie cookie =null;
                				if(check != null){ // 아이디 저장 체크 true
                					cookie = new Cookie("check", id);
                				} else {
                					cookie = new Cookie("check", id);
                					cookie.setMaxAge(0);
                				}
                				response.addCookie(cookie);
                			} else {
                				out.println("인증 실패 !<br/>");
                				out.println("<input type='button' value='로그인' onclick='goLog()' />");
                   			}
                   		 %>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">
    	function goLog(){
    		location.href = "ch14_test.jsp";
    	}
    </script>
    <%@ include file="/pageModule/footer.jsp" %>
	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>