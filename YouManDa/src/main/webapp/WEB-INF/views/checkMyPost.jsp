<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
�� �Խù� Ȯ��
<table border="1">
	<tr>
		<th>���Ӹ�</th>
		<th>����</th>
		<th>�ۼ���</th>
		<th>��ȸ��</th>
		<th>��õ</th>
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



<input type="button" value="�ڷΰ���" onclick="backToMypage()">


<script>
	function backToMypage(){
		history.back();
		}
</script>