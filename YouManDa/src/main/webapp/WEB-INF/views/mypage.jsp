<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>마이 페이지</h1>
<br><br><br>
아이디 : ${personalinfo.id}
이름 : ${personalinfo.name}
별명 : ${personalinfo.nick}
성별 : ${personalinfo.sex}
이메일 : ${personalinfo.email}
학교 : ${personalinfo.school}
주소 : ${personalinfo.address}
전화번호 : ${personalinfo.phonenum}
여권번호 : ${personalinfo.passnum}
생년월일 : ${personalinfo.birthday}
언어 : ${personalinfo.lang}
<br>


<button onclick='edit'>edit</button>
<button onclick='backtolist()'>back</button>

<script>
	function backtolist() {
		location = '../list';
	}
	
	function deleteFile(){
		location = 'deleteBoard';
	}
</script>