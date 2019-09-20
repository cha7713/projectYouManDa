<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
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
		location = 'mypage/${id}';
	}

	function freeboard(){
		location = 'englishhome/freeboard';
	}

	function homeboard(){
		location = 'mypage/homeboard';
	}

	function infoboard(){
		location = 'mypage/infoboard';
	}

	function marketboard(){
		location = 'mypage/marketboard';
	}

	function meetboard(){
		location = 'mypage/meetboard';
	}

	function nonameboard(){
		location = 'mypage/nonameboard';
	}

</script>