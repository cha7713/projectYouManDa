<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<head>
<meta charset="utf-8">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
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
</head>

<body>
<h3 style="margin-top:2%;margin-left:2%;">YouManDa</h3>
	<h2 style="text-align: center; margin-top:3%; color:#ffffff;">친구신청 목록</h2>

		<div class="container">
			<ul class="list-group">
			
							
			</ul>
		</div>
</body>

<script>
	let arr = []

	$(document)
			.ready(
					function() {
						$.ajax({

									url : "alarm",
									success : function(res) {
										console.log(res);
										for (var i = 0; i < res.length; i++) {
											arr.push(res[i].id2);

											(function(j) {
												$
														.ajax({
															url : "idsc",
															data : {
																id : res[i].id2
															},
															success : function(
																	res) {
																console
																		.log(res);
																$('#req')
																		.append(
																				'<td>'
																						+ '<span>'
																						+ res.name
																						+ '</span>님의 친구신청입니다'
																						+ '</td><td>'
																						+ '<button onclick="ok('
																						+ j
																						+ ')">수락</button></td><td><button onclick="reject('
																						+ j
																						+ ')">거절</button></td>')
															}
														});
											})(i);

										}

									}
								});
					})

	function ok(i) {

		$.ajax({
			url : "ok",
			data : {
				frid : arr[i]
			},
			success : function(res) {
				console.log(res);
				alert("친구신청을 수락했습니다")
				window.location.reload()
				opener.action_reload();
			}
		});
	}

	function reject(i) {

		$.ajax({
			url : "delReq",
			data : {
				id2 : arr[i]
			},
			success : function(res) {
				console.log(res);
				alert("친구신청을 거절했습니다")
				window.location.reload()
				opener.action_reload();
			}
		});
	}
</script>
<style>
h3 {
	font-family: 'Kaushan Script', cursive;
	color: #fed136;
	font-size: 27px;
}
body{
	background-color:#000000;
}

</style>