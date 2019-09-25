<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
.remote {
	position: fixed;
	right: 50%;
	top: 180px;
	margin-right: -720px;
	text-align: center;
	width: 120px;
	
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<div class="remote ui-widget-content" id="draggable">
		메신저 창
		<p id="user">${id}</p>
		<div>
			<span>친구목록</span>
			<p id="frList"></p>
		</div>
	</div>

	<script>
		$(function() {
			$("#draggable").draggable();
		});

		$.ajax({
			url : "frList",

			success : function(res) {
				for (var i = 0; i < res.length; i++) {
					if (res[i] != "" && res[i] != "dbc" && res[i] != null) {
						$('#frList').append("<li>" + res[i] + "</li>")

					}
				}

			}
		});

		$.ajax({
			url : "userNick",
			success : function(res) {
				$('#user').text(res)
			}
		});
	</script>
</body>

</html>