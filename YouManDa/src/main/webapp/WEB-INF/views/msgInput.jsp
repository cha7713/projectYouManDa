<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" %>

<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
	<body>
	<div style="background-color: yellow; width: 500px">

		<form method="post" action="msgInput">
			받는사람:<input type="text" name="id" value="${toUser}"
				readonly="readonly"> <input type="hidden" name="lang"
				value="${toUserLang}"> <input type="hidden" name="id2"
				value="${fromUser}"><br> <input type="hidden"
				name="lang2" value="${fromUserLang}"> <label for="comment">내용</label>
			<textarea name="msgcontent"></textarea>
			<input type="submit" value="쪽지보내기">
		</form>
	</div>
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