<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD MODIFY</title>
</head>
<body>
<div class="container1">
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<form action="/board/modify" method="post" enctype="multipart/form-data">

<table class="table table-hover">

	<tr>
		<th>BNO</th>
		<td>${bvo.bno }<input type="hidden" name ="bno" value="${bvo.bno }"></td>
		
	</tr>
	<tr>
		<th>Writer</th>
		<td>${bvo.writer }</td>
	</tr>
	<tr>
		<th>Title</th>
		<td><input type="text" name="title" value="${bvo.title }"></td>
	</tr>
	<tr>
		<th>Content</th>
		<td><textarea rows="3" name="content"></textarea></td>
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
					<td colspan="2" data-uuid=${fvo.uuid }>
						<span>이미지</span>
						<img alt="그림없음" src="/upload/${fn: replace(fvo.saveDir,'\\','/')}/${fvo.uuid }_th_${fvo.fileName}">
						<button type="button" id="fileRemoveBtn">삭제</button>
					</td>					
				</c:when>
			</c:choose>
		</tr>
	</c:forEach>
	
</table>
<!-- file upload -->
		<div class="mb-3">
			
		   <input type="file" class="form-control" name="files" id="files" style="display:none;" multiple="multiple">
		   <!-- input button 트리거용도의 버튼  -->
		   <button type="button" id="trigger" class="btn btn-outline-success">File Upload</button>
		</div>
		
		<div class="mb-3" id="fileZone">
			<!-- 첨부파일 표시  -->
		</div>
		
	<button type="submit" id="regBtn">수정</button>



</form>

<script type="text/javascript" src="/resources/js/boardModify.js"></script>
<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>
</body>
</html>