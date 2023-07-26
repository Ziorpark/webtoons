<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
<title>유일 도서 페이지</title>

<style>
	.star-ratings {
	  color: #aaa9a9; 
	  position: relative;
	  unicode-bidi: bidi-override;
	  width: max-content;
	  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	  -webkit-text-stroke-width: 1.3px;
	  -webkit-text-stroke-color: #2b2a29;
	}
	 
	.star-ratings-fill {
	  color: #fff58c;
	  padding: 0;
	  position: absolute;
	  z-index: 1;
	  display: flex;
	  top: 0;
	  left: 0;
	  overflow: hidden;
	  -webkit-text-fill-color: gold;
	}
	 
	.star-ratings-base {
	  z-index: 0;
	  padding: 0;
	}
</style>

<script>
	function redirectToLogin() {
	    window.location.href = "/webtoons/login";
	}
	
	function redirectToLogout() {
	    window.location.href = "/webtoons/logout";
	}
	
	function ratingToPercent() {
		const score = Math.round(parseFloat("${webtoon.totalScore}") * 20);
        const numStars = Math.min(5, Math.max(0, score / 20)); // 최소 0, 최대 5개의 별
        console.log("총점: " + score);
        console.log("별의 개수: " + numStars);
        return numStars * 20.0;
	}
	// 스타일을 동적으로 변경하는 함수 호출
	  function setStarRatingsFillWidth() {
	    const starRatingsFill = document.getElementById('starRatingsFill');
	    const widthPercent = ratingToPercent();
	    starRatingsFill.style.width = widthPercent + '%';
	  }

	  // 페이지 로드 시 스타일 설정 함수 호출
	  window.onload = setStarRatingsFillWidth;
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

	<div class ="jumbotron">
   	<div class="container">
   		<div class="row"><h3>${webtoon.name }</h3></div>
   		<br>
   						
   		<div class="row" style="margin-bottom: 30px;">
   			<div class="col-6">
				<p><img src =${pageContext.request.contextPath}/resources/img/naver/${webtoon.imagPath } style="weight:50vw; height:40vh;"/>
   			</div>
   
    		<div class="col-6">
				<p><b>웹툰아이디 : </b><span class="badge badge-info">${webtoon.titleId }</span>  
				<p><b>저자 : </b>${webtoon.author }
				<p><b>연재요일 : </b>${webtoon.publicationDay }
				<p><b>장르 : </b>${webtoon.genre }
				<p><b>연재사이트 : </b>${webtoon.website }
				<p><b>줄거리 : </b><br>${webtoon.description }
			</div>
		</div>
		
		<div class="row" style="margin-bottom: 70px;">
			<div class="col-6" style="display: flex; align-items: center;">
			<p style="font-size:30px; margin-right: 10px; margin-top: 20px;"><b>총점 : </b>
				<div class="star-ratings" style="margin-right: 10px;">
					<div class="star-ratings-fill space-x-2 text-lg" id="starRatingsFill" style="width: 0%; font-size: 30px;">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
					<div class="star-ratings-base space-x-2 text-lg" style="width: 0%; font-size: 30px;">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
				</div>
				<h5 style="font-size:30px; margin: 0;">( ${webtoon.totalScore } )</h5>
			</div>
			
			<div class="col-6">
				<p><b>작화 : </b>${webtoon.drawing }
				<p><b>소재 : </b>${webtoon.material }
				<p><b>스토리 : </b>${webtoon.story }
				<p><b>메시지 : </b>${webtoon.message }
			</div>
		</div>

    	<div class="row">
   			<div class="col-md-12">
				<p><a href="${webtoon.url }" class="btn btn-primary">바로가기! &raquo;</a>
				
				<!-- Manager권한이거나 admin권한이면 수정가능하도록 버튼 구현 -->
				<sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
					<a href="<c:url value='#'/>" class="btn btn-secondary">수정하기! &raquo;</a>
				</sec:authorize>
				
				<a href="<c:url value='/list'/>" class="btn btn-secondary">웹툰목록 &raquo;</a>
   			</div>
   		</div>

   		<footer class="container">
	      <hr>
	      <p>&copy; Webtoon INFO</p>
	   	</footer>

   </div>
   </div>

</body>
</html>