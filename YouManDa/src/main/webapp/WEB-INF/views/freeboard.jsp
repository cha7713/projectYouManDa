<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<h1> 자유게시판 </h1>
<div>
	<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회</th>
			<th>추천</th>
	</tr>
	<br>
	<input type='button' value='create' id='write' onclick='writing()' style="float: right;"><br>
</div>

<script>
    function writing(){
		location = 'freeboard/freeboardwrite';
	}
	
</script>