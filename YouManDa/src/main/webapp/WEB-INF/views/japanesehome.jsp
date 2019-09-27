<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<html lang="en">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

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
<link
	href="https://fonts.googleapis.com/css?family=Kosugi+Maru&display=swap"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/css/agency.min.css?var=9" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<title>로그인</title>
</head>
<body>


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
						href="/ymd/englishhome/freeboard">일어권 홈</a></li>
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
						<li><a id="black" onclick="popup2()"><img id="yellow"
								style="width: 35px" /><span id="req"></span></a></li>


					</c:if>

				</ul>
			</div>

		</div>
	</nav>
	<script>
		function popup() {
			var url = "/ymd/searchfriend";
			var name = "searchfriend";
			var option = "width = 500, height = 500, top = 100, left = 200, location = no"
			window.open(url, name, option);
		}
		function popup2() {
			var url = "/ymd/ar";
			var name = "searchfriend";
			var option = "width = 500, height = 500, top = 100, left = 200, location = no"
			window.open(url, name, option);
		}
	</script>

	<!-- 몸통 -->
	<section class="bg-light page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h1 class="section-heading text-uppercase" style="color: black;">日本語</h1>
					<h3 class="section-subheading text-muted">Lorem ipsum dolor
						sit amet consectetur.</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
					</a>
					<div class="portfolio-caption" data-toggle="modal">
						<a class="link"
						href="/ymd/englishhome/freeboard"><h4>자유게시판</h4></a>
					</div>
				</div>

				<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
					</a>
					<a><div class="portfolio-caption" data-toggle="modal"
						href="#portfolioModal2"></a>
						<h4>정보게시판</h4>
					</div>
				</div>

				<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
					</a>
					<div class="portfolio-caption" data-toggle="modal"
						href="#portfolioModal3">
						<h4>모임게시판</h4>
					</div>
				</div>


				<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
					</a>
					<div class="portfolio-caption" data-toggle="modal"
						href="#portfolioModal4">
						<h4>익명게시판</h4>
					</div>
				</div>


				<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
					</a>
					<div class="portfolio-caption" data-toggle="modal"
						href="#portfolioModal5">
						<h4>장터</h4>
					</div>
				</div>


				<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
					</a>
					<div class="portfolio-caption" data-toggle="modal"
						href="#portfolioModal6">
						<h4>같이 살자</h4>
					</div>
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







<!-- 	<!-- Portfolio Modals --> 

<!-- 	<!-- Modal 1 --> 
<!-- 	<div class="portfolio-modal modal fade" id="portfolioModal1" -->
<!-- 		tabindex="-1" role="dialog" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="close-modal" data-dismiss="modal"> -->
<!-- 					<div class="lr"> -->
<!-- 						<div class="rl"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="container"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-8 mx-auto"> -->
<!-- 							<a id="board"></a> -->
<!-- 							Project Details Go Here -->
<!-- 							<script> -->
<!-- // 								$.ajax({ -->
<!-- // 									url : "englishhome/freeboard", -->

<!-- // 									success : function(res) { -->
<!-- // 										console.log(res); -->
<!-- // 										$('#board').load( -->
<!-- // 												"englishhome/freeboard"); -->
										
<!-- // 									} -->
<!-- // 								}); -->
<!-- 							</script> -->


<!-- 							<button class="btn btn-primary" data-dismiss="modal" -->
<!-- 								type="button"> -->
<!-- 								<i class="fas fa-times"></i> 닫기 -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->


<!-- 	<!-- Modal 2 --> 
<!-- 	<div class="portfolio-modal modal fade" id="portfolioModal2" -->
<!-- 		tabindex="-1" role="dialog" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="close-modal" data-dismiss="modal"> -->
<!-- 					<div class="lr"> -->
<!-- 						<div class="rl"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="container"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-8 mx-auto"> -->
<!-- 							<a id="board"></a> -->
<!-- 							Project Details Go Here -->
<!-- 							<script> -->
<!-- // 								$.ajax({ -->
<!-- // 									url : "englishhome/freeboard", -->

<!-- // 									success : function(res) { -->
<!-- // 										console.log(res); -->
<!-- // 										$('#board').load( -->
<!-- // 												"englishhome/freeboard"); -->
<!-- // 										location: "englishhome/freeboard"; -->
<!-- // 									} -->
<!-- // 								}); -->
<!-- 							</script> -->


<!-- 							<button class="btn btn-primary" data-dismiss="modal" -->
<!-- 								type="button"> -->
<!-- 								<i class="fas fa-times"></i> 닫기 -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<!-- Modal 3 --> 
<!-- 	<div class="portfolio-modal modal fade" id="portfolioModal3" -->
<!-- 		tabindex="-1" role="dialog" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="close-modal" data-dismiss="modal"> -->
<!-- 					<div class="lr"> -->
<!-- 						<div class="rl"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="container"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-8 mx-auto"> -->
<!-- 							<a id="board"></a> -->
<!-- 							Project Details Go Here -->
<!-- 							<script> -->
<!-- // 								$.ajax({ -->
<!-- // 									url : "englishhome/freeboard", -->

<!-- // 									success : function(res) { -->
<!-- // 										console.log(res); -->
<!-- // 										$('#board').load( -->
<!-- // 												"englishhome/freeboard"); -->
										
<!-- // 									} -->
<!-- // 								}); -->
<!-- 							</script> -->


<!-- 							<button class="btn btn-primary" data-dismiss="modal" -->
<!-- 								type="button"> -->
<!-- 								<i class="fas fa-times"></i> 닫기 -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->


<!-- 	<!-- Modal 4 --> 
<!-- 	<div class="portfolio-modal modal fade" id="portfolioModal4" -->
<!-- 		tabindex="-1" role="dialog" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="close-modal" data-dismiss="modal"> -->
<!-- 					<div class="lr"> -->
<!-- 						<div class="rl"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="container"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-8 mx-auto"> -->
<!-- 							<a id="board"></a> -->
<!-- 							Project Details Go Here -->
<!-- 							<script> -->
<!-- // 								$.ajax({ -->
<!-- // 									url : "englishhome/freeboard", -->

<!-- // 									success : function(res) { -->
<!-- // 										console.log(res); -->
<!-- // 										$('#board').load( -->
<!-- // 												"englishhome/freeboard"); -->
<!-- // 										location: "englishhome/freeboard"; -->
<!-- // 									} -->
<!-- // 								}); -->
<!-- 							</script> -->


<!-- 							<button class="btn btn-primary" data-dismiss="modal" -->
<!-- 								type="button"> -->
<!-- 								<i class="fas fa-times"></i> 닫기 -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->


<!-- 	<!-- Modal 5 --> 
<!-- 	<div class="portfolio-modal modal fade" id="portfolioModal5" -->
<!-- 		tabindex="-1" role="dialog" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="close-modal" data-dismiss="modal"> -->
<!-- 					<div class="lr"> -->
<!-- 						<div class="rl"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="container"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-8 mx-auto"> -->
<!-- 							<a id="board"></a> -->
<!-- 							Project Details Go Here -->
<!-- 							<script> -->
<!-- // 								$.ajax({ -->
<!-- // 									url : "englishhome/freeboard", -->

<!-- // 									success : function(res) { -->
<!-- // 										console.log(res); -->
<!-- // 										$('#board').load( -->
<!-- // 												"englishhome/freeboard"); -->
<!-- // 										location: "englishhome/freeboard"; -->
<!-- // 									} -->
<!-- // 								}); -->
<!-- 							</script> -->


<!-- 							<button class="btn btn-primary" data-dismiss="modal" -->
<!-- 								type="button"> -->
<!-- 								<i class="fas fa-times"></i> 닫기 -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->


<!-- 	<!-- Modal 6 --> 
<!-- 	<div class="portfolio-modal modal fade" id="portfolioModal6" -->
<!-- 		tabindex="-1" role="dialog" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="close-modal" data-dismiss="modal"> -->
<!-- 					<div class="lr"> -->
<!-- 						<div class="rl"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="container"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-8 mx-auto"> -->
<!-- 							<a id="board"></a> -->
<!-- 							Project Details Go Here -->
<!-- 							<script> -->
<!-- // 								$.ajax({ -->
<!-- // 									url : "englishhome/freeboard", -->

<!-- // 									success : function(res) { -->
<!-- // 										console.log(res); -->
<!-- // 										$('#board').load( -->
<!-- // 												"englishhome/freeboard"); -->
<!-- // 										location: "englishhome/freeboard"; -->
<!-- // 									} -->
<!-- // 								}); -->
<!-- 							</script> -->


<!-- 							<button class="btn btn-primary" data-dismiss="modal" -->
<!-- 								type="button"> -->
<!-- 								<i class="fas fa-times"></i> 닫기 -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->



	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
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
.navbar-brand {
	font-family: 'Kaushan Script', cursive;
	color: #fed136;
	font-size: 27px;
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

h1 {
	margin-top: 70px;
	font-size: 100px;
	text-align: center;
	font-family: 'Kosugi Maru', sans-serif;
}
</style>