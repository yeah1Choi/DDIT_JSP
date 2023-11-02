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
                   		<form action="form04_process.jsp" method="post">
                   		 	아이디 : <input type="text" id="id" name="id" /> 
                   		 		<input type="button" value="중복확인"><br>
                   		 	비밀번호 : <input type="text" id="pw" name="pw" /> <br>
                   		 	이름 : <input type="text" id="name" name="name" /> <br>
                   		 	전화번호 : <select name="phone1">
                   		 				<option value="010">010</option>
                   		 				<option value="011">011</option>
                   		 				<option value="016">016</option>
                   		 				<option value="017">017</option>
                   		 				<option value="019">019</option>
                   		 			</select>
                   		 			 -
                   		 			<input type="text" id="phone2" name="phone2" maxlength="4" size="4"/> -
                   		 			<input type="text" id="phone3" name="phone3" maxlength="4" size="4"/> <br>
                   		 	성별 : <input type="radio" id="genderM" name="gender" value="M"/>남자&nbsp;
                   		 		 <input type="radio" id="genderF" name="gender" value="F"/>여자<br>
                   		 	취미 : <input type="checkbox" id="hobby1" name="hobby" value="독서"/> 독서&nbsp;
                   		 		 <input type="checkbox" id="hobby2" name="hobby" value="운동"/> 운동&nbsp;
                   		 		 <input type="checkbox" id="hobby3" name="hobby" value="영화"/> 영화&nbsp;<br>
                   		 	가입인사 : <textarea rows="20" cols="50" name="comment" wrap="hard" placeholder="가입 인사를 입력해주세요."></textarea>
                   		 	
                   		 	<!-- 
                   		 		textarea wrap 속성
                   		 		"off" : 줄바꿈 안함
                   		 		"soft" : 자동 줄바꿈
                   		 		"hard" : 자동 줄바꿈, 서버 전송 시 캐리지 리턴(엔터문자) 문자를 전달
                   		 		
                   		 		해당 속성은 html5에서 새롭게 추가된 기능
                   		 		"hard" 속성 값을 사용하면, cols 속성이 꼭 명시되어야합니다.
                   		 		
                   		 		"hard" 속성 값으로 설정 시, textarea 설정 크기안에서 enter를 치지않고 텍스트를 입력해 나갈 때
                   		 		textarea 가로 길이 오른쪽 맨 끝에 다다를때 자동으로 아래줄로 넘어가 작성이 되는데 이따 enter를 직접
                   		 		치지 않았지만 아래줄로 내려가 작성되기 때문에 그 부분에 개행문자가 부여될 수 있게 해준다.
                   		 		
                   		 		wrap이라는 속성은 데이터를 입력받는 페이지 내 textarea에서 설정한다고 하여 속성에 따른 값이
                   		 		제대로 설정되지 않는다. 스타일 요소와 함께 작성되어야 결과를 확인할 수 있다.
                   		 		style="white-space: pre-wrap;" 설정이 함께 있어야 결과를 확인할 수 있다.
                   		 	 -->
                   		 	
                   		 		<input type="submit" value="전송">
                   		 		<input type="reset" value="초기화">
                   		 		
                   		 		
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