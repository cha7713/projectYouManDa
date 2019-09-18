<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% HttpSession session2 =request.getSession(); 
String a = (String)session2.getAttribute("id");
request.setAttribute("a", a);
%>

<input type="button" value="MyPage" onclick="mypage()">
<html>
<head>

<title>로그인</title>
</head>
<body>
영어권
</body>
</html>

<script>
	function mypage(){
		location = 'mypage/${a}';
	}

</script>