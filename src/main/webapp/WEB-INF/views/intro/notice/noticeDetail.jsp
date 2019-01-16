<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do Project! - 공지사항</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
		
		<script>
		function delHelp(){
			
				var con_test = confirm("글을 정말 삭제하시겠습니까?");
				if(con_test == true){
				  location.href ="${pageContext.request.contextPath}/intro/board/deleteNotice.do?bno=" +${board.bno}
				}
				else if(con_test == false){
				  alert("취소되었습니다.");
				}
		
		}

		</script>
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
						<h1>공지사항</h1>
					</header>

					<h2>공지글</h2>

					<div class="col-lg-7">
						<div class="ui-block">
							<article class="hentry post">
								<div class="m-link">

										<h2><strong>${board.btitle }</strong></h2>
						
								</div>
								<div class="post__author author vcard inline-items">
									<div class="author-date">
										
										<div class="post__date">
										</div>
									</div>
									<div class="more">
										<a href="#"> <i class="fa fa-ellipsis-v"></i>
										</a>
									</div>
								</div>
								<h3><p>${board.bcontent }</p></h3>
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
						<a href="${pageContext.request.contextPath}/intro/board/notice.do" class="button primary icon fa-search" >목록으로</a>
						<c:if test="${member.userId eq 'admin'}">
						<a href="${pageContext.request.contextPath}/intro/board/updateNoticeView.do?bno=${board.bno}" class="button icon fa-download" style="float: right;" >수정하기</a>
						<a href="javascript:void(0)" onclick="delHelp();" id="delhelp" class="button icon fa-download" style="float: right;" >삭제하기</a>
						</c:if>
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