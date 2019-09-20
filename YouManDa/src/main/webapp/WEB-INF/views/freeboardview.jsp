<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!DOCTYPE html>

	header : ${viewcontent.header}<br>
	title : ${viewcontent.title}<br>
	date : ${viewcontent.bdate}<br>
	writer : ${viewcontent.id}<br>
	content : ${viewcontent.content}<br>
	hit : ${viewcontent.hit}<br>
	recomend : ${viewcontent.recomend}<br>
<input type="hidden" value="${list.bnum}" >
<input type="button" value="수정하기" onclick="freeboardedit()">

<script>
	function freeboardedit(bnum){
			location = "freeboardedit/${viewcontent.bnum}";
		}
</script>
