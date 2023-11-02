<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Register</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/nav.jsp"></jsp:include>

	<form action="/board/register" method="post" enctype="multipart/form-data">
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Title</label> 
			<input type="text" class="form-control"id="exampleFormControlInput1" placeholder="title" name="title">
		</div>
		
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Writer</label> 
			<input type="text" class="form-control"id="exampleFormControlInput1" placeholder="writer" name="writer">
		</div>
		
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">Content</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"></textarea>
		</div>
		
		<div class="mb-3">
			<input type="file" name="files" id="files" class="form-control" style="display:none;" multiple="multiple">
			 <button type="button" id="trigger" class="btn btn-primary">FILE UPLOAD</button>
		</div>
		
		<div class="mb-3" id="fileZone">
			
		</div>
			 
		<button class="btn btn-primary" type="submit" id="regBtn">REGISTER</button>
	</form>




	<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>

	
</body>
</html>