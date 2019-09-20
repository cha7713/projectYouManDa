<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
  <head>
    <meta charset="UTF-8">
    <title>bootstrap4</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
    
    <script src="/resources/js/summernote-ko-KR.js"></script> 
  </head>
  <body>
<br><br><br><br><br>

	<div style="width: 50%; margin: auto;">
		<form method="post">
			title : <select name="header">
						<option value="[자유게시판]">[자유게시판]</option>
					</select>
			<br><input type="text" name="title" value="${editpost.title}">
			<textarea id="summernote" name="content">${editpost.content}</textarea>
			
			<input type='hidden' name="id" value="${id}">
			<input type="hidden" name="lnum" value='2'>
			<input type="hidden" name="lang" value="${lang}">
			
			
			
			<input type="button" value="취소" style="float: right;" onclick="backtolist()"> 
			<input type="submit" value="수정완료"	style="float: right;">
		</form>
	</div>


	<script>
      $('#summernote').summernote({
        tabsize: 2,
        minHeight:450,
        maxHeight:null,
        focus:true,
        lang : 'ko-KR'
        
      });
      function backtolist(){
			/* location= "../freeboardin/${editpost.bnum}"; */
    	  history.back();
          }

    </script>
    
    
  </body>
</html>