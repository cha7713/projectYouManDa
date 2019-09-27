<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Kaushan+Script&display=swap"
	rel="stylesheet">
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="/ymd/">YouManDa</a> <i
				class="fas fa-bars"></i>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/ymd/englishhome/freeboard">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#portfolio">정보게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#services">모임게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/ymd/mypage/${id}">익명게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/ymd/logout" id="logout">장터</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#services">같이살자</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/ymd/mypage/${id}">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="/ymd/logout" id="logout">로그아웃</a></li>
					
				</ul>
			</div>

		</div>
	</nav>
	
	
	header : ${viewcontent.header}<br>
	title : ${viewcontent.title} <br>
	date : ${viewcontent.bdate}<br>
	writer : ${viewcontent.id}<br>
	content : ${viewcontent.content}<br>
	hit : ${viewcontent.hit}<br>
	recommend : <p id="recommend">${viewcontent.recommend}</p><br>
	
	

<input type="hidden" value="${list.bnum}" >
<input type="button" value="수정" onclick="freeboardedit()">
<input type="button" value="삭제" onclick="deletefreeboard()">
<input type="button" value="뒤로가기" onclick="backtoList()">
<input type="button" value="추천" onclick="recommendation()">
<hr>
댓글<br>


<div id="reply_list">


</div>
<%
// <c:forEach items="${viewreply}" var="replylist">
//  	<tr>
//  		작성자 : <td>${replylist.id}</td>
//  		내용 : <td>${replylist.content}</td>
//  	</tr>
// </c:forEach>
 %>
<hr>

	<input type="text" placeholder="댓글을 입력하세요." name="replycontent">
	<input type="button" value="댓글 등록" onclick="addfreereply()">


<script>
	function freeboardedit(bnum){
			location = "freeboardedit/${viewcontent.bnum}";
		}

	function backtoList(){
			history.back();
			/* 거쳐온 페이지로 뒤로 가기 */
		}

	function recommendation(){
		let bnum=${viewcontent.bnum}
		bnum = Number(bnum)
		console.log(bnum)
		$.ajax({
	        url:"../../../recommendation",
	        data : {bnum :  bnum},
	        success: function(res){
	    		let rec = $("#recommend").text()
	    		rec = Number(rec)
	        	rec += 1;
			$("#recommend").text(rec)	
	          
	        } 
	    });
	}

	function addfreereply(){
		$.ajax({
			url:'../../../addfreereply',
			data:{
				"replycontent": $('[name=replycontent]').val(),
				"bnum":"${viewcontent.bnum}"
			},
			success: function(res){
				console.log(res);
				
				getfreereply();
				}
			})

		}

	function getfreereply(){
		$.ajax({
			url:'../reply',
			data:{
				"bnum":"${viewcontent.bnum}"
			},
			success: function(res){
				var html = '';
				for(var i=0;i<res.length;i++){
					var nick = res[i].nick;
					var content = res[i].content;
					html += '작성자 : ' + nick + '&nbsp;&nbsp;&nbsp;&nbsp;'+'내용 : '+ content + '<br>';
					
					}
				$('#reply_list').empty();
				$('#reply_list').append(html);


				
			}
		})

	}

	getfreereply();
					 
	function backtoList(){
		history.back();
		/* 거쳐온 페이지로 뒤로 가기 */
	}	
	
</script>

<style>
#mainNav {
	background-color: #212529
}

#mainNav .navbar-toggler {
	font-size: 12px;
	right: 0;
	padding: 13px;
	text-transform: uppercase;
	color: #fff;
	border: 0;
	background-color: #fed136;
	font-family: Montserrat, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji',
		'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji', 
}

#mainNav .navbar-brand {
	color: #fed136;
	font-family: 'Kaushan Script', -apple-system, BlinkMacSystemFont,
		'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif,
		'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol',
		'Noto Color Emoji'
}

#mainNav .navbar-brand.active, #mainNav .navbar-brand:active, #mainNav .navbar-brand:focus,
	#mainNav .navbar-brand:hover {
	color: #fec503
}

#mainNav .navbar-nav .nav-item .nav-link {
	font-size: 90%;
	font-weight: 400;
	padding: .75em 0;
	letter-spacing: 1px;
	color: #fff;
	font-family: Montserrat, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji',
		'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'
}

#mainNav .navbar-nav .nav-item .nav-link.active, #mainNav .navbar-nav .nav-item .nav-link:hover
	{
	color: #fed136
}

@media ( min-width :992px) {
	#mainNav {
		padding-top: 10px;
		padding-bottom: 10px;
		transition: padding-top .3s, padding-bottom .3s;
		border: none;
		background-color: #000000;
	}
	#mainNav .navbar-brand {
		font-size: 1.75em;
		transition: all .3s
	}
	#mainNav .navbar-nav .nav-item .nav-link {
		padding: 1.1em 1em !important
	}
	#mainNav.navbar-shrink {
		padding-top: 0;
		padding-bottom: 0;
		background-color: #212529
	}
	#mainNav.navbar-shrink .navbar-brand {
		font-size: 1.25em;
		padding: 12px 0
	}
}

.navbar-brand {
	font-family: 'Kaushan Script', cursive;
	color: #fed136;
	font-size: 27px;
}
@media ( min-width :992px) {
	#mainNav {
		padding-top: 5px;
		padding-bottom: 5px;
		transition: padding-top .3s, padding-bottom .3s;
		border: none;
		background-color: #000000;
	}
	#mainNav .navbar-nav .nav-item .nav-link {
		padding: 1.1em 1em !important
	}
}



</style>
