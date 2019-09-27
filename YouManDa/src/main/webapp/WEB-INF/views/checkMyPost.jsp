<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
내 게시물 확인
<table border="1">
	<tr>
		<th>말머리</th>
		<th>제목</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>추천</th>
	</tr>

	<c:forEach items="${checkfreeboardPost}" var="list">
		<tr>
			<td>${list.header}</td>
			<td>${list.title}</td>
			<td>${list.bdate}</td>
			<td>${list.hit}</td>
			<td>${list.recomend}</td>
			<br>
		</tr>
	</c:forEach>
</table>



<input type="button" value="뒤로가기" onclick="backToMypage()">


<script>
	function backToMypage(){
		history.back();
		}
</script>