<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.setIntHeader("Refresh", 5);

	Calendar cal = Calendar.getInstance();

	int hour = cal.get(Calendar.HOUR);
	int min = cal.get(Calendar.MINUTE);
	int sec = cal.get(Calendar.SECOND);
	int apm = cal.get(Calendar.AM_PM);
	
	String ap = "";
	
	if(apm == 0) {
		ap = "AM";
	} else {
		ap = "PM";
	}
%>
현재 시간은 <%=hour+":"+min+":"+sec+" "+ap%> <br>
<a href="response_data.jsp">Google 홈페이지로 이동</a>
</body>
</html>