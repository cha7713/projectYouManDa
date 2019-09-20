<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


</head>
<body>


<input type="text" name="name">
<input type="button" name="btn" value="친구 검색">

 <table id="result">
 
 </table>
	
</body>

<script>
$('[name=btn]').click(()=>{
	$.ajax({
	    url:"searchfriend",
	    type: 'POST',
	    data : {name : $("[name=name]").val()},
	    success: function(res){
	    	$("#result").append('<th>이름</th> <th>아이디</th> <th>닉네임</th> <th>친구신청</th>')
	        console.log(res);
	        for (var i = 0; i < res.length; i++) {
				let name = res[i].name
				let id = res[i].id
				let nick = res[i].nick
				$("#result").append('<tr><td>'+name+'</td><td id="'+'a'+i+'">'+id+'</td><td>'+nick+'</td><td><button onclick="friendReq(' + i + ')">신청</button></td></tr>')
				
			}
	       
	       
	    } 
	});
})

function friendReq(idx) {
	
	
		
	$.ajax({
	    url:"friendReq",
	    type: 'GET',
	    data : {id : '${id}', lang : ${lang}, req : '친구신청', id2 : $('#a'+idx).text() },
	    success: function(res){
	    	    	if(res==0){
	    	alert('친구 신청을 완료했습니다')	 		
	    	    		
	    	    	}else {
	    	    		alert('이미 친구 요청을 보낸 사용자 입니다.')
					}
	    	
	    }
	    
	});
}


</script>
</html>