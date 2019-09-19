<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js" ></script>

<h1>마이 페이지</h1>
<br><br><br>
<form method="post">
	아이디 : ${personalinfo.id}<br>
	이름 : <input type="text" name="name" value="${personalinfo.name}" ><br>
	닉네임 : <input type="text" name="nick" value="${personalinfo.nick}" ><br>
	성별 :
	<c:choose>
		<c:when test="${personalinfo.sex} == 1">
			MALE<br>
		</c:when>
		<c:otherwise>
			FEMALE<br>
		</c:otherwise>
	</c:choose>
	이메일 : <input type="text" name="email" value="${personalinfo.email}" ><br>
	학교 : <input type="text" name="school" value="${personalinfo.school}" ><br>
	주소 : <input type="text" name="address" value="${personalinfo.address}" ><br>
	전화번호 : <input type="text" name="phonenum" value="${personalinfo.phonenum}" ><br>
	여권번호 : ${personalinfo.passnum}<br>
	생년월일 : ${personalinfo.birthday}<br>
	
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
	

	<input type="submit" value="수정완료">
</form>

