<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function openChat() {
    var windowObj = null;
    var xPos = (document.body.clientWidth / 2) - 400; 
    xPos += window.screenLeft;
    var yPos = (screen.availHeight / 2) - 300;
    
    windowObj = window.open('${pageContext.request.contextPath}/chat.ch', 
    		  '_blank', 'width=800,height=600,top='+yPos+',left='+xPos
            +',toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no');
  }
</script>
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
				<ul>
					<li><a href="/dp">index</a></li>
					<li><a
						href="${pageContext.request.contextPath}/project/projectMain.do">프로젝트
							화면</a></li>
					<li><a
						href="${pageContext.request.contextPath}/mypage/mypage.do">마이페이지</a></li>
					<li><a
						href="${pageContext.request.contextPath}/member/join.do">회원</a></li>
					<li><a
						href="${pageContext.request.contextPath}/intro/board/notice.do">공지사항</a></li>
					<li><a
						href="${pageContext.request.contextPath}/intro/board/help.do">고객센터</a></li>
					<li><a
						href="${pageContext.request.contextPath}/task/taskForm.do">업무작성</a></li>
					<li><a href="#" onclick="openChat()">채팅 샘플</a></li>

				</ul>
			</nav>

			<!-- Section -->

			<!-- Section -->
			<section>
				<header class="major">
					<h2>Get in touch</h2>
				</header>
				<p>Sed varius enim lorem ullamcorper dolore aliquam aenean
					ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin
					sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat
					tempus aliquam.</p>
				<ul class="contact">
					<li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
					<li class="fa-phone">(000) 000-0000</li>
					<li class="fa-home">1234 Somewhere Road #8254<br />
						Nashville, TN 00000-0000
					</li>
				</ul>
			</section>

			<!-- Footer -->
			<footer id="footer">
				<p class="copyright">
					&copy; Untitled. All rights reserved. Demo Images: <a
						href="https://unsplash.com">Unsplash</a>. Design: <a
						href="https://html5up.net">HTML5 UP</a>.
				</p>
			</footer>

		</div>
	</div>


</body>
</html>