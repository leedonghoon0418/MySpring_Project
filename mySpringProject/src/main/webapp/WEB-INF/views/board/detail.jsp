<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>
<div class="mainDiv">
	<table class="table table-hover">
		<tr>
			<th>BNO</th>
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<th>Writer</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>Title</th>
			<td>${bvo.title }</td>
		</tr>
		<tr>
			<th>Content</th>
			<td>${bvo.content }</td>
		</tr>
		<tr>
			<th>Reg-Date</th>
			<td>${bvo.regAt }</td>
		</tr>
		<tr>
			<th>Read-Count</th>
			<td>${bvo.readCount }</td>
		</tr>
		<tr>
			<th>Has-File</th>
			<td>${bvo.hasFile }</td>
		</tr>
		<tr>
			<th>Comment-Count</th>
			<td>${bvo.cmtQty }</td>
		</tr>
		
		<c:forEach items="${flist }" var="fvo">
			<tr>
				
				<c:choose>
					<c:when test="${fvo.fileType > 0 }">
						<td colspan="2">
							<span>이미지</span>
							<img alt="그림없음" src="/upload/${fn: replace(fvo.saveDir,'\\','/')}/${fvo.uuid }_th_${fvo.fileName}">
						</td>					
					</c:when>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	<a href="/board/remove?bno=${bvo.bno}"><button type="button">REMOVE</button></a>
	<a href="/board/modify?bno=${bvo.bno}"><button type="button">MODIFY</button></a>
	
	
	<div>
		<div class="mb-3">
			 <label for="cmtWriter" class="form-label">Writer</label>
			 <input type="text" class="form-control"  id="cmtWriter">
		</div>
		<div class="mb-3">
			 <label for="cmtText" class="form-label">Content</label>
			 <textarea class="form-control"  rows="3" id="cmtText"></textarea>
		</div>
		<button type="button" id="postBtn">POST</button>
		
		<div id="commentZone">
		
		</div>
	</div>

</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>


<script type="text/javascript" src="/resources/js/boardComment.js"></script>

<script type="text/javascript">
let bnoVal = `<c:out value="${bvo.bno}"/>`;
console.log(bnoVal);
</script>

</body>
</html>