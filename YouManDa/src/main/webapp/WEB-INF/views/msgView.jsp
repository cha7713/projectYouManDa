<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>
<head>
<html lang="en">
<head>
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
<link href="resources/css/agency.min2.css?var=6" rel="stylesheet">


</head>

<body>
	<a class="navbar-brand" >YouManDa</a>
	<div class="container">
		<h2 style="text-align: center;">쪽지함</h2>
		<table class="table">
			<tr>
				<th>보낸사람</th>
				<th>내용</th>
			</tr>

				<c:forEach items="${msgList}" var="item"  >
					<tr>
						<td>${item.id2}</td>
						<td>${item.msgcontent}</td>
					</tr>
				</c:forEach>

		</table>

	</div>


</body>

<script>
	
</script>
<style>
.navbar-brand {
	font-family: 'Kaushan Script', cursive;
	color: #fed136;
	font-size: 27px;
}
</style>
</html>