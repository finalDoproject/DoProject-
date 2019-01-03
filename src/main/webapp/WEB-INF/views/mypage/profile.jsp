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
                    <div class="col-5">
                        <h4 class="page-title">정보 수정</h4>
                    </div>
                    <div class="col-7">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="#">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">정보 수정</li>
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
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-4 col-xlg-3 col-md-5">
                    <form class="form-horizontal form-material" id="update" name="MemberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
                        <div class="card">
                            <div class="card-body">
                             <div class="text-center">
                                    <center class="m-t-30 profile-pic"> 
                                        <img src="${pageContext.request.contextPath }/resources/images/profile/default.png" class="rounded-circle" width="150">
                                        <a href="javascript:;" class="pic-change" align="center">
                                             <i class="fa fa-2x fa-camera upload-button"></i>
                                            <input class="file-upload" type="file" accept="image/*"/>
                                        </a>
                                    </center>
                                </div>
                                <%-- <center class="m-t-30"> 
                                    <img src="${pageContext.request.contextPath }/resources/images/mypage/users/4.jpg" class="rounded-circle" width="150">
                                </center> --%>
                            </div>
                            <div>
                                <hr> </div>
                            
                        </div>
                    </div>
                    <!-- Column -->
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <div class="card-body" align="left">
                                
                                    <div class="form-group">
                                        <label class="col-md-12">아이디</label>
                                        <div class="col-md-12">
                                            <input type="text" name="userId" class="form-control form-control-line" required="required" value="${member.userId}" readonly required>
                                        </div>
                                        <br>
                                        <label class="col-md-12">이름</label>
                                        <div class="col-md-12">
                                            <input type="text" required="required" class="form-control form-control-line" name="nickName" value="${member.nickName}">
                                        </div>
                                        
                                    </div>
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12" required="required">이메일</label>
                                        <div class="col-md-12">
                                            <input type="email" class="form-control form-control-line" name="email" id="example-email" value="${member.email}" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">새 비밀번호</label>
                                        <div class="col-md-12">
                                            <input type="password" id="new1" name="password" required="required" class="form-control form-control-line" placeholder="새 비밀번호">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">비밀번호 확인</label>
                                        <div class="col-md-12">
                                            <input type="password" id="new2" required="required" class="form-control form-control-line" placeholder="새 비밀번호 확인">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <input type="submit" class="btn" value="프로필 수정" >
                                        </div>
                                        
                                    </div>
                                </form>
                                <br><br>
                                <div class="col-sm-12">
                                    <input type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/member/withdrawMember.do'" value="회원탈퇴">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
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
	 
	 $("#update").submit(function(event){
			
			if($('#new1').val() != $('#new2').val()) alert("비밀번호 확인 값과 다릅니다.");
			else return;
			event.preventDefault();
		});
	</script>
	
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/js/BootSideMenu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
    
</body>

</html>