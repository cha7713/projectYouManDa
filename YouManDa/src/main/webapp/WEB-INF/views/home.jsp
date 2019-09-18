<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<<<<<<< HEAD
<%@ page pageEncoding="utf-8" session="false"%>
<!doctype html>
=======
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% HttpSession session2 =request.getSession(); 
String a = (String)session2.getAttribute("id");
request.setAttribute("a", a);
%>
>>>>>>> branch 'master' of https://github.com/cha7713/projectYouManDa.git
<html>
<head>
<<<<<<< HEAD

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Agency - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

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

<!-- Custom styles for this template -->
<link href="resources/css/agency.min.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">YouManDa</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">Menu</button>
		</div>
	</nav>

	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-heading text-uppercase">유학생을 만나다</div>
				<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
					onclick="loginform()">로그인</a> <a
					class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
					onclick="joinform()">회원가입</a>
				<script>
					function loginform() {
						location = "login";
					}
				</script>
				<script>
					function joinform() {
						location = "join";
					}
				</script>
			</div>
		</div>
	</header>


	<section class="page-section" id="services">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase" onclick="enter()">영어권</h2>
					<script>
						function enter() {
							location = "englishhome";
						}
					</script>
				</div>
			</div>
		</div>
	</section>
	<section class="bg-light page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase" onclick="enter2()">중어권</h2>
					<script>
						function enter() {
							location = "chinesehome";
						}
					</script>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section" id="services">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase" onclick="enter3()">일어권</h2>
					<script>
						function enter() {
							location = "japanesehome";
						}
					</script>
				</div>
			</div>
		</div>
	</section>
=======
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
>>>>>>> branch 'master' of https://github.com/cha7713/projectYouManDa.git

</body>
</html>