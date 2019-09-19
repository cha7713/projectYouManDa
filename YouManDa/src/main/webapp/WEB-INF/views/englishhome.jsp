<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	HttpSession session2 = request.getSession();
	String a = (String) session2.getAttribute("id");
	request.setAttribute("a", a);
%>
	
<input type="button" value="MyPage" id="MyPage" onclick="mypage()"><br>


<input type="button" value="freeboard" id="freeboard" onclick="freeboard()"><br>
<input type="button" value="homeboard" id="homeboard" onclick="homeboard()"><br>
<input type="button" value="infoboard" id="infoboard" onclick="infoboard()"><br>
<input type="button" value="marketboard" id="marketboard" onclick="marketboard()"><br>
<input type="button" value="meetboard" id="meetboard" onclick="meetboard()"><br>
<input type="button" value="nonameboard" id="nonameboard" onclick="nonameboard()"><br>


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

	function freeboard(){
		location = 'englishhome/freeboard';
	}

	function homeboard(){
		location = 'mypage/${a}';
	}

	function infoboard(){
		location = 'mypage/${a}';
	}

	function marketboard(){
		location = 'mypage/${a}';
	}

	function meetboard(){
		location = 'mypage/${a}';
	}

	function nonameboard(){
		location = 'mypage/${a}';
	}

</script>