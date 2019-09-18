<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>유</h1><h3>학생을</h3><h1>만</h1><h3>나</h3><h1>다</h1>

	<button type="button">로그인</button>
	<button type="button">회원가입</button><br>
	
	<button type="button"  onclick="enter()">영어권</button><br>
	<script>
	function enter(){
		location= "englishhome";
	}
	
</script>
	<button type="button"  onclick="enter2()">중어권</button><br>
	<button type="button"  onclick="enter3()">일어권</button><br>

</body>
</html>