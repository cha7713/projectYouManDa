<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Kaushan+Script&display=swap"
	rel="stylesheet">
</head>
<body>



<a class="navbar-brand" href="/ymd/">YouManDa</a>
			

	<h1>자유게시판</h1>
	<table class="table">
	

		<tr>

			<th>말머리</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회</th>
			<th>추천</th>

		</tr>
		<br>
	
		<c:forEach items="${fblist}" var="list">
			<tr>
				<td>${list.header}</td>
				<td onclick="viewthispost(${list.bnum})">${list.title}</td>
				<td>${list.id}</td>
				<td>${list.bdate}</td>
				<td>${list.hit}</td>
				<td>${list.recomend}</td>
			</tr>

		</c:forEach>
	</table>
	



	<input type='button' value='create' id='write' onclick='writing()'>
	<br>


</body>

</html>

<script>
    function writing(){
		location = 'freeboard/freeboardwrite';
	}
	function viewthispost(bnum){
		location= "freeboard/freeboardin/"+bnum;
	}
	
</script>
<style>
.navbar-brand {
	font-family: 'Kaushan Script', cursive;
	font-size: 28px;
	margin-left: 400px;
	margin-top: 10px;
	color: #fed136;
	
}
</style>
