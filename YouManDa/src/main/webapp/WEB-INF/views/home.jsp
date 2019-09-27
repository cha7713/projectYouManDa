<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<%
	HttpSession session2 = request.getSession();
	String a = (String) session2.getAttribute("id");
	request.setAttribute("a", a);
%>

<html>
<head>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>YouManDa</title>

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
<link
	href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap"
	rel="stylesheet" type='text/css'>
<link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet" type='text/css'>
<!-- Custom styles for this template -->
<link href="resources/css/agency.min2.css?var=3" rel="stylesheet">

</head>

<body id="page-top">


	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/ymd/">YouManDa</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				MENU <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#first">영어권</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#portfolio">중어권</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#services">일어권</a></li>
					<c:if test="${id==null}">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="/ymd/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="/ymd/join">회원가입</a></li>
					</c:if>
					<c:if test="${id!=null}">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="/ymd/mypage/${id}">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="/ymd/logout" id="logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="javascript:popup()" id="scf">친구찾기</a></li>
						<li><a onclick="javascript:popMsg()"><img id="letterx"
								style="width: 30px; margin-top:10px" /><span id="msg"></span></a></li>
						<li><a id="black" onclick="popup2()"><img id="yellow"
								style="width: 35px;margin-top:10px;margin-left:10px" /><span id="req"></span></a></li>


						<!-- 						<li class="nav-item"><a class="nav-link js-scroll-trigger" -->
						<!-- 							href="javascript:popMsg()" id="msg">쪽지함</a></li> -->


					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<c:if test="${id!=null}">
		<jsp:include page="remotecontroller.jsp" flush="false" />
	</c:if>

	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="title">유학생을 만나다</div>
				<c:if test="${a==null}">
					<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
						href="/ymd/login">로그인</a>
					<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
						href="/ymd/join">회원가입</a>
				</c:if>
				<c:if test="${a!=null}">
					<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
						onclick="mypage()">마이페이지</a>

				</c:if>
				<script>
					function popup() {
						var url = "/ymd/searchfriend";
						var name = "searchfriend";
						var option = "width = 500, height = 500, top = 100, left = 200, location = no"
						window.open(url, name, option);
					}
					function popMsg() {
						var url = "/ymd/msgList";
						var name = "msgList";
						var option = "width = 500, height = 500, top = 100, left = 200, location = no"
						window.open(url, name, option);
					}
					function loginform() {
						location = "login";
					}
					function joinform() {
						location = "join";
					}
					function logout() {
						location = "logout";
					}
					function mypage() {
						location = 'mypage/${a}';
					}

					function popup2() {
						var url = "/ymd/ar";
						var name = "searchfriend";
						var option = "width = 500, height = 500, top = 100, left = 200, location = no"
						window.open(url, name, option);
					}
					function action_reload() {
						location.reload();
					}

					// 					 function ar() {
					// 						 $.ajax({
					// 						        url:"alarm",

					// 						        success: function(res){
					// 						            console.log(res);
					// 						            for (var i = 0; i < res.length; i++) {
					//  						            $('#req').append('<option>'+res[i].id2+'님의 친구신청입니다'+'<button>수락</button><button>거절</button>'+'</option>')
					// 									//$(document).append('<option>'+res[i].id2+'님의 친구신청입니다'+'<button>수락</button><button>거절</button>'+'</option>')	
					// 									}

					// 						          } 
					// 						    });
					// 					}

					$.ajax({
						url : "selectReq",

						success : function(res) {
							console.log(res);
							$('#req').text(res)

							$('#black').css("background-color", "black")
							if (res != 0) {
								$('#yellow').prop("src",
										"resources/img/853.jpg")
								$('#req').css("color", "yellow")
							} else {
								$('#yellow').prop("src",
										"resources/img/854.jpg")
								$('#req').css("color", "white")
							}
						}
					});

					$.ajax({
						url : "msgCount",
						success : function(res) {

							console.log(res, "fadfadfadsf")
							if (res != 0) {
								$('#letterx').prop("src",
										"resources/img/letter.jpg")
								$('#msg').css("color", "yellow")
							} else {
								$('#letterx').prop("src",
										"resources/img/letterno.jpg")
								$('#msg').css("color", "white")
							}
						}
					});
				</script>
			</div>
		</div>
	</header>


	<section class="eng" id="first">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase" id="english"
						onclick="enter()">English</h2>
				</div>
			</div>
			<script>
				function enter() {
					location = "englishhome";
				}
			</script>


		</div>
	</section>
	<section class="cng" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase" id="chinese"
						onclick="enter2()">汉语</h2>
					<script>
						function enter2() {
							location = "chinesehome";
						}
					</script>
				</div>
			</div>
		</div>
	</section>
	<section class="jap" id="services">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase" id="japanese"
						onclick="enter3()">日本語</h2>
					<script>
						function enter3() {
							location = "japanesehome";
						}
					</script>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-4">
					<span class="copyright">Copyright &copy; (주)유만다</span>
				</div>

				<div class="col-md-4">
					<ul class="list-inline quicklinks">
						<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
						<li class="list-inline-item"><a href="#">Terms of Use</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<script>
		$(document).ready(function() {
			var w = $(this).width();
			var size_eng = $('section.eng').css('background-size');
			size_eng = w + "px " + "500px";
			$('section.eng').css('background-size', size_eng)

			var size_cng = $('section.cng').css('background-size');
			size_cng = w + "px " + "500px";
			$('section.cng').css('background-size', size_cng)

			var size_jap = $('section.jap').css('background-size');
			size_jap = w + "px " + "500px";
			$('section.jap').css('background-size', size_jap)
		})

		$(window).resize(function() {
			var w = $(this).width();
			//   		var section_eng = $('section.eng').height();
			var size_eng = $('section.eng').css('background-size');
			size_eng = w + "px " + "500px";
			$('section.eng').css('background-size', size_eng)

			//   		var section_cng = $('section.cng').height();
			var size_cng = $('section.cng').css('background-size');
			size_cng = w + "px " + "500px";
			$('section.cng').css('background-size', size_cng)

			//   		var section_jap = $('section.jap').height();
			var size_jap = $('section.jap').css('background-size');
			size_jap = w + "px " + "500px";
			$('section.jap').css('background-size', size_jap)
		})
	</script>
	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/agency.min.js"></script>
</body>
</html>






<style>
</style>








