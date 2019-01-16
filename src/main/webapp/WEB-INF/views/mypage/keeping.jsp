<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do Project!</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<div id="wrapper" >

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item" style="margin-top: 20px;">
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypage.do">
            <i class="fas fa-user"></i>
            <span>My Page</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mycalendar.do" >
            
            <span>내 캘린더</span>
          </a>
        </li>
        <hr>

        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypost.do?mno=${member.mno}">
            
            <span>내가 쓴 글</span></a>
        </li>
        <%-- <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/keeping.do">
            
            <span>담아둔 글</span></a>
        </li> --%>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/profile.do?mno=${member.mno}">
            
            <span>정보 수정</span></a>
        </li>
      </ul>
         
      
        

      <div id="content-wrapper" >

        <div class="container-fluid">


          <!-- Page Content -->
        <div class="page-wrapper">
            <div class="page-wrapper">
                <div class="page-breadcrumb" align="left">
                    <div class="row">
                        <div class="col-5 align-self-center">
                            <h4 class="page-title">담아 둔 글</h4>
                        </div>
                        <div class="col-7 align-self-center">
                            <div class="d-flex align-items-center justify-content-end">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item">
                                            <a href="#">Home</a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">담아 둔 글</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- ============================================================== -->
                <!-- Container fluid -->
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-body" align="left">
                            <div class="d-flex flex-row comment-row m-t-0">
                                <div class="mr10">
                                    <img src="${pageContext.request.contextPath }/resources/images/mypage/users/1.jpg" alt="user" width="55" class="rounded-circle">
                                </div>
                                <div class="comment-text w-100">
                                    <h4>이름</h4>
                                    <span>April 14, 2016 </span>
                                </div>
                            </div>
                            <!-- d-flex -->
                            <div class="write-text-box">
                                <h5>메인 UI 공유합니다</h5>
                                <p>한번씩 보시고 피드백 주세요!</p>
                            </div>
                        </div>
                        <!--card-body-->
                    </div>
                    <!--card-->
                    <div class="card">
                        <div class="card-body" align="left">
                            <div class="d-flex flex-row comment-row m-t-0">
                                <div class="mr10">
                                    <img src="${pageContext.request.contextPath }/resources/images/mypage/users/2.jpg" alt="user" width="55" class="rounded-circle">
                                </div>
                                <div class="comment-text w-100">
                                    <h4>이름</h4>
                                    <span>April 14, 2016 </span>
                                </div>
                            </div>
                            <!-- d-flex -->
                            <div class="write-text-box">
                                <h5>메인 UI 공유합니다</h5>
                                <p>한번씩 보시고 피드백 주세요!</p>
                            </div>
                        </div>
                        <!--card-body-->
                    </div>
                    <!--card-->
                </div>
            </div>
        </div>
    </div>
          <!-- /Page Content -->

        </div>
        <!-- /.container-fluid -->

        
      </div>
      <!-- /.content-wrapper -->
      
    </div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>
	
	 $('.pj_folder').click(function (e) {  
         e.preventDefault();  
         var url = "${pageContext.request.contextPath}/project/projectPage.do";  
         window.open(url, "_self");  
     });  
	
	</script>
</body>

</html>