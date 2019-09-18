<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% HttpSession session2 =request.getSession(); 
String a = (String)session2.getAttribute("id");
request.setAttribute("a", a);
%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>유</h1>
	<h3>학생을</h3>
	<h1>만</h1>
	<h3>나</h3>
	<h1>다</h1>
<c:if test="${a==null}">
	<button type="button" onclick="loginform()">로그인</button>
	<button type="button" onclick="joinform()">회원가입</button>
</c:if>	
<c:if test="${a!=null}">
<button type="button" onclick="logout()">로그아웃</button>
</c:if>

	<script>
		function loginform() {
			location = "login";
		}
		function joinform() {
			location = "join";
		}
		function logout() {
			location = "logout";
		}
	
	</script>
	
	<br>
	<button type="button" onclick="enter()">영어권</button>
	<br>
	<script>
		function enter() {
			location = "englishhome";
		}
	</script>
	<button type="button" onclick="enter2()">중어권</button>
	<br>
	<script>
		function enter2() {
			location = "chinesehome";
		}
	</script>
	<button type="button" onclick="enter3()">일어권</button>
	<br>
	<script>
		function enter3() {
			location = "japanesehome";
		}
	</script>

</body>
</html>