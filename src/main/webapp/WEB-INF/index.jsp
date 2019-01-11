<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
	<!--  -->
	<head>
		<title>Do Project!</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />

	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="/" class="logo"><strong>Do </strong> project!</a>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>프로젝트를<br />
											쉽고 편하게 <br /> 관리하세요!</h1>

										</header>
										<p> &nbsp; 지금 바로 시작하기</p>
										<c:choose>
										<c:when test="${member == null }">
										<ul class="actions">
											<li> &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/member/login.do" class="button big">login!</a></li>
										</ul>
										</c:when>
										<c:when test="${member != null }">
											<ul class="actions"> 
												<li> &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/project/projectMain.do?mno=${member.mno}" class="button big">내 프로젝트로 이동</a></li>
													<li> &nbsp;&nbsp;<a onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'" class="button big">로그아웃</a></li>
											</ul>
										</c:when>
										</c:choose>
									</div>
									<span class="image object">
										<img src="resources/images/intro/main1.png" alt="" />
									</span>
								</section>
								
							<!-- Section -->
								<section>
									<header class="major">
										<h2>기능 소개</h2>
									</header>
									<div class="posts">
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/makeProject.png" width="410" height="230" alt="" />
											<h3>프로젝트 생성</h3>
											<p>팀장이 되어 직접 프로젝트를 만들거나 팀원으로 프로젝트에 참여할 수 있습니다. 단계별 목표 설정이 가능하고 그 진행률을 한 눈에 확인하실 수 있습니다.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article>
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/workReport.png" width="410" height="230" alt="" />
											<h3>업무 리포트</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article>
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/sidebar.png" width="180" height="260" alt="" />
											<h3>사이드바</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article>
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/myScheduler.png" width="395" height="220" alt="" />
											<h3>내 캘린더</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article>
										 <article>
											<img src="${pageContext.request.contextPath}/resources/images/main/scheduleMatching.png" width="395" height="220" alt="" />
											<h3>스캐쥴 매칭</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article>
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/chatting.png" width="395" height="220" alt="" />
											<h3>채팅</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article> 
									</div>
								</section>								

							<!-- Section -->
								<section>
									<header class="major">
										<h2>h2로 쓰는 글자</h2>
									</header>
									<div class="features">
										<article>
											<span class="icon fa-diamond"></span>
											<div class="content">
												<h3>Portitor ullamcorper</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-paper-plane"></span>
											<div class="content">
												<h3>Sapien veroeros</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-rocket"></span>
											<div class="content">
												<h3>Quam lorem ipsum</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-signal"></span>
											<div class="content">
												<h3>Sed magna finibus</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
									</div>
								</section>



						</div>
					</div>
       
				<c:import url="views/common/introSidebar.jsp"/>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>