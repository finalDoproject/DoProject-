<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do Project! - 공지 작성</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />		

	
</head>
<body>

		
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
			<form action="/nInsert.no" method="post">

			<div align="center" >
				제목 : &nbsp; <input type="text" style="width:40%; " placeholder="제목을 입력하세요" /><br>
				작성자 : <input type="text" style="width: 20%;" />&nbsp; <br />
				작성일 : &nbsp; <input type="date" id="date" name="date">
				<input type="hidden" value="" name="userId"> 

			</div>
			<br>

			<div class="container" align="center">
				
				<textarea id="helptext" style="width: 50%; height:400px; margin-left: 100px; margin-right: 100px;"></textarea>

				<div align="center">
					<button type="reset" id="btn1" onclick="gotoList()">취소하기</button>
					<button type="submit" id="btn2">등록하기</button>
				</div>
			</div>

			<br>
			<br />

		</form>
			
					
				</section>
	
			</div>
		</div>

	<c:import url="../../common/introSidebar.jsp"/>
	
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
		
</body>
</html>