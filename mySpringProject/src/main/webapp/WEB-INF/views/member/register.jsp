<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGN UP</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<form action="/member/register" method="post">
		<div class="mb-3">
			<label for="email" class="form-label">E-Mail</label> 
			<input type="text" class="form-control" id="email" placeholder="E-Mail" name="email">
		</div>
		
		<div class="mb-3">
			<label for="nickName" class="form-label">Nick-Name</label> 
			<input type="text" class="form-control" id="nickName" placeholder="nick-name" name="nickName">
		</div>
		
		<div class="mb-3">
			<label for="pwd" class="form-label">Password</label>
			<input type="text" class="form-control" id="pwd" placeholder="Password" name="pwd">
		</div>
		
		<button class="btn btn-primary" type="submit" >SIGN UP</button>
	</form>

<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
</html>