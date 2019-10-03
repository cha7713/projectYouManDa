<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Kaushan+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<script
	src='https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js'></script>
<script
	src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
​

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
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/ymd/logout" id="logout">로그아웃</a></li>

				</ul>
			</div>

		</div>
	</nav>


	<div class="container">
		<h1>자유게시판</h1>
		<table class="table table-bordered" id="target">

			<tr>

				<th>말머리</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>조회</th>
				<th>추천</th>

			</tr>
		

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

		<input type='button' value='글쓰기' id='write' onclick='writing()'
			class="btn btn-dark btn-sm">

		<form name="form1" action='list.do'>

			<select name="search_option" class="form-control"
				style="width: 15%; height: 4%">

				<option value="user_id"
					<c:if test="${map.search_option == 'id'}">selected</c:if>>작성자</option>

				<option value="title"
					<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>

				<option value="content"
					<c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>

				<option value="all"
					<c:if test="${map.search_option == 'all'}">selected</c:if>>작성자+내용+제목</option>


			</select>
		</form>

		<div class="container mt-3">
			<div class="input-group mb-3"
				style="margin-left: 15%; margin-top: -5%; width: 25%; height: 4%">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요">
				<div class="input-group-append">
					<button class="btn btn-dark btn-sm" type="submit"
						value="${map.keyword}">조회</button>
				</div>
			</div>
		</div>

	</div>



	<br>


</body>



<script>
    function writing(){
		location = 'freeboard/freeboardwrite';
	}
	function viewthispost(bnum){
		location= "freeboard/freeboardin/"+bnum;
	}


</script>

<style>


#mainNav .navbar-toggler {
	font-size: 12px;
	right: 0;
	padding: 13px;
	text-transform: uppercase;
	color: #fff;
	border: 0;
	background-color: #fed136;
	font-family: Montserrat, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji',
		'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji',
}

#mainNav .navbar-brand {
	color: #fed136;
	font-family: 'Kaushan Script', -apple-system, BlinkMacSystemFont,
		'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif,
		'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol',
		'Noto Color Emoji'
}

#mainNav .navbar-nav .nav-item .nav-link {
	font-size: 90%;
	font-weight: 400;
	padding: .75em 0;
	letter-spacing: 1px;
	color: #fff;
	font-family: Montserrat, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji',
		'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'
}

#mainNav .navbar-nav .nav-item .nav-link.active, #mainNav .navbar-nav .nav-item .nav-link:hover
	{
	color: #fed136
}


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
	margin-top: 5px;
	margin-left: 94.5%;
}

#page-item2 {
	flaot: right;
	margin-top: -10px
}
</style>
