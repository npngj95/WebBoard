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
request.setCharacterEncoding("utf-8");

String[] noticeCheck = request.getParameterValues("noticeCheck");
int noticeCheckLength = noticeCheck.length;
%>

<div>
<%
for(String value : noticeCheck) {
	out.println(value + "<br>");	
}
%>

</div>
</body>
</html>