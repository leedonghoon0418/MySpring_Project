<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMBER DETAIL</title>
</head>
<body>	
<div class="container1">
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>
<table class="table table-hover">
	<tr>
		<th>E-Mail</th>
		<td>${mvo.email }</td>
	</tr>
	<tr>
		<th>Nick Name</th>
		<td>${mvo.nickName }</td>
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
<a href="/member/modify?email=${mvo.email }"><button>정보수정</button></a>
<a href="/member/remove?email=${mvo.email }"><button>회원탈퇴</button></a>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>
</body>
</html>