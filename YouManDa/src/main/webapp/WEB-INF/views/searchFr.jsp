<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" %>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<body>

<div class="container">
<input type="text" name="name"  id="findfr" placeholder="친구 이름을 입력하세요">
<button type="button" name="btn" class="btn btn-warning">검색</button>


 <table id="result" class="table" style="margin-top:30px"></table>
</div>		
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
				$("#result").append('<tr><td>'+name+'</td><td id="'+'a'+i+'">'+id+'</td><td>'+nick+'</td><td><button onclick="friendReq(' + i + ')" class="btn btn-warning" >신청</button></td></tr>')
				
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

<style>
#findfr{
	width: 55%;
	height: 35px;
	margin-left: 100px;
	margin-top : 50px 
}
.container button[type="button"]{
	height: 20px;
	padding-bottom: 30px;
	background-color: #fed136;
}

</style>
