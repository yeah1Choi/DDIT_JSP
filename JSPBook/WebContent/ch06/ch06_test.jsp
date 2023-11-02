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
                   		<!-- 
                   		아이디, 비밀번호, 이름, 연락처, 성별, 취미, 소개를 입력받는 폼을 작성
                   		- 연락처는 selectbox를 활용
                   		- 성별은 radio
                   		- 취미는 checkbox
                   		- 소개는 textarea의 wrap속성을 hard로 설정
                   		
                   		입력받은 데이터는 모두 영문으로 설정
                   		- 성별, 취미 모두 영문 value로 설정
                   		- 성별 : 남자(M), 여자(F)
                   		- 취미 : 독서(book), 운동(exercise), 영화(movie), 음악(music), 여행(travel)
                   		
                   		ch06_test_process.jsp로 데이터 전송 후 해당페이지에서 마무리
                   		 -->
                   		<form action="ch06_test_process.jsp" method="post">
                   			아이디 : <input type="text" name="id" id="id"> 
                   				<input type="button" value="아이디 중복검사"> <br>
                   			비밀번호 : <input type="text" name="pw" id="pw"> <br>
                   			이름 : <input type="text" name="name" id="name"> <br>
                   			연락처 : <select name="phone1">
                   		 				<option value="010">010</option>
                   		 				<option value="011">011</option>
                   		 			</select> -
                   		 		<input type="text" id="phone2" name="phone2" maxlength="4" size="4"/> -
                   		 		<input type="text" id="phone3" name="phone3" maxlength="4" size="4"/> <br>
                   			성별 : <input type="radio" id="genderM" name="gender" value="M"/>남자&nbsp;
                   		 		 <input type="radio" id="genderF" name="gender" value="F"/>여자<br>
                   			취미 : <input type="checkbox" id="book" name="hobby" value="독서"/> 독서&nbsp;
                   		 		 <input type="checkbox" id="exercise" name="hobby" value="운동"/> 운동&nbsp;
                   		 		 <input type="checkbox" id="movie" name="hobby" value="영화"/> 영화&nbsp;
                   		 		 <input type="checkbox" id="music" name="hobby" value="음악"/> 음악&nbsp;
                   		 		 <input type="checkbox" id="travel" name="hobby" value="여행"/> 여행&nbsp;<br>
                   			소개 : <textarea rows="20" cols="50" name="comment" wrap="hard" placeholder="가입 인사를 입력해주세요."></textarea><br>
                   		
                   		 		<input type="submit" value="전송하기">
                   		 		<input type="reset" value="취소하기">
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