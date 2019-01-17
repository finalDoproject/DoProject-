<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">
							
	
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul style="font-family: 'Exo 2', sans-serif !important; ">
										<li><a href="/">index</a></li>
										<li><a href="${pageContext.request.contextPath}/intro/board/notice.do">공지사항</a></li>
										<li><a href="${pageContext.request.contextPath}/intro/board/help.do">고객센터</a></li>
										<li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/mycalendar.do">My Page</a></li>
										<c:if test="${member.userId eq 'admin'}">
											<li><a href="${pageContext.request.contextPath}/member/MemberList.do">관리자 페이지</a></li>
										</c:if>
									</ul>
								</nav>

							<!-- Section -->

							<!-- Section -->
								<section>
									<header class="major">
										<h2>About us</h2>
									</header>
									<p style="font-size:13px;" align="justify" >다수가 모여 함께하는 프로젝트! 수시로 바뀌는 스케쥴과 계획들로 골머리를 앓은적 있으신가요? DOPROJECT와 함께라면 더이상 머리 아파하지 않으셔도 됩니다. <br>편리한 개인 일정 및 할 일 정리, 쉽고 빠른 스케쥴 매칭, 실시간 채팅 기능으로 효율적인 프로젝트를 완성해보세요.<br> DOPROJECT는 당신을 혁신적인 미래로 안내합니다.</p>
									<ul class="contact">
										<li class="fa-envelope-o"><a href="#">ddprojectbb@gmail.com</a></li>
										<li class="fa-phone">(02) 123-4567</li>
										<li class="fa-home">1234 Somewhere Road #8254<br />
										KHville, TN 9876-5432</li>
									</ul>
								</section>
								

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; DOPROJECT. All rights reserved. Project Images: <a href="">Sighjoechyo</a>. Design: <a href="">Sighjoechyo</a>.</p>
								</footer>

						</div>
					</div>

			</div>

</body>
