<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<h2>로그인 성공!</h2>
	<sec:authorize access="isAuthenticated()"> <!-- 접근 허용 판단 -->
		<h5> <sec:authentication property="principal.username"/>님, 반갑습니다. </h5>
		<form action="./logout" method="post">
			<button type="submit"> logout </button>
			<!-- csrf : 보안 -->
				<input name="${_csrf.parameterName }" type="hidden" value="${_csrf.token }" />		
		</form>
	</sec:authorize>
</body>
</html>