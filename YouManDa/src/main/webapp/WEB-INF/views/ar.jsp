<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


</head>
<body>
<table id="req">

</table>

	
</body>

<script>


let arr = []

$(document).ready(function() {
	$.ajax({
		
		url:"alarm",
	    success: function(res){
	        console.log(res);
	        for (var i = 0; i < res.length; i++) {
	        	arr.push(res[i].id2);
	
	        	(function(j) {
		        	$.ajax({
					    url:"idsc",
					    data : {id :res[i].id2},
					    success: function(res){
					        console.log(res);
				        	$('#req').append('<td>'+'<span>'+res.name+'</span>님의 친구신청입니다'+'</td><td>'+'<button onclick="ok('+j+')">수락</button></td><td><button>거절</button></td>')
			     		 } 
					});
	        	})(i);
	        	
	        	
	    		
			}
	       
	      } 
	});
})

function ok(i) {
	
	$.ajax({
	    url:"ok",
	    data : {frid :arr[i]},
	    success: function(res){
	        console.log(res);
	       alert("친구신청을 완료 했습니다")
	       window.location.reload()
	      } 
	});
} 


</script>
</html>