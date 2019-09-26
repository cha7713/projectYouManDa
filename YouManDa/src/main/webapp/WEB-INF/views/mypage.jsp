<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						href="/ymd/englishhome/freeboard">자유게시판</a></li>
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


	<h1>마이 페이지</h1>
	<button id="check" onclick="checkMyPost()" class="btn btn-dark btn-sm">내
		게시물 확인</button>
	<button id="check2" onclick="checkMyReply()" class="btn btn-dark btn-sm">내
		댓글 확인</button>
	<br>
	<br>
	<br>
	<div class="container">
		<ul class="list-group">


			<li class="list-group-item">아이디 : ${personalinfo.id}</li>
			<li class="list-group-item">이름 : ${personalinfo.name}</li>
			<li class="list-group-item">별명 : ${personalinfo.nick}</li>

			<li class="list-group-item">성별 : <c:choose>
					<c:when test="${personalinfo.sex == 1}">
		MALE<br>
					</c:when>
					<c:otherwise>
		FEMALE<br>
					</c:otherwise>
				</c:choose></li>




			<li class="list-group-item">이메일 : ${personalinfo.email}</li>
			<li class="list-group-item">학교 : ${personalinfo.school}</li>
			<li class="list-group-item">주소 : ${personalinfo.address}</li>
			<li class="list-group-item">전화번호 : ${personalinfo.phonenum}</li>
			<li class="list-group-item">여권번호 : ${personalinfo.passnum}</li>
			<li class="list-group-item">생년월일 : ${personalinfo.birthday}</li>

			<li class="list-group-item">언어 : <c:choose>
					<c:when test="${personalinfo.lang == 1}">
		한국어 <br>
					</c:when>
					<c:when test="${personalinfo.lang == 2}">
		ENGLISH<br>
					</c:when>
					<c:when test="${personalinfo.lang == 3}">
		汉语<br>
					</c:when>
					<c:otherwise>
		日本語<br>
					</c:otherwise>
				</c:choose>
			</li>

		</ul>
	</div>



	<button id="edit" class="btn btn-outline-warning btn-sm"
		onclick='editmypage()'>수정</button>
	<button id="del" class="btn btn-outline-danger btn-sm"
		onclick='deleteMyAccount()'>회원탈퇴</button>

	<script>
		function editmypage() {
			location = '../mypageedit/${personalinfo.id}';
		}

		function deleteMyAccount() {
			location = '../deleteMyAccount';
		}

		function checkMyPost() {

		};

		function checkMyReply() {

		};
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

#edit {
	margin-top: 30px;
	margin-left: 47%
}

#del {
	margin-top: 30px;
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

#check {
	margin-left: 44%
}
#check2 {
	margin-left: 1%
}
</style>