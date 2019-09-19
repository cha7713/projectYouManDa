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