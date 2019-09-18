<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js" ></script>

<h1>마이 페이지</h1>
<br><br><br>
아이디 : ${personalinfo.id} <br>
이름 : ${personalinfo.name} <br>
별명 : ${personalinfo.nick} <br>
성별 : ${personalinfo.sex} <br>
이메일 : ${personalinfo.email} <br>
학교 : ${personalinfo.school} <br>
주소 : ${personalinfo.address} <br>
전화번호 : ${personalinfo.phonenum} <br>
여권번호 : ${personalinfo.passnum} <br>
생년월일 : ${personalinfo.birthday} <br>
언어 : ${personalinfo.lang} <br>
<br>


<button onclick='editmypage()'>수정</button>

<script>
	function editmypage() {
		location = '../mypageedit/${personalinfo.id}';
	}

</script>