<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	HttpSession session2 = request.getSession();
	String a = (String) session2.getAttribute("code");
	request.setAttribute("a", a);
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${a}

</body>
</html>