<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
�� ��� Ȯ��
<table border="1">
	<tr>
		<th>�Խñ� ���� ��� ��������..</th>
		<th>��۳���</th>

	</tr>

	<c:forEach items="${checkfreeboardReply}" var="list">
		<tr>
			<td>${list.TITLE}</td>
			<td>${list.CONTENT}</td>
			<br>
		</tr>
	</c:forEach>
</table>



<input type="button" value="�ڷΰ���" onclick="backToMypage()">


<script>
	function backToMypage(){
		history.back();
		}
</script>