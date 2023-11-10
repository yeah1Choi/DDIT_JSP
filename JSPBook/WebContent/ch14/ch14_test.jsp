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
                   			아이디, 비밀번호를 process 페이지로 넘겨 인증 처리를 진행
                   			이때 아이디 저장 체크를 하고 로그인 성공 시 쿠키를 저장해 저장된 쿠키로 인대
                   			다시 로그인 페이지를 reload하면 아이디 저장이 체크가 되어있고 아이디 입력란에
                   			아이디가 입력된 상태에 로그인 페이지가 나타나게 한다.
                   			
                   			아이디 저장 체크를 하지 않고 로그인 성공 시 쿠키를 저장하지 않고
                   			다시 로그인 페이지를 reload할 때 아이디 저장이 체크가 되어 있지 않는 상태로 페이지가 나타나게 하시오.
                   			아이디로 입력되어있지 않게 한다.
                   		 -->
                   		 <%
                   		 	boolean cookieFlag = false;
                   		 	String id = "";
                   		 	
                		 	Cookie[] cookies = request.getCookies();
                   		 	if(cookies != null){
                   		 		for(int i = 0; i < cookies.length; i++){
                   		 			Cookie cookie = cookies[i];
		                   		 	if(cookie.getName().equals("check")){
		                   		 		id = cookie.getValue(); // 쿠키에 저장된 아이디를 저장
		                   		 		cookieFlag = true; // 아이디 저장 체크 했네
		                   		 	}
		               		 	}
                   		 	}
                   		 %>
                   		 <form action="ch14_test_process.jsp" method="post">
                   		 	아이디 : <input type="text" name="id" value="<%=id%>"> 
                   		 	<input type="checkbox" name="check" value="Y" <%if(cookieFlag){%>checked = "checked"<% }%>>아이디 저장 <br>
                   		 	비밀번호 : <input type="text" name="pw"> <br>
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