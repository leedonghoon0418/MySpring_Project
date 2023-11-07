<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BAORD LIST PAGE</title>
<link rel="stylesheet" href="/resources/css/css1.css">
</head>
<body>
<div class="container1">
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>



<div class="divTable">
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
				<tr data-bno = ${bvo.bno }>
					<td><a href="/board/detail?bno=${bvo.bno }" id="${bvo.bno }">${bvo.bno }</a></td>
					<td>${bvo.title }</td>
					<td>${bvo.writer }</td>		
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 페이지 네이션 -->
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	  	<li class="page-item ${(ph.prev eq false) ? 'disabled':''}">
	  		<a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">◀</a>
	  	</li> 	
	  	<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
	    	<li class="page-item">
	    		<a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
	    	</li>   	
	  	</c:forEach>	    
	  	<li class="page-item ${(ph.next eq false) ? 'disabled':''}">
	  		<a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">▶</a>
	  	</li>
	  </ul>
	</nav>
</div>


<script type="text/javascript" src="/resources/js/boardList.js"></script>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>
</body>
</html>