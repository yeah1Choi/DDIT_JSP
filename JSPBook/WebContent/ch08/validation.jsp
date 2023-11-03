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
                        <h1 class="page-title">유효성 검사</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH08</li>
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
                   		<!-- 자바 스크립트의 onsubmit 이벤트 --><!-- return을 통해서 이벤트 함수 조정이 쉽다. 만약 false값이 반환된 경우 넘어가는 것 자체를 막아서 쉽다는 것 -->
                   		
                   		<!-- 
                   			input type button/submit은 아주 예전부터 익히 사용되어왔던 대표적인 버튼 element다
                   			브아루저 엔진 버전과 html 버전이 업그레이드되면서 input type button/submit만이 대체할 수 없는 
                   			부분들이 발견되어 새롭게 만들어진 태그가 button태그다. input type button/submit은 end 태그
                   			로서의 활용이 어려워(</input>) CSS를 활용하여 또는 태그들을 활용하여 버튼을 꾸미는데 제약이 많이 걸렸다.
                   			button 태그는 몸체를 꾸밀 수 있다는 장점도 있어 CSS를 활용하는 건 물론 버튼 태그 내에 다양한 태그를 활용하여
                   			버튼을 꾸밀 수 있다.
                   			그리고 input type button에서 제공되는 click, submit 또한 제공된다
                   			
                   			우리가 다양하게 사용하고 있는 버튼 이벤트 중, submit이라는 이벤트는 기본적으로 form 태그 내에 있는
                   			input 요소들의 데이터를 읽어 action에 설정되어 있는 경로로 데이터를 보내주는 역확을 하는데, submit()
                   			이벤트 자체만으로 본다면 브라우저마다의 엔진별 특징이 조금씩 다르다. 그리고 submit() 이벤트 자체에 컨트롤이 
                   			생각보다 어려운 곳도 있다. 대표적으로는 브라우저의 엔진별 로직과 시점이다. 사용자가 사용하는 다양한
                   			환경의 needs를 맞춰 개발하기 어렵지만 누구나 사용가능한 공통 처리 로직을 구현하는 건 어렵지 않다.
                   			개발자들의 관례로 사용되는 내용들이 여기에도 포함된다.
                   			예) ServiceImpl에서 impl은 인터페이스를 implements했다는 증거
                   			- input type submit 버튼에는  onclick 요소를 활용하여 클릭 이벤트를 함께 주지 않는다.
                   				> click과 submit이벤트의 시점과 브라우저 버전별, 엔진 처리 로직의 차이 때문
                   				
                   			# onsublit 속성 이벤트 활용
                   			- onsubmit 이벤트는 모든 브라우저 지원
                   			- onsubmit="return"
                   		 -->
                   		<form action="process.jsp" method="get" name="loginform" onsubmit="return submitEvent()">
                   			아이디 : <input type="text" name="id" /> <br>
                   			비밀번호 : <input type="text" name="pw" /> <br>
                   			<input type="submit" value="전송" />
                   		</form>
                   		
                   		<!-- JQuery form을 이용한 submit 이벤트 -->
                   		<form action="process.jsp" method="post" id="loginForm2">
                   			아이디 : <input type="text" name="id2" id="id2"/> <br>
                   			비밀번호 : <input type="text" name="pw2" id="pw2"/> <br>
                   			<input type="submit" value="전송" />
                   		</form>
                   		
                   		<!-- JQuery click 이벤트 -->
                   		<form action="process.jsp" method="post" id="loginForm3">
                   			아이디 : <input type="text" name="id3" id="id3"/> <br>
                   			비밀번호 : <input type="text" name="pw3" id="pw3"/> <br>
                   			<input type="submit" value="전송" id="loginBtn"/>
                   		</form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%@ include file="/pageModule/footer.jsp" %>
	<%@ include file="/pageModule/footerPart.jsp" %>
	
	<script type="text/javascript">
	// 자바 스크립트 onsubmit 이벤트 처리
	function submitEvent(){
		console.log("submitEvent");
		alert("submitEvent");
		
		var id = document.loginForm.id.value;
		var pw = document.loginForm.pw.value;
		
		if(id == ""){
			alert("아이디가 누락되었습니다.");
			return false;
		}
		if(pw == ""){
			alert("비밀번호가 누락되었습니다.");
			return false;
		}
	}
	
	// 제이쿼리를 통한 이벤트 처리
	$(function(){
		/* 
		$("#loginForm2");는 form태그에 대한 객체 = form태그!,
		변수 loginForm2에는 결과적으로 form태그의 주소가 저장된다.
		객체 자체를 가져가는 것보다 주소값만 저장해 넘기는 것이 데이터크기를 생각하는 것!
		*/
		var loginForm2 = $("#loginForm2");
		
		var loginForm3 = $("#loginForm3");
		var loginBtn = $("#loginBtn");
		
		/* 제이쿼리의 submit을 조작할 수 없다 >> form의 input submit을 통해 조작할 수 밖에 없다 */
		loginForm2.submit(function(event){
			event.preventDefault(); // 들어온 이벤트를 block 시킴
			var id = $("#id2").val();
			var pw = $("#pw2").val();
			
			if(id == ""){
				alert("아이디가 누락되었습니다.");
				return false;
			}
			if(pw == ""){
				alert("비밀번호가 누락되었습니다.");
				return false;
			}
			
			/* 정상적으로 입력해서 이 코드를 모두 지나치면 submit 해야하기 때문에 */
			loginForm2.submit();
		});
		
		loginBtn.on('click',function(){
			var id = $("#id3").val();
			var pw = $("#pw3").val();
			
			if(id == ""){
				alert("아이디가 누락되었습니다.");
				return false;
			}
			
			if(pw == ""){
				alert("비밀번호가 누락되었습니다.");
				return false;
			}
			
			loginForm3.submit();
		})
	})
	</script>
</body>
</html>