<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" %>
<html>
<head>

<meta charset="utf-8">


<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/join.css?var=8" rel="stylesheet">
</head>
<body>
	<div class="container" style="margin-left:120%">
		<nav class="navbar" id="mainNav">
			<a class="navbar-brand " href="/ymd/home" style="margin-left: 20%">YouManDa</a>
		</nav>
			<form id="slick-login" action="join" method="post">

				<input type="hidden" name="kakao" value="${info.kakao}">
				<input type="hidden" name="google"value="${info.google}">
					<br> 
					<c:if test="${info.kakao != null }">
					<input name="id" required="required" type="hidden" value="k_${info.kakao}">
					
					</c:if>
					<c:if test="${info.kakao == null }">
					아이디 <input name="id" required="required" type="text">
					<span id="dup"></span>
					</c:if>
					 <br> 
					 <c:if test="${info.kakao != null }">
					 <input name="pw" type="hidden" required="required" value="pw_${info.kakao}"> <br>
					 
					 </c:if>
					 
					  <c:if test="${info.kakao == null }">
					 비밀번호 <input name="pw" type="password" required="required"> <br>
					 <span id="pwCheck"></span><br> 비밀번호 확인
					 <input name="pw2" type="password" required="required"> 
					 <span id="ppp"></span>
					 </c:if>
					 
					<br> 닉네임 <input name="nick" required="required" type="text">
					<span id="nick"></span> <br> 사용 언어 
					<select name="lang">
						<option value="1">한국어</option>
						<option value="2">ENG</option>
						<option value="3">汉语</option>
						<option value="4">日本語</option>
					</select> 
					<br>
					 학교 <input name="school" required="required" type="text">
					<br>
					이름 <input name="name" required="required" type="text"> <br>
					성별
					<select name="lang">
					<option value="1">
						남성
					</option>
					<option value="2">
						여성 
					</option>
					</select>
					<br> 
					핸드폰 번호<br>
					<input name="p1" required="required" class="phone">-
					<input name="p2" required="required" class="phone">-
					<input name="p3" required="required" class="phone">
					<br>
					여권 번호
					<input name="passnum" id="passnum" required="required" type="text"> 
					<span id="passCheck"></span>
					<br> 
					생년월일
					<input name="birthday" type="date" required="required">
					<br> 
					주소 
					<input name="address" type="text">
					<br> 
					상세주소<input name="add2" type="text" ><br>
					<input type="button" class="address"  onclick="searchaddress()" value="주소검색"><br>
					email <input name="email" id="email" type="email">
					<span id="emailCheck"></span>
					<br> 
					<input type="submit" value="회원가입" id="submit">

			</form>
		</div>
</body>



<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	var isId = 0
	var isPw = 0
	var isEmail = 0
	var isNick = 0
	
	
	$("#submit").click(function(event){
		
		if(isEmail==0){
			event.preventDefault();
			alert("이메일을 확인해 주세요")
		}
		if(isNick==0){
			event.preventDefault();
			alert("닉네임을 확인해 주세요")
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
// 					  $("#emailCheck").text("사용가능합니다.")
// 					  $("#emailCheck").css("color","blue")
					  
					  
				$.ajax({
			        url:"emailDup",
			        data : {email : $("[name=email]").val()},
			        success: function(res){
			            console.log(res);
			           
			           if(res==0 && $("[name=email]").val() !="" ){
			        	   $("#emailCheck").text("사용가능한 이메일 입니다") 
			        	   $("#emailCheck").css("color","blue")
			        	   isEmail = 1
			           }else {
			        	   $("#emailCheck").text("중복된 이메일 입니다")
			        	   $("#emailCheck").css("color","red")
			        	   isEmail = 0
					}
			        } 
			    });
			
					 
					  			  
				  }
				  else {
					  $("#emailCheck").text("유효한 이메일 형식이 아닙니다.")
					  $("#emailCheck").css("color","red")
					  isEmail = 0
				  }
				
			
		})
		
			$("[name=id]").focusout(()=>{
				
					
					  // 이메일 검증 스크립트 작성
					  var passVal = $("[name=id]").val();
					  var regExp =  /^[A-Za-z0-9]{5,15}$/;
					  console.log(passVal);
					// 검증에 사용할 정규식 변수 regExp에 저장
					  if (passVal.match(regExp) != null) {
						  $.ajax({
						        url:"idDup",
						        data : {id : $("[name=id]").val()},
						        success: function(res){
						            console.log(res);
						           
						           if(res==0 && $("[name=id]").val() !="" ){
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
						  
					  }
					  else {
						  $("#dup").text("아이디는 5~15자로 구성되야 합니다")
						  $("#dup").css("color","red")
						  isId = 0
						  
					  }
					
				
				
				
				
			})
			
			$("[name=nick]").focusout(()=>{
				$.ajax({
			        url:"nickDup",
			        data : {nick : $("[name=nick]").val()},
			        success: function(res){
			            console.log(res);
			           
			           if(res==0 && $("[name=nick]").val() !="" ){
			        	   $("#nick").text("사용가능한 닉네임 입니다") 
			        	   $("#nick").css("color","blue")
			        	   isNick = 1
			           }else {
			        	   $("#nick").text("이미 존재하는 닉네임 입니다")
			        	   $("#nick").css("color","red")
			        	   isNick = 0
					}
			        } 
			    });
			})
			
			
			
			
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
			
			$("#passnum").focusout(()=>{
			
				  // 이메일 검증 스크립트 작성
				  var passVal = $("#passnum").val();
				  var regExp = '[a-zA-Z]{1}[0-9a-zA-Z]{1}[0-9]{7}';
				  // 검증에 사용할 정규식 변수 regExp에 저장
				  if (passVal.match(regExp) != null) {
					  $("#passCheck").text("사용가능합니다.")
					  $("#passCheck").css("color","blue")
					  
				  }
				  else {
					  $("#passCheck").text("유효한 여권번호 형식이 아닙니다.")
					  $("#passCheck").css("color","red")
					  
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
		
	</script>
</nav>
</body>
</html>