<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
#user {
	text-align: center;
}
#list {
	text-align: center;
}

.remote {
	position: fixed;
	right: 10%;
	top: 180px;
	width: 200px;
	height: 300px;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<%
		HttpSession session3 = request.getSession();
		List<String> loginList = (List<String>) session3.getAttribute("loginList");
		request.setAttribute("loginList", loginList);
	%>
	<div class="remote ui-widget-content" id="draggable"
		style="background-color: #fec810; border-color: #fec810">
		
		<p id="user">${id}</p>
		<div>
			<p id="list">친구목록 </p>
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
				
				<%String loginId = "";
			String sep = "";

			for (int i = 0; i < loginList.size(); i++) {
				loginId = loginId + sep + "'" + loginList.get(i) + "'";
				sep += ", ";
			}%>
				var loginList = [<%=loginId%>];
				
				for (var i = 0; i < res.length; i++) {
					if (res[i].frid != "" && res[i].frid != "dbc" && res[i].frid != null) {

						let temp = 0;
						for(let list of loginList){
							console.log(list, '    ', res[i].frid)
								if(list == res[i].frid){
									temp = 1;
									}
						

							}
						if(temp==1){
							$('#frList').append("<li onclick='pop(\""+res[i].frid+"\")'>" + res[i].nick + "(접속중)</li>")

							}
				}
					}
			
			

		for (var i = 0; i < res.length; i++) {
			if (res[i].frid != "" && res[i].frid != "dbc" && res[i].frid != null) {

				let temp = 0;
				for(let list of loginList){
					console.log(list, '    ', res[i].frid)
						if(list == res[i].frid){
							temp = 1;
							}
				

					}
				if(temp!=1){
							$('#frList').append("<li onclick='pop(\""+res[i].frid+"\")'>" + res[i].nick + "</li>")

					}
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
		
		function pop(i) {
			var url = "/ymd/msgInput?frid="+i;
			var name = "msg";
			var option = "width = 500, height = 500, top = 100, left = 200, location = no"
			window.open(url, name, option);
		}
	</script>
</body>

</html>