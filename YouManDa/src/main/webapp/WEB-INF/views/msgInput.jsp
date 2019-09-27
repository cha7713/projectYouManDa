<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


</head>
<body>
<form method="post" action="msgInput">
받는사람:<input type="text" name="id" value="${toUser}" readonly="readonly">
<input type="hidden" name="lang" value="${toUserLang}" >
<input type="hidden" name="id2" value="${fromUser}"><br>
<input type="hidden" name="lang2" value="${fromUserLang}">
<textarea name="msgcontent"></textarea>
<input type="submit" value="쪽지보내기">

</form>

	
</body>

<script>

$('input:submit').click(function() {
	$.ajax({
		url: 'msgInput',
		type: 'post',
		data: $('form').serialize(),
		success: function(res) {
			alert('쪽지 발송 완료');
			self.close();
		}
	})
	return false;
});

</script>
</html>