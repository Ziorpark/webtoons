<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<meta charset="utf-8">
<title>welcome</title>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="controller">
			<div>
				<a class="navbar-brand" href="./home">home</a> <a
					class="navbar-brand" href="./home">∞‘Ω√∆«</a> <a class="navbar-brand"
					href="./home">ºÓ«Œ∏Ù</a>
			</div>
		</div>
	</nav>
	
	
	<div class ="jumbotron">
		<div class="row" align="center">
			
			<c:forEach items = "${webtoonList }"  var = "webtoon">
				<div class="col-md-4">
					<!-- <p><img src =./resources/img/${webtoon.imagPath }></p> -->
					<p><img src =${pageContext.request.contextPath}/resources/img/${webtoon.imagPath }></p>
					<h3>${webtoon.name}</h3>
					<p>${webtoon.author}				
						<br>${webtoon.genre} | ${webtoon.releaseDay}
					<p align=Left>${fn:substring(webtoon.description,0,60)}...
					<p>${webtoon.ranking}
				 </div>
		
			</c:forEach>
		</div>
	</div>
	
	<!--  
	<div class="jumbotron">
		<div class="controller">
			<h1 class="display-3">${hello}</h1>
		</div>
	</div>

	<div class="container">
		<div class="text-center">
			<h3>${strapline}</h3>
		</div>
	</div>
-->
	<footer class="container">
		<hr>
		<p>&copy; Webtoon</p>
	</footer>

</body>
</html>