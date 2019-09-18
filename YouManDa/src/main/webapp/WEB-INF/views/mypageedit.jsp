<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js" ></script>

<h1>마이 페이지</h1>
<br><br><br>
<form method="post">
	아이디 : "${personalinfo.id}"<br>
	이름 : <input type="text" name="name" value="${personalinfo.name}" ><br>
	닉네임 : <input type="text" name="nick" value="${personalinfo.nick}" ><br>
	성별 : <input type="hidden" name="sex" value="${personalinfo.sex}" ><br>
	이메일 : <input type="text" name="email" value="${personalinfo.email}" ><br>
	학교 : <input type="text" name="school" value="${personalinfo.school}" ><br>
	주소 : <input type="text" name="address" value="${personalinfo.address}" ><br>
	전화번호 : <input type="text" name="phonenum" value="${personalinfo.phonenum}" ><br>
	여권번호 : <input type="hidden" name="passnum" value="${personalinfo.passnum}" ><br>
	생년월일 : <input type="text" name="birthday" value="${personalinfo.birthday}" ><br>
	언어 : "${personalinfo.lang}" <br>
	<input type="submit" value="수정완료">
</form>

