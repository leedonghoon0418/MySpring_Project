<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Modify</title>
</head>
<body>
<body>
<div class="container1">
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<form action="/member/modify" method="post">
	<input type="hidden" name="email" value="${mvo.email }">
	<table class="table table-hover">
		<tr>
			<th>E-Mail</th>
			<td>${mvo.email }</td>
		</tr>
		<tr>
			<th>Nick Name</th>
			<td><input type="text" name="nickName" value="${mvo.nickName }"></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="text" name="pwd" placeholder="Password"></td>
		</tr>
		<tr>
			<th>Reg-Date</th>
			<td>${mvo.regAt }</td>
		</tr>
		<tr>
			<th>Last-Login</th>
			<td>${mvo.lastLogin }</td>
		</tr>
	</table>
	<button type="submit">수정하기</button>
</form>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>
</body>
</html>