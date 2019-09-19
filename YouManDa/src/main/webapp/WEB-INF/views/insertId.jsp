<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	비밀번호를 찾을 아이디를 입력해 주세요
	<br>
	<input type="text" name="id" id="id">
	<button type="button" id="submit">비밀번호 찾기</button>
	
	<p id="check">
	이메일로 전송된 코드를 입력해 주세요<br>
	<input type="text" name="idCheck" id="idCheck">
	<button type="button" id="submitCode">이메일 인증</button>
	</p>
	

	<script type="text/javascript">
	$("#check").hide()
	
	let code = '';
	
	$("#submit").click(function(event){
			event.preventDefault();
			
			$.ajax({
		        url:"pwFind",
		        data : {id : $("[name=id]").val()},
		        success: function(res){
		        	
		        	if(res == -1){
		        		alert('존재하지 않는 아이디 입니다')
		        	}else{
		            $("#check").show()	
		            code = res;	                		
		        	}
		          
		        } 
		    });				
		
	})
	
	$("#submitCode").click(function(event){
		event.preventDefault();
		if($("#idCheck").val()==code){
			let idd =$("[name=id]").val()
			location = 'editPw/'+idd+''
		}else {
			alert('코드가 일치하지 않습니다')
		}
	})
		
		
	</script>


</body>
</html>