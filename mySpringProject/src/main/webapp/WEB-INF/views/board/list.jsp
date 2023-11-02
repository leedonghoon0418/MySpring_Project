<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BAORD LIST PAGE</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<table class="table table-hover">
	<thead>
		<tr>
			<th>Bno</th>
			<th>Title</th>
			<th>Writer</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${bvo }" var="bvo">
			<tr class="">
				<td><a href="/board/detail?bno=${bvo.bno }" class="aLink">${bvo.bno }</a></td>
				<td>${bvo.title }</td>
				<td>${bvo.writer }</td>		
			</tr>
		</c:forEach>
	</tbody>
</table>

<script type="text/javascript" src="/resources/js/boardList.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>