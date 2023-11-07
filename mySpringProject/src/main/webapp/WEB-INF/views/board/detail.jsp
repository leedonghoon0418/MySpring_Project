<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<div class="container1">
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>
<div class="mainDiv">
	<table >
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
	
	
	
	<div>
		<div class="mb-3">
			 <label for="cmtWriter">Writer</label>
			 <input type="text" id="cmtWriter">
		</div>
		<div class="mb-3">
			 <label for="cmtText" >Content</label>
			 <textarea  rows="3" id="cmtText"></textarea>
		</div>
		<button type="button" id="postBtn">POST</button>
	</div>
	
	<div>
		<table class="tableDiv">
			<thead>
				<tr>
					<th>#</th>
					<th>WRITER</th>
					<th>CONTENT</th>
					<th>REG-DATE</th>
					<th>MOD-DATE</th>
					<th>MODIFY</th>
					<th>REMOVE</th>
				</tr>
			</thead>
			
			<tbody id="commentZone"></tbody>
		</table>
	</div>
	
	<div>
		<button type="button" id="moreBtn" data-page="1" style="visibility:hidden">MORE</button>
	</div>
	<a href="/board/remove?bno=${bvo.bno}"><button type="button" class="reBtn">REMOVE</button></a>
	<a href="/board/modify?bno=${bvo.bno}"><button type="button" class="reBtn">MODIFY</button></a>
	
	<div style="display: none" id="modZone" class="cmtModDiv">
		<div class="cmtTableBtn">
			<table class="cmtTable">
				<tr>
					<th>#</th>
					<td id="cmtModCno"></td>
				</tr>
				<tr>
					<th>Writer</th>
					<td id="cmtModWriter"> </td>
				</tr>
				<tr>
					<th>Content</th>
					<td><input type="text" id="cmtModText" name="content"></td>
				</tr>
				<tr>
					<th>Reg-Date</th>
					<td id="cmtModRegAt"></td>
				</tr>
			</table>
			<button type="button" id="editBtn">Edit</button>
			<button type="button" id="exitBtn">X</button>
		</div>
	</div>
	

</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="/resources/js/boardComment.js"></script>

<script type="text/javascript">
let bnoVal = `<c:out value="${bvo.bno}"/>`;
console.log(bnoVal);
</script>

<script type="text/javascript">
getCommentList(bnoVal);
</script>

</body>
</html>