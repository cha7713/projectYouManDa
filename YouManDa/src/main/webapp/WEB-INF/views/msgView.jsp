<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


</head>
<body>

<div class="container">
<table>
<tr><th>보낸사람</th><th>내용</th></tr>
<c:forEach items="${msgList}" var="item">
<tr><td>${item.id2}</td><td>${item.msgcontent}</td></tr>
</c:forEach>

</table>

</div>

	
</body>

<script>


</script>
</html>