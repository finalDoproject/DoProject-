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

<style>
.post {
	position: relative;
	padding: 25px;
	border-bottom: 1px solid #e6ecf5;
}

.m-link a {
	color: #333;
}

.m-link a:hover {
	color: #333;
}

h6.my-4 {
margin: 13px;
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
					<a href="/dp" class="logo"><strong>Do </strong> Project!</a>
				</header>

				<!-- Content -->
				<section>
					<header class="main">
						<h1>고객센터</h1>
					</header>

					<a href="#" style="float: right;" class="button primary small">글쓰기</a>
					<h2>QnA</h2>

					<div class="col-lg-7">
						<div class="ui-block">
							<article class="hentry post">
								<div class="m-link">
									<a href="#" target="_blank">
										<h4>Why should I follow you, in five sentences?</h4>
									</a>
								</div>
								<div class="post__author author vcard inline-items">
									<img
										src="https://a11.t26.net/taringa/avatares/9/1/2/F/7/8/Demon_King1/48x48_5C5.jpg"
										alt="author">
									<div class="author-date">
										<a class="h6 post__author-name fn" href="#">Dipendra Singh</a>
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
										<a href="#" class="btn btn-sm btn-light"><span
											class="fa fa-pencil"></span> Answer</a> <a href="#"
											class="btn btn-sm btn-light"> Pass</a>
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