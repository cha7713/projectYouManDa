<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/login.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/login.css" rel="stylesheet">

<body>
<h1 id="login">로그인</h1>
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
	</form>

</body>


</html>