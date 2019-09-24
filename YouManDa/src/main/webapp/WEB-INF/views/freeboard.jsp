<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<h1> 자유게시판 </h1>
<div>
<table border='1'>
	<tr>
	
			<th>말머리</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회</th>
			<th>추천</th>
			
	</tr>
	<br>
	<c:forEach items="${fblist}"  var="list">
		<tr>
			<td>${list.header}</td>
			<td onclick="viewthispost(${list.bnum})"> ${list.title}</td>
			<td>${list.id}</td>
			<td>${list.bdate}</td>
			<td>${list.hit}</td>
			<td>${list.recomend}</td>
		</tr>
		
	</c:forEach>
</table>
	
	
	
	<input type='button' value='create' id='write' onclick='writing()'>
	<br>
</div>

<script>
    function writing(){
		location = 'freeboard/freeboardwrite';
	}
	function viewthispost(bnum){
		location= "freeboard/freeboardin/"+bnum;
	}
	
</script>