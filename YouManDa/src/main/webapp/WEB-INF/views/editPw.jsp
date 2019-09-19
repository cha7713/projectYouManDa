<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="../editPw" method="post">
<input name="id" value="${id}" type="hidden">
비밀번호 입력:<input name="pw" type="password" required="required"> <span id="pwCheck"></span><br> 
비밀번호 확인:<input name="pw2" type="password" required="required"> <span id="ppp"></span> <br>

<input type="submit" id="submit">
</form>

<script type="text/javascript">

var isPw = 0

$("[name=pw2]").focusout(()=>{
	var pw = $("[name=pw]").val()
	var pw2 = $("[name=pw2]").val()
	if(pw == pw2){
		$("#ppp").text("비밀 번호가 일치 합니다")
		$("#ppp").css("color","blue")
		isPw = 1
	}else {
		$("#ppp").text("비밀번호가 다릅니다")
		$("#ppp").css("color","red")
		isPw = 0
	}	
})

$("[name=pw]").focusout(()=>{
			
				  // 이메일 검증 스크립트 작성
				  var passVal = $("[name=pw]").val();
				  var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				// 검증에 사용할 정규식 변수 regExp에 저장
				  if (passVal.match(regExp) != null) {
					  $("#pwCheck").text("사용가능합니다.")
					  $("#pwCheck").css("color","blue")
					  isPw = 1
					  
				  }
				  else {
					  $("#pwCheck").text("비밀번호는 8~15자로 영어,숫자,특수문자를 포함해야 합니다")
					  $("#pwCheck").css("color","red")
					  isPw = 0
				  }
				
			
		})
		
		$("#submit").click(function(event){
		if(isPw==0){
			event.preventDefault();
			alert("비밀번호를 확인해 주세요")
		}
	})

</script>

</body>
</html>