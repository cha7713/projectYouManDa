<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js" ></script>

<h1>마이 페이지</h1>
<br><br><br>
아이디 : ${personalinfo.id} <br>
이름 : ${personalinfo.name} <br>
별명 : ${personalinfo.nick} <br>

성별 :
<c:choose>
	<c:when test="${personalinfo.sex} == 1">
		MALE<br>
	</c:when>
	<c:otherwise>
		FEMALE<br>
	</c:otherwise>
</c:choose>




이메일 : ${personalinfo.email} <br>
학교 : ${personalinfo.school} <br>
주소 : ${personalinfo.address} <br>
전화번호 : ${personalinfo.phonenum} <br>
여권번호 : ${personalinfo.passnum} <br>
생년월일 : ${personalinfo.birthday} <br>

언어 : <c:choose>
		<c:when test="${personalinfo.lang == 1}">
		한국어 <br>
		</c:when>
		<c:when test="${personalinfo.lang == 2}">
		ENGLISH<br>
		</c:when>
		<c:when test="${personalinfo.lang == 3}">
		汉语<br>
		</c:when>
		<c:otherwise>
		日本語<br>
		</c:otherwise>
	</c:choose>



<button onclick='editmypage()'>수정</button>

<script>
	function editmypage() {
		location = '../mypageedit/${personalinfo.id}';
	}

</script>