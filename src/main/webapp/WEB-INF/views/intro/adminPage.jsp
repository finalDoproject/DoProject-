<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Do Project! - 관리자 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

</head>
<body>
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
										<h2>회원 관리 페이지</h2>
									</header>

											<h2> 회원 목록</h2>

					<div class="table-wrapper" >
						<table style="text-align:center;" id="mtable">
							<thead>
								<tr>
									<th style="text-align:center;">선택</th>
									<th style="text-align:center;">번호</th>
									<th style="text-align:center;">회원 아이디</th>
									<th style="text-align:center;">회원 이메일</th>
									<th style="text-align:center;">회원 별명</th>
									<th style="text-align:center;">회원 상태</th>
									<th style="text-align:center;">가입일</th>									
								</tr>
							</thead>
							<tbody style="color : black;">
								<c:forEach items="${list}" var="m" varStatus="num">
									<tr id="${m.mno}">
										<td><a href="${pageContext.request.contextPath}/member/adminDeleteMember.do?mno=${m.mno}" class="button primary small">회원 삭제</a></td>
										<td>${num.count}</td>
										<td>${m.userId}</td>
										<td>${m.email}</td>
										<td>${m.nickName}</td>
										<td>${m.mCondition }</td>
										<td>${m.mDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
 				<c:out  value="${pageBar}" escapeXml="false"/>
			</section>
						</div>
					</div>




		<c:import url="../common/introSidebar.jsp"/>
		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
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