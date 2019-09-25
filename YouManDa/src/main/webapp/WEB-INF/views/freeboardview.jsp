<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<!DOCTYPE html>

	header : ${viewcontent.header}<br>
	title : ${viewcontent.title} <br>
	date : ${viewcontent.bdate}<br>
	writer : ${viewcontent.id}<br>
	content : ${viewcontent.content}<br>
	hit : ${viewcontent.hit}<br>
	recomend : <p id="recommend">${viewcontent.recomend}</p><br>
	
	

<input type="hidden" value="${list.bnum}" >
<input type="button" value="수정하기" onclick="freeboardedit()">
<input type="button" value="뒤로가기" onclick="backtoList()">
<input type="button" value="추천" onclick="recommendation()">
<hr>
댓글<br>


<div id="reply_list">


</div>
<%
// <c:forEach items="${viewreply}" var="replylist">
//  	<tr>
//  		작성자 : <td>${replylist.id}</td>
//  		내용 : <td>${replylist.content}</td>
//  	</tr>
// </c:forEach>
 %>
<hr>

	<input type="text" placeholder="댓글을 입력하세요." name="replycontent">
	<input type="button" value="댓글 등록" onclick="addfreereply()">


<script>
	function freeboardedit(bnum){
			location = "freeboardedit/${viewcontent.bnum}";
		}

	function backtoList(){
			history.back();
			/* 거쳐온 페이지로 뒤로 가기 */
		}

	function recommendation(){
		let bnum=${viewcontent.bnum}
		bnum = Number(bnum)
		console.log(bnum)
		$.ajax({
	        url:"../../../recommendation",
	        data : {bnum :  bnum},
	        success: function(res){
	    		let rec = $("#recommend").text()
	    		rec = Number(rec)
	        	rec += 1;
			$("#recommend").text(rec)	
	          
	        } 
	    });
	}

	function addfreereply(){
		$.ajax({
			url:'../../../addfreereply',
			data:{
				"replycontent": $('[name=replycontent]').val(),
				"bnum":"${viewcontent.bnum}"
			},
			success: function(res){
				console.log(res);
				
				getfreereply();
				}
			})

		}

	function getfreereply(){
		$.ajax({
			url:'../reply',
			data:{
				"bnum":"${viewcontent.bnum}"
			},
			success: function(res){
				var html = '';
				for(var i=0;i<res.length;i++){
					var nick = res[i].nick;
					var content = res[i].content;
					html += '작성자 : ' + nick + '&nbsp;&nbsp;&nbsp;&nbsp;'+'내용 : '+ content + '<br>';
					
					}
				$('#reply_list').empty();
				$('#reply_list').append(html);


				
			}
		})

	}

	getfreereply();
					 
		
	
</script>
