<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert Webtoon</title>
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
	
	<!-- 로그인 유저확인하기 -->
	<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />

	<!-- 전광판 -->
	<div class="jumbotron jumbotron-fluid" style="height:200px;">
		<div class="container">
			<h1 class="display-4">웹툰 등록</h1>
			<p class="lead">평가하실 웹툰의 정보를 입력하세요.</p>
		</div>
	</div>
	
	<!-- 조건 확인하기 -->
	<c:choose>
		<c:when test="${isAdmin }">
		
			<!-- 맞다면 실행 -->
			<div class="container">
			
			<!-- content -->
			<form:form action="add" modelAttribute="NewWebtoon" class="form-horizontal" 
				method="post" enctype="multipart/form-data">
				<fieldset>
					<legend>${addTitle}</legend>
					<div class="form-group row">
						<label class="col-sm-2 control-label">웹툰이름</label>
						<div class="col-sm-10">
							<form:input path="name" class="form-control" />
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-2 control-label">이미지</label>
						<div class="col-sm-10">
							<form:input path="imageFile" type="file" />
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-2 control-label">저자</label>
						<div class="col-sm-10">
							<form:input path="author" class="form-control" />
						</div>
					</div>

					<div class="form-group row">
					    <label class="col-sm-2 control-label">연재요일</label>
					    <div class="col-sm-10">
					        <div class="form-check form-check-inline">
					            <form:radiobutton path="publicationDay" value="Mon" class="form-check-input" />
					            <label class="form-check-label">Mon</label>
					        </div>
					        <div class="form-check form-check-inline">
					            <form:radiobutton path="publicationDay" value="Tue" class="form-check-input" />
					            <label class="form-check-label">Tue</label>
					        </div>
					        <div class="form-check form-check-inline">
					            <form:radiobutton path="publicationDay" value="Wed" class="form-check-input" />
					            <label class="form-check-label">Wed</label>
					        </div>
					        <div class="form-check form-check-inline">
					            <form:radiobutton path="publicationDay" value="Thr" class="form-check-input" />
					            <label class="form-check-label">Thr</label>
					        </div>
					        <div class="form-check form-check-inline">
					            <form:radiobutton path="publicationDay" value="Fri" class="form-check-input" />
					            <label class="form-check-label">Fri</label>
					        </div>
					        <div class="form-check form-check-inline">
					            <form:radiobutton path="publicationDay" value="Sat" class="form-check-input" />
					            <label class="form-check-label">Sat</label>
					        </div>
					        <div class="form-check form-check-inline">
					            <form:radiobutton path="publicationDay" value="Sun" class="form-check-input" />
					            <label class="form-check-label">Sun</label>
					        </div>
					    </div>
					</div>


					<div class="form-group row">
						<label class="col-sm-2 control-label">연령제한가</label>
						<div class="col-sm-10">
							<form:input path="ageLimit" class="form-control" />
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-2 control-label">줄거리</label>
						<div class="col-sm-10">
							<form:textarea path="description" cols="50" rows="5"
								class="form-control" />
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-2 control-label">연재사이트</label>
						<div class="col-sm-10">
							<form:input path="website" class="form-control" />
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-2 control-label">장르</label>
						<div class="col-sm-10">
							<form:input path="genre" class="form-control" />
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-2 control-label">URL</label>
						<div class="col-sm-10">
							<form:input path="url" class="form-control" />
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-2 control-label">코드</label>
						<div class="col-sm-10">
							<form:input path="titleId" class="form-control" />
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-2 control-label">작화평가</label>
						<div class="col-sm-10">
							<form:input path="drawing" class="form-control" type="number"
								step="0.1" max="5"/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label">소재평가</label>
						<div class="col-sm-10">
							<form:input path="material" class="form-control" type="number"
								step="0.1" max="5"/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label">스토리평가</label>
						<div class="col-sm-10">
							<form:input path="story" class="form-control" type="number"
								step="0.1" max="5"/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label">메시지평가</label>
						<div class="col-sm-10">
							<form:input path="message" class="form-control" type="number"
								step="0.1" max="5"/>
						</div>
					</div>

					<div class="form-group row text-right" style="margin-top:50px;">
						<div class="col-sm-12">
					        <div class="d-flex justify-content-end">
					            <input type="submit" class="btn btn-primary" value="등록" style="margin-right:5px;"/>
					            <input type="reset" class="btn btn-primary" value="다시쓰기" /> 
					        </div>
					    </div>
					</div>
				</fieldset>
			</form:form>
			</div>

		</c:when>
		<c:otherwise>
			<p>사용가능한 서비스가 아닙니다.
			<p>
				<a href="<c:url value='/login' />"> 로그인하기 </a>
		</c:otherwise>
	</c:choose>
	
	<footer class="container">
      <hr>
      <p>&copy; Webtoon INFO</p>
   	</footer>

</body>
</html>