<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>

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

	<footer class="container">
		<hr>
		<p>&copy; Webtoon</p>
	</footer>

</body>
</html>