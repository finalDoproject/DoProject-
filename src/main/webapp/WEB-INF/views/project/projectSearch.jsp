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
  table {
    
    border-top: 0px solid #444444;
    border-collapse: collapse;
    text-align: left;
    background-color: #eee;
    
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
				class="nav-link " onclick="history.back(-1);"> <i class="fas fa-undo-alt"></i>
					<span>뒤로가기</span>
			</a></li>
		</ul>
		<div id="content-wrapper" style="margin: 80px auto; ">
		<table width="90%" style="margin: 0 auto">
			<tr>
			<th style="text-align: left; margin: 7px;padding: 8px; font-size: 18px;">&nbsp; &nbsp;프로젝트명<hr style="margin: 2px;"></th>
			
			</tr>
			
			<table width="90%" style="margin: 0 auto; padding: 2px 5px;">
				<tr>
					<td width="20%">
						&nbsp; 홍길동
					</td>
					<td width="20%">
						1212/22/22
					</td>
					<th width="60%">
					</th>
				</tr>			
				<tr>
					<td colspan="3">
						<p style="margin: 5px;">getBoard 메소드 호출시 Request 파라미터에서 "board_seq" 를 찾아 int board_seq 에 넣어둔다.</p>
						<hr style="margin: 0 5px;">
					</td>
				</tr>
				
				<%-- 
				<c:forEach items="${list}" var="boardVO">
					<tr>
						<td>${boardVO.bno}</td>
						<td><a
							href='/read${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>
								${boardVO.title} </a></td>
						<td>${boardVO.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${boardVO.regdate}" /></td>
						<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>
					</tr>
				</c:forEach>
				 --%>
			</table>
		</table>
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