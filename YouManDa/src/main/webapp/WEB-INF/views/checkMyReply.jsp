<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
내 댓글 확인
<table border="1">
	<tr>
		<th>게시글 제목 어떻게 가져오지..</th>
		<th>댓글내용</th>

	</tr>

	<c:forEach items="${checkfreeboardReply}" var="list">
		<tr>
			<td>${list.TITLE}</td>
			<td>${list.CONTENT}</td>
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