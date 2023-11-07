<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Home</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="/board/list">BOARD LIST</a>
        </li>
        
        <sec:authorize access="isAuthenticated()">
	        <sec:authentication property="principal.mvo.email" var="authEmail"/>
	        <sec:authentication property="principal.mvo.nickName" var="authNick"/>
	        <sec:authentication property="principal.mvo.authList" var="auths"/>
        
        	<c:choose>
        		<c:when test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
	        		 <li class="nav-item">
	          			<a class="nav-link" href="/member/list">MEMBER LIST(ADMIN)</a>
	        		</li>
        		</c:when>
        		
        		<c:otherwise>
        			 <li class="nav-item">
	          			<a class="nav-link" href="/member/detail?email=${authEmail}">MEMBER DETAIL( ${authEmail} )</a>
	        		</li>
        		</c:otherwise>
        	</c:choose>	
        	
        
	        <li class="nav-item">
	          <a class="nav-link" href="/member/logout">LOGOUT</a>
	        </li>
	              
	        <li class="nav-item">
	          <a class="nav-link" href="/board/register">BOARD REG</a>
	        </li>
        
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
	        <li class="nav-item">
	          <a class="nav-link" href="/member/register">SIGN UP</a>
	        </li>
	
	        
	        <li class="nav-item">
	          <a class="nav-link" href="/member/login">LOGIN</a>
	        </li>
        </sec:authorize>
        
      
      </ul>
      <form class="d-flex" role="search" action="/board/list" method="get">
      
      	<c:set value="${ph.pgvo.type }" var="typed"></c:set>
      	<select name="type">
      		<option ${typed eq null ? 'selected':''}>Choose..</option>
      		<option value="t" ${typed eq "t" ? 'selected':''}>Title</option>
      		<option value="w" ${typed eq "w" ? 'selected':''}>Writer</option>
      		<option value="c" ${typed eq "c" ? 'selected':''}>Content</option>
      		<option value="tw" ${typed eq "tw" ? 'selected':''}>Title + Writer</option>
      		<option value="tc" ${typed eq "tc" ? 'selected':''}>Title + Content</option>
      		<option value="cw" ${typed eq "cw" ? 'selected':''}>Content + Writer</option>
      		<option value="twc" ${typed eq "twc" ? 'selected':''}>All</option>
      	</select>
      
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword" value="${ph.pgvo.keyword }">
        <input type="hidden" name="pageNo" value="1">
        <input type="hidden" name="qty" value="${ph.pgvo.qty }">
        
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

</body>
</html>