<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<html>
<head>

<title>로그인</title>
</head>
<body>

<form action="login" method="post">
	로그인 <br> 
	아이디:<input name="id" type="text"> <br>
	비밀번호:<input name="pw" type="password"> <br>
	
	<input type="submit" value="로그인" id="submit">
	
	<button type="button" onclick="findpw()">비밀번호 찾기</button>
	<script>
		function findpw() {
			location = "findpw";
		}
		
		()=>{
			var abc = '${msg}';
			if(abc!=null){
			alert(abc)
			}
		}
		
	</script>
	</form>

</body>
</html>