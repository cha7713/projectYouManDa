<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="join" method="post">
	회원가입 <br> 
	아이디:<input name="id" required="required"><span id="dup"></span> <br>
	비밀번호:<input name="pw" type="password" required="required"> <br>
	비밀번호 확인:<input name="pw2" type="password" required="required"> <span id="ppp"></span> <br>
	사용 언어:
	<select name="lang">
	<option>한국어</option>
	<option>ENG</option>
	<option>汉语</option>
	<option>日本語</option> 
	</select> <br>
	학교:	<input name="school" required="required">
	이름:	<input name="name" required="required"> <br>
	주소:	<input name="address"><button type="button" onclick="searchaddress()">주소검색</button> <br>
	상세주소:<input name="add2"><br>
	email:<input name="email" id="email" type="email"><span id="emailCheck"></span>
	<br>
	
	<input type="submit" value="회원가입" id="submit" >
	</form>
	

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script>
	var isId = 0
	var isPw = 0
	var isEmail = 0
	
	
	$("#submit").click(function(event){
		if(isId==0){
			event.preventDefault();
			alert("아이디 중복확인이 필요합니다.")
		}
		if(isPw==0){
			event.preventDefault();
			alert("패스워드가 일치하지 않습니다")
		}
		if(isEmail==0){
			event.preventDefault();
			alert("이메일 형식을 확인해 주세요")
		}
	})
	
		function searchaddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					console.log(data);
					$('[name=address]').val(data.address);
					data.address;
				}
			}).open();
		}
		
		$("#email").focusout(()=>{
			
				  // 이메일 검증 스크립트 작성
				  var emailVal = $("#email").val();
				  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				  // 검증에 사용할 정규식 변수 regExp에 저장
				  if (emailVal.match(regExp) != null) {
					  $("#emailCheck").text("사용가능합니다.")
					  $("#emailCheck").css("color","blue")
					  isEmail = 1
				  }
				  else {
					  $("#emailCheck").text("유효한 이메일 형식이 아닙니다.")
					  $("#emailCheck").css("color","red")
					  isEmail = 0
				  }
				
			
		})
		
			$("[name=id]").focusout(()=>{
				$.ajax({
			        url:"dupli",
			        data : {id : $("[name=id]").val()},
			        success: function(res){
			            console.log(res);
			           var dup = res.dup
			           if(dup=='a'&& $("[name=id]").val() !="" ){
			        	   $("#dup").text("사용가능한 아이디 입니다") 
			        	   $("#dup").css("color","blue")
			        	   isId = 1
			           }else {
			        	   $("#dup").text("이미 존재하는 아이디 입니다")
			        	   $("#dup").css("color","red")
			        	   isId = 0
					}
			        } 
			    });
			})
			
			
			$("[name=pw2]").focusout(()=>{
				var pw = $("[name=pw]").val()
				var pw2 = $("[name=pw2]").val()
				if(pw == pw2){
					$("#ppp").text("유효한 비밀 번호 입니다")
					$("#ppp").css("color","blue")
					isPw = 1
				}else {
					$("#ppp").text("비밀번호가 다릅니다")
					$("#ppp").css("color","red")
					isPw = 0
				}	
			})
			
	</script>
</body>
</html>