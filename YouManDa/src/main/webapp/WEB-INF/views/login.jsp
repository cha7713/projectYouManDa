<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Agency - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/login.css" rel="stylesheet">


<div id="login-page" class="row">
	<div class="col s12 z-depth-4 card-panel">
		<form class="login-form">
			<div class="row">
				<div class="input-field col s12 center">
					<!-- <img src="images/login-logo.png" alt="" class="circle responsive-img valign profile-image-login"/> -->
					<p class="center login-form-text">로그인</p>
				</div>
			</div>
			<div class="row margin">
				<div class="input-field col s12">
					<i class="material-icons prefix">아이디</i> 
					<input id="username" name="username" type="text" />
				</div>
			</div>
			<div class="row margin">
          <div class="input-field col s12">
            <input id="password" name="pw" type="password"/>
            <label for="password">비밀번호</label>
          </div>
        </div>
			
			<html>
<head>

</head>
<body>

	<form action="login" method="post">
		로그인 <br> 아이디:<input name="id" type="text"> <br>
		비밀번호:<input name="pw" type="password"> <br> <input
			type="submit" value="로그인" id="submit">

		<button type="button" onclick="findpw()">비밀번호 찾기</button>
		<script>
			function findpw() {
				location = "findpw";
			}

			function msg() {
				var abc = '${msg}';
				if (abc != "") {
					alert(abc)
				}
			};
			msg()
		</script>
	</form>

</body>
			</html>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/login.css"
	rel="stylesheet">
	<!-- Custom styles for this template -->
<link href="resources/css/login.css" rel="stylesheet">
</head>
<body>
	<form id="slick-login">
		<label for="username">username</label><input type="text"
			name="username" class="placeholder" placeholder="me@tutsplus.com">
		<label for="password">password</label><input type="password"
			name="password" class="placeholder" placeholder="password"> <input
			type="submit" value="Log In">
	</form>
</body>
</html>