<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<h1> �����Խ��� </h1>
<div>
	<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>�۾���</th>
			<th>�ۼ���</th>
			<th>��ȸ</th>
			<th>��õ</th>
	</tr>
	<br>
	<input type='button' value='create' id='write' onclick='writing()' style="float: right;"><br>
</div>

<script>
    function writing(){
		location = 'freeboard/freeboardwrite';
	}
	
</script>