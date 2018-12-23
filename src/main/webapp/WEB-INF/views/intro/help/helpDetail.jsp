<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
		<title>Do Project! - 고객센터</title>
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
					<a href="/dp" class="logo"><strong>Do </strong> Project!</a>
				</header>

				<!-- Content -->
				<section>
					<header class="main">
						<h1>고객센터</h1>
					</header>

					<h2>QnA</h2>

					<div class="col-lg-7">
						<div class="ui-block">
							<article class="hentry post">
								<div class="m-link">

										<h2>제목</h2>
						
								</div>
								<div class="post__author author vcard inline-items">
									<div class="author-date">
										Dipendra Singh
										<div class="post__date">
											<time class="published" datetime="2004-07-24T18:18">
												Answered 2h ago </time>
										</div>
									</div>
									<div class="more">
										<a href="#"> <i class="fa fa-ellipsis-v"></i>
										</a>
									</div>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempo incididunt ut labore et dolore magna
									aliqua. Ut enim ad minim veniam, quis nostrud exercitation
									ullamco laboris consequat.</p>
								<div class="post-additional-info inline-items">
									<p>
									</p>
									<p class="social-icons">
										<a href="#" class="btn btn-sm btn-light"><i
											class="fa fa-facebook"></i></a> <a href="#"
											class="btn btn-sm btn-light"> <i class="fa fa-twitter"></i></a>
										<a href="#" class="btn btn-sm btn-light"> <i
											class="fa fa-share"></i></a>
									</p>
								</div>
							</article>
						</div>
						</div>
						<a href="#" class="button primary icon fa-search" >목록으로</a>
						<a href="#" class="button icon fa-download" style="float: right;" >수정하기</a>
				</section>
	
			</div>
		</div>




		<c:import url="../../common/introSidebar.jsp"/>
			
			

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>