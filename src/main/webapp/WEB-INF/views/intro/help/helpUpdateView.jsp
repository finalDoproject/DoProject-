<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do Project! - 고객센터 글 수정</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />		

	<script>
	function gotoList(){
	
		location.href="${pageContext.request.contextPath}/intro/board/help.do";
	}
	
	</script>
</head>
<body>
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
						<h1>고객센터</h1>
					</header>
			<form action="${pageContext.request.contextPath}/intro/board/updateHelp.do" method="post">
			<input type="hidden" name="bno" value="${board.bno }"/>
			<div align="center" >
				제목 : &nbsp; <input type="text" name="btitle" style="width:40%; " placeholder="제목을 입력하세요" value="${board.btitle }" required /><br>
					<input type="hidden" style="width: 20%;" value="1" />&nbsp; <br />

			</div>
			<br>

			<div class="container" align="center">
				
				<textarea name="bcontent" style="width: 50%; height:400px; margin-left: 100px; margin-right: 100px;">${board.bcontent }</textarea>

				<div align="center">
					<button type="reset" id="btn1" onclick="gotoList()">취소하기</button>
					<button type="submit" id="btn2">수정하기</button>
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