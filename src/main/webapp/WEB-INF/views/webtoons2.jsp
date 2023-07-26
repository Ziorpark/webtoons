<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<!--  <link href="./resources/css/bootstrap.min.css" rel="stylesheet"> -->
<meta charset="utf-8">
<title>welcome</title>
<script>
    function redirectToLogin() {
        window.location.href = "/webtoons/login";
    }
    
    function redirectToLogout() {
        window.location.href = "/webtoons/logout";
    }
</script>

</head>
<body>
	<!-- nav바 -->
	<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container-fluid d-flex justify-content-between">
		<!-- 왼쪽 div -->  
		<div class="d-flex">
			<a class="navbar-brand" href="/webtoons/list">홈</a> 
			<a class="navbar-brand" href="#">게시판</a> 
			
			<!-- admin 사용자만 사용가능하게하기 -->
			<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin">
				<a class="navbar-brand" href="/webtoons/admin/add">등록하기</a>
			</sec:authorize>
		</div>
		
		<div class="d-flex justify-content-center flex-grow-1">
			<form class="form-inline" role="search" action="/webtoons/search/list">
		       <input class="form-control me-2" name="key" type="search" placeholder="검색" aria-label="검색" />
		       <button class="btn btn-outline-success" type="submit">검색</button>
		    </form>
		</div>
		
		<!-- 로그인 시 "로그아웃 버튼 생성" -->
		<sec:authorize access="isAuthenticated()">
			<div class="d-flex">
				<h3 style="font-size: 18px; color: white; margin-right: 10px; margin-top:10px;">
					<sec:authentication property="principal.username"/>님, 반갑습니다.
				</h3>
				<button type="button" class="btn btn-outline-success" onclick="redirectToLogout()">로그아웃</button>
			</div>
		</sec:authorize>
		<!-- 익명의 사용자인 경우 "로그인 버튼 생성" -->
		<sec:authorize access="isAnonymous()">
			<div class="d-flex">
				<button type="button" class="btn btn-outline-success" onclick="redirectToLogin()">로그인</button>
			</div>
		</sec:authorize>
	</div>
	</nav>
	<!-- nav바 -->

	<!-- content -->
	<div class ="jumbotron">
		<div class="row" align="center">
			
			<c:forEach items = "${webtoonList }"  var = "webtoon">
				<div class="col-md-4" style="margin-bottom:10px;"">
					<!-- <p><img src =./resources/img/${webtoon.imagPath }></p> -->
					<p><a href="/webtoons/titleId?id=${webtoon.titleId }">
						<img src =${pageContext.request.contextPath}/resources/img/naver/${webtoon.imagPath }>
					</a></p>
					<h3>${webtoon.name}</h3>
					<p>${webtoon.author}				
						<br>${webtoon.genre} | ${webtoon.publicationDay}
						<br>${webtoon.website} | ${webtoon.ageLimit }
					<!-- <p align=Left>${fn:substring(webtoon.description,0,30)}... -->
				 </div>
			</c:forEach>
		</div>
	</div>
	<!-- content -->
	
	<!-- footer -->
	<footer class="container">
		<hr>
		<p>&copy; Webtoon</p>
	</footer>
	<!-- footer -->

</body>
</html>