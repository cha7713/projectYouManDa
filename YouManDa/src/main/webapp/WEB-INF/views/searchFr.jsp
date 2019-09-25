<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<body>


<input type="text" name="name"  class="placeholder" placeholder="친구 이름을 입력하세요">
<input type="button" id="findfr" name="btn" value="친구 검색">

 <table id="result">
 
 </table>
	
</body>

<script>
$('[name=btn]').click(()=>{
	$("#result").empty();
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
	    data : {id2 : '${id}', lang2 : ${lang}, req : '친구신청', id : $('#a'+idx).text() },
	    success: function(res){
	    	console.log(res)
	    	    	if(res==1){
	    	alert('친구 신청을 완료했습니다')	 		
	    	    		
	    	    	}else {
	    	    		alert('이미 친구 요청을 보낸 사용자 입니다.')
					}
	    	
	    }
	    
	});
}


</script>

