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
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="/ymd/">YouManDa</a> <i
				class="fas fa-bars"></i>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#first">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#portfolio">정보게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#services">모임게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/ymd/mypage/${id}">익명게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/ymd/logout" id="logout">장터</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#services">같이살자</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/ymd/mypage/${id}">마이페이지</a></li>
				
					</ul>
			</div>

		</div>
	</nav>
	
			

	<h1>자유게시판</h1>
	<table class="table table-bordered">

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
	



	<input type='button' value='글쓰기' id='write' onclick='writing()'  class="btn btn-outline-warning btn-sm">
	<br>
<ul class="pagination">  
    <li class="page-item"><a class="page-link" href="#">이전</a></li> 
    <li class="page-item2"><a class="page-link" href="#">다음</a></li>  
</ul>

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
	color: #fed136;
	font-size: 27px;
}

h1 {
	font-size: 35px;
	margin-top: 100px;
	text-align: center
}


@media ( min-width :992px) {
	#mainNav {
		padding-top: 5px;
		padding-bottom: 5px;
		transition: padding-top .3s, padding-bottom .3s;
		border: none;
		background-color: #000000;
	}
	#mainNav .navbar-nav .nav-item .nav-link {
		padding: 1.1em 1em !important
	}
}

#write {
	margin-top: 30px;
	margin-left: 47%
}


#page-item2{
	flaot : right;
}


</style>
