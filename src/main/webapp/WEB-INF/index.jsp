<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Do Project!</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />

		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700" rel="stylesheet">
		
    <style>
	
	h1,h2,h3{
	
	font-family: 'Noto Sans KR', sans-serif;
	
	
	}
	</style>
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
											<img src="${pageContext.request.contextPath}/resources/images/main/makeProject.png" width="375" height="200" style="margin-bottom:15px; margin-top:15px;"  />
											<h3>프로젝트 생성</h3>
											<p>팀장이 되어 직접 프로젝트를 만들거나 팀원으로 프로젝트에 참여할 수 있습니다. 프로젝트 생성시 단계별 목표 설정이 가능하고 그 진행률을 확인할 수 있습니다.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article>
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/workReport.png" width="375" height="230" alt="" />
											<h3>업무 리포트</h3>
											<p>모든 프로젝트 구성원은 프로젝트 내에서 진행되고 있는 혹은 완료된 사항들을 업무 리포트를 통해 한눈에 확인할 수 있습니다. 이는 프로젝트에서 후에 이루어져야 할 계획을 수립하는데 도움을 줍니다.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article>
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/sidebar.png" width="162" height="245" style="margin-left:85px" />
											<h3>사이드바</h3>
											<p>사이드바를 통해 메모와 개인 일정, 해야할 일, 스캐줄 매칭을 바로 확인 및 체크 할 수 있습니다. 해당 기능을 통해 사용자는 다른곳에 따로 필기를 하지 않아도 됩니다.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article>
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/myScheduler.png" width="360" height="200" style="margin-bottom:20px" />
											<h3>내 캘린더</h3>
											<p>내 캘린더를 통해 사용자는 프로젝트 내에서 필요한 스케줄과 개인 스케줄을 모두 기재 및 확인 할 수 있습니다.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article>
										 <article>
											<img src="${pageContext.request.contextPath}/resources/images/main/scheduleMatching.png" width="360" height="200" style="margin-bottom:20px" />
											<h3>스캐쥴 매칭</h3>
											<p>지정한 기간 내에 원하는 인원을 선택하여 스캐줄 매칭을 할 수 있습니다. 해당 기능을 통해 빠른 시간 내에 최대한 많은 인원이 모일 수 있는 날짜를 정할 수 있습니다.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article>
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/chatting.png" width="360" height="200" style="margin-bottom:20px" />
								
											<h3>채팅</h3>
											<p>사적으로 사용하는 메신저를 이용하지 않고도 프로젝트 구성원들과 실시간 채팅이 가능합니다.</p>
											<ul class="actions">
												<!-- <li><a href="#" class="button">More</a></li> -->
											</ul>
										</article> 
									</div>
								</section>								

							<!-- Section -->
								<section>
									<header class="major">
										<h2>사용자 후기</h2>
									</header>
									<div class="features">
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/woman2.png" style="margin-right:40px" />
											<div class="content">
												<h3>진진희</h3>
												<p>업무마다 프로젝트를 구분지어 운영할 수 있어서 정말 좋은 것 같아요. 진행되는 프로젝트의 큰 흐름도 잘 파악할 수 있다는 것이 큰 장점 같아요. 앞으로도 잘 사용하겠습니다!</p>
											</div>
										</article>
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/boy2.png" style="margin-right:40px" />
											<div class="content">
												<h3>황우주</h3>
												<p>두프로젝트, 직장인의 필수 프로그램같습니다! 이력관리가 쉬워 업무효율이 쭉 올라가는 것 같아요! 이런 프로그램을 만들어주셔서 감사합니다.</p>
											</div>
										</article>
										<article>
											<img src="${pageContext.request.contextPath}/resources/images/main/man.png" style="margin-right:40px" />
											<div class="content">
												<h3>강준상</h3>
												<p>업무공유 시 사적인 공간과 분리할 수 있어서 여러모로 좋습니다. 이제 이 프로그램 없는 업무는 상상하기 어렵습니다.</p>
											</div>
										</article>
										<article>
											<!-- <span class="icon fa-signal"></span>  -->
											<img src="${pageContext.request.contextPath}/resources/images/main/woman3.png" style="margin-right:40px" />
											<div class="content">
												<h3>김주영</h3>
												<p>두프로젝트와 함께하는 업무는 이제 일상입니다. 누구나 쉽게 사용할 수 있어서 추천하기도 좋습니다. 제 대학시절에도 이런 프로그램을 사용할 수 있었더라면 팀프로젝트시 정말 도움을 받았을텐데 아쉽습니다. </p>
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