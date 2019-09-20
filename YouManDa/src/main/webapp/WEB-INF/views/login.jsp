<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<meta charset="utf-8">


<!-- Custom fonts for this template -->
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

<!-- <!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/login.css?var=2" rel="stylesheet">
</head>
<body>
	<div class="container">
		<nav class="navbar" id="mainNav">
			<a class="navbar-brand" href="/ymd/home" style="margin-left: 36%">YouManDa</a>
		</nav>
		<form id="slick-login" action="login" method="post">
			<label for="id">아이디</label> <input type="text" name="id"
				class="placeholder" placeholder="아이디"> <label for="password">비밀번호</label>
			<input type="password" name="pw" class="placeholder"
				placeholder="비밀번호"> <br> <input type="submit"
				value="로그인" id="submit">
			<hr>
			<div class="row">
				<div class="input-field col s6 m6 l6">
					<p class="margin medium-small">
						<span>유만다에 처음이신가요?</span> <a href="/ymd/join">회원가입</a>
					</p>
				</div>
				<div class="input-field col s6 m6 l6">
					<p class="margin right-align medium-small">
						<a href="/ymd/insertId" onclick="findpw()">비밀번호 찾기</a>
					</p>
				</div>


				<a id="kakao-login-btn"></a> <a
					href="http://developers.kakao.com/logout"></a>


				<script>
					//<![CDATA[
					// 사용할 앱의 JavaScript 키를 설정해 주세요.
					Kakao.init('602456200ebdad0c58f3bd1860bcd80d');
					// 카카오 로그인 버튼을 생성합니다.
					Kakao.Auth.createLoginButton({
						container : '#kakao-login-btn',
						success : function(authObj) {
							console.log(JSON.stringify(authObj));

							Kakao.API.request({
								url : '/v2/user/me',
								success : function(res) {
									var id = res.id;

									$.ajax({
										url : "kakaoDup",
										data : {
											kakao : id
										},
										success : function(res) {
											console.log(res);

											if (res == 0) {
												location = 'join?kakao=' + id
														+ ''
											} else if (res == 1) {
												location = 'loginKakao?kakao='
														+ id + ''
											}
										}
									});

								},
								fail : function(error) {
									alert(JSON.stringify(error));
								}
							});

							// 			        let userCode = JSON.stringify(authObj);

						},
						fail : function(err) {
							alert(JSON.stringify(err));
						}
					});
					//]]>
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
	</div>
</body>


</html>

