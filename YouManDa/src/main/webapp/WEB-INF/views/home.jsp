<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" %>
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
<link href="resources/css/agency.min.css?var=2" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">YouManDa</a>
			
			<i class="fas fa-bars"></i>
					<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#first">영어권</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#chinese">중어권</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#japanese">일어권</a></li>
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
						</c:if>
				</ul>
			</div>
		
		</div>
	</nav>

	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-heading text-uppercase">유학생을 만나다</div>
				<c:if test="${a==null}">
					<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
						onclick="loginform()">로그인</a>
					<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
						onclick="joinform()">회원가입</a>
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
					function mypage(){
						location = 'mypage/${a}';
					}

				</script>
			</div>
		</div>
	</header>


	<section class="eng" id="first">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase" id="english" onclick="enter()">English</h2>
					<script>
						function enter() {
							location = "englishhome";
						}
					</script>
				</div>
			</div>
		</div>
	</section>
	<section class="cng" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase" id="chinese" onclick="enter2()">汉语</h2>
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
					<h2 class="section-heading text-uppercase" id="japanese" onclick="enter3()">日本語</h2>
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
            <li class="list-inline-item">
              <a href="#">Privacy Policy</a>
            </li>
            <li class="list-inline-item">
              <a href="#">Terms of Use</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
  
  <script>
  	$(document).ready(function() {
  		var w = $(this).width();
		var size_eng = $('section.eng').css('background-size');
  		size_eng = w + "px "+ "500px";
		$('section.eng').css('background-size', size_eng)
		
		var size_cng = $('section.cng').css('background-size');
		size_cng = w + "px "+ "500px";
		$('section.cng').css('background-size', size_cng)
		
		var size_jap = $('section.jap').css('background-size');
		size_jap = w + "px "+ "500px";	
		$('section.jap').css('background-size', size_jap)
  	})
  
  	$(window).resize(function() {
  		var w = $(this).width();
//   		var section_eng = $('section.eng').height();
		var size_eng = $('section.eng').css('background-size');
  		size_eng = w + "px "+ "500px";
		$('section.eng').css('background-size', size_eng)
		
//   		var section_cng = $('section.cng').height();
		var size_cng = $('section.cng').css('background-size');
		size_cng = w + "px "+ "500px";
		$('section.cng').css('background-size', size_cng)
		
//   		var section_jap = $('section.jap').height();
		var size_jap = $('section.jap').css('background-size');
		size_jap = w + "px "+ "500px";	
		$('section.jap').css('background-size', size_jap)
  	})
  </script>

</body>
</html>















