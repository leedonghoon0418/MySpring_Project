<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

</head>
<body>
<div class="container1">
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

	<form action="/member/login" method="post">
	
		<div class="mb-3">
			<label for="email" class="form-label">E-Mail</label> 
			<input type="text" class="form-control"id="email" placeholder="E-Mail" name="email">
		</div>
		
		<div class="mb-3">
			<label for="pwd" class="form-label">Password</label> 
			<input type="text" class="form-control"id="pwd" placeholder="Password" name="pwd">
		</div>
		
		<c:if test="${not empty param.errMsg }">
			<div>
				<c:choose>
					<c:when test="${param.errMsg eq 'Bad credentials'}">
						<c:set var="errText" value="이메일 & 비밀번호가 일치하지 않습니다."/>
					</c:when>
				</c:choose>
				${errText }
			</div>
		</c:if>
			 
		<button class="btn btn-primary" type="submit" id="loginBtn">LOGIN</button>
	</form>


<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>

</body>
</html>