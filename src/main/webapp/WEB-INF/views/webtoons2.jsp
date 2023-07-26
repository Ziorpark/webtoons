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
	<!-- nav�� -->
	<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container-fluid d-flex justify-content-between">
		<!-- ���� div -->  
		<div class="d-flex">
			<a class="navbar-brand" href="/webtoons/list">Ȩ</a> 
			<a class="navbar-brand" href="#">�Խ���</a> 
			
			<!-- admin ����ڸ� ��밡���ϰ��ϱ� -->
			<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin">
				<a class="navbar-brand" href="/webtoons/admin/add">����ϱ�</a>
			</sec:authorize>
		</div>
		
		<div class="d-flex justify-content-center flex-grow-1">
			<form class="form-inline" role="search" action="/webtoons/search/list">
		       <input class="form-control me-2" name="key" type="search" placeholder="�˻�" aria-label="�˻�" />
		       <button class="btn btn-outline-success" type="submit">�˻�</button>
		    </form>
		</div>
		
		<!-- �α��� �� "�α׾ƿ� ��ư ����" -->
		<sec:authorize access="isAuthenticated()">
			<div class="d-flex">
				<h3 style="font-size: 18px; color: white; margin-right: 10px; margin-top:10px;">
					<sec:authentication property="principal.username"/>��, �ݰ����ϴ�.
				</h3>
				<button type="button" class="btn btn-outline-success" onclick="redirectToLogout()">�α׾ƿ�</button>
			</div>
		</sec:authorize>
		<!-- �͸��� ������� ��� "�α��� ��ư ����" -->
		<sec:authorize access="isAnonymous()">
			<div class="d-flex">
				<button type="button" class="btn btn-outline-success" onclick="redirectToLogin()">�α���</button>
			</div>
		</sec:authorize>
	</div>
	</nav>
	<!-- nav�� -->

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