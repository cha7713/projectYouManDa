<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/login.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/ymd/home">YouManDa</a>
		</div>

		<form id="slick-login" action="login" method="post">
			<label for="id">아이디</label> <input type="text" name="id"
				class="placeholder" placeholder="아이디"> <label for="password">비밀번호</label>
			<input type="password" name="pw" class="placeholder"
				placeholder="비밀번호"> <br> <input type="submit"
				value="로그인" id="submit">

			<div class="row">
				<div class="input-field col s6 m6 l6">
					<p class="margin medium-small">
						<a href="/ymd/join">회원가입</a>
					</p>
				</div>
				<div class="input-field col s6 m6 l6">
					<p class="margin right-align medium-small">
						<a href="/ymd/insertId" onclick="findpw()">비밀번호 찾기</a>
					</p>

				</div>
				<script>
					function findpw() {
						location = "insertId";
					}

					function msg() {
						var abc = '${msg}';
						if (abc != "") {
							alert(abc)
						}
					};
					msg()
				</script>
			</div>
		</form>
	</nav>
</body>


</html>