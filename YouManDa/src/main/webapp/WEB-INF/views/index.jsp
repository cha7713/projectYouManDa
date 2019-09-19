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
<link href="resources/vendor/fontawesome-free/css/join.css"
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
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/join.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/ymd/home">YouManDa</a>
		</div>
		<div id="login-page" class="row">
			<div class="col s12 z-depth-4 card-panel">
				<form class="login-form">
					<div class="row">
						<div class="input-field col s12 center">
							<h1>회원가입</h1>
						</div>
					</div>

					<div class="row margin">
						<div class="input-field col s12">
							<!-- <i class="mdi-social-person-outline prefix"></i> -->
							<i class="material-icons prefix">account_circle</i> <input
								id="username" name="username" type="text" /> <label
								for="username">Username</label>
						</div>
					</div>

					<div class="row margin">
						<div class="input-field col s12">
							<!-- <i class="mdi-social-person-outline prefix"></i> -->
							<i class="material-icons prefix">email</i> <input id="email"
								name="email" type="text" style="cursor: auto;" /> <label
								for="email">Email</label>
						</div>
					</div>

					<div class="row margin">
						<div class="input-field col s12">
							<!-- <i class="mdi-action-lock-outline prefix"></i> -->
							<i class="material-icons prefix">vpn_key</i> <input id="password"
								name="password" type="password" /> <label for="password">Password</label>
						</div>
					</div>

					<div class="row margin">
						<div class="input-field col s12">
							<!-- <i class="mdi-action-lock-outline prefix"></i> -->
							<i class="material-icons prefix">vpn_key</i> <input
								id="password_a" name="cpassword" type="password" /> <label
								for="password_a">Password again</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<button type="submit"
								class="btn waves-effect waves-light col s12">REGISTER
								NOW</button>

						</div>
						<div class="input-field col s12">
							<p class="margin center medium-small sign-up">
								Already have an account? <a href="./login">Login</a>
							</p>
						</div>
					</div>


				</form>
			</div>
		</div>
	</nav>