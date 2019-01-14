<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do Project!</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/project_main.css">
<style>
.searchHref {
	color:#333 !important;
	
}
.searchHref:hover {
	color:#888 !important;
}
table {
	border-top: 0px solid #444444;
	border-collapse: collapse;
	text-align: left;
	background-color: #F6F6F6;
}

th, td {
	border-bottom: 0px solid #444444;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div id="wrapper">
		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item" style="margin-top: 20px;"><a
				class="nav-link " onclick="history.back(-1);"> <i
					class="fas fa-undo-alt"></i> <span>뒤로가기</span>
			</a></li>
		</ul>
		<div id="content-wrapper" style="margin: 80px auto;">

			<div id="search-task-list">
				<c:set value="${searchTasklist}" var="result" />
				<c:if test="${!empty result}">
					<c:forEach items="${result}" var="result" varStatus="">
					<c:if test="${member.mno == result.tmno}">
					<a class="searchHref" href='${pageContext.request.contextPath}/project/projectPage.do?pno=${result.tpno}&mno=${member.mno}'>
						<table width="90%" style="margin: 0 auto">
							<tr>
								<th
									style="text-align: left; margin: 7px; padding: 8px; font-size: 18px;">
									<%-- <a href='${pageContext.request.contextPath}/project/projectPage.do?pno=${result.tpno}&mno=${member.mno}'> --%>
										&nbsp; ${result.ttitle}</a><small> &nbsp; 프로젝트 명: ${result.pttitle}</small>
								<hr style="margin: 2px;">
								</th>
							</tr>

							
								<table width="90%" style="margin: 0 auto; padding: 2px 5px;">
									<tr>
										<td width="20%">&nbsp;작성자: ${result.nickname}</td>
										<td width="60%">작성일: ${result.twritedate}</td>
										<th width="20%"></th>
									</tr>
									<tr>
										<td colspan="3">
											<p style="margin: 5px;">${result.tcontent}</p>
											<hr style="margin: 0 5px;">
										</td>
									</tr>
								</table>

						</table>
						</a>
						
					</c:if>
					</c:forEach>
				</c:if>
			</div>
			<script type="text/javascript">
				$(function() {
					var reg = /${searchWd}/g;
					var searchWord = "${searchWd}";
					var replaced = $("#search-task-list").html().replace(
							/${searchWd}/gi, '<b>' + searchWd + '</b>');
					$("#search-task-list").html(replaced);
				});
			</script>

			<c:if test="${empty searchTasklist}">
				<h3>검색 결과가 없습니다.</h3>
			</c:if>
		</div>
		<!-- /.content-wrapper -->

	</div>


	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>

	<script>
		
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>