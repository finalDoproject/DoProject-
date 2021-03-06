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
          <a class="nav-link" href="#" onclick="return false;" style="cursor:default">
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
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypost.do">
            
            <span>내가 쓴 글</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/keeping.do">
            
            <span>담아둔 글</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/profile.do">
            
            <span>정보 수정</span></a>
        </li>
      </ul>
         
      
        

      <div id="content-wrapper" >

        <div class="container-fluid">


         <!-- Page Content -->
             <div class="page-wrapper">
            <div class="page-breadcrumb" align="left">
                <div class="row">
                    <div class="col-5 align-self-center">
                        <h4 class="page-title">My Page</h4>
                    </div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="#">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">My Page</li>
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
               	My Page!
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