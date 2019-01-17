<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Elements - Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
		<script>
		$(function(){
			$("tr[id]").on("click",function(){
				var boardNo = $(this).attr("id");
				console.log("bordNo="+boardNo);
				location.href = "${pageContext.request.contextPath}/intro/board/noticeDetail.do?bno="+boardNo;
			});
		});
		</script>
	</head>
	<body class="is-preload">
<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="/" class="logo"><strong>Do </strong> Project!</a>
				</header>

				<!-- Content -->
				<section>
					<header class="main">
						<h1>공지사항</h1>
					</header>
					<c:if test="${member.userId eq 'admin'}">
					<a
						href="${pageContext.request.contextPath}/intro/board/insertNoticeView.do"
						style="float: right;" class="button primary small">글쓰기</a>
					</c:if>
					<h2>공지</h2>

					<div class="table-wrapper" >
						<table style="text-align:center;" id="mtable">
							<thead>
								<tr>
									<th style="text-align:center;">번호</th>
									<th width="70%" style="text-align:center;">제목</th>
									<th style="text-align:center;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="n" varStatus="num">
									<tr id="${n.bno}">
										<td>${num.count}</td>
										<td>${n.btitle}</td>
										<td>${n.bdate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
 				<c:out value="${pageBar}" escapeXml="false"/>


				</section>

			</div>
		</div>
	
		<c:import url="../../common/introSidebar.jsp" />

		<!-- Scripts -->
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
		
		<script>
			$('#mtable tbody').children().mouseenter(function () {
				$(this).children().not(':first').css({'background':'#f56a6a', 'cursor':'pointer', 'opacity': '0.7'});
				$(this).children().not(':first').click(function () {
				});
					
			}).mouseleave(function () {
				$(this).children().not(':first').css({'background':'white'});
			});
		</script>
</body>
</html>