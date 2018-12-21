<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do Project!</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/project_main.css">
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
            <div class="pj_folder" style="background: rgba(255, 220, 205, 1);">
              <i class="fas fa-cog setting_icon fa-1x"></i>
              <div class="pj_folder_in">
                    <h5>프로젝트 명</h5>
                    <p>프로젝트 개요 설명 ~~ <br>
                    두줄쓰기 많이많이 </p>
                    <div class="progress_area">
                      <small>진행률</small>
                      <div class="progress">
                        <div class="progress-bar bg-success" role="progressbar" 
                        style="width: 75%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">75%</div>
                      </div>
                      <p>AA님 외 N명 참여중</p>
                    </div>       
              </div>
            </div>
            <div class="pj_folder" style="background: rgba(255, 236, 201, 1);">
                <i class="fas fa-cog setting_icon fa-1x"></i>
                <div class="pj_folder_in">
                      <h5>프로젝트 명</h5>
                      <p>프로젝트 개요 설명 ~~ <br>
                      두줄쓰기 많이많이 <br>
                      세줄까지가능 ㅎㅎ</p>
                      <div class="progress_area">
                        <small>진행률</small>
                        <div class="progress">
                          <div class="progress-bar bg-success" role="progressbar" 
                          style="width: 20%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">20%</div>
                        </div>
                        <p>AA님 외 N명 참여중</p>
                      </div>  
                </div>
              </div>
              <div class="pj_folder" style="background: rgb(252, 247, 204);">
                  <i class="fas fa-cog setting_icon fa-1x"></i>
                  <div class="pj_folder_in">
                        <h5>프로젝트 명</h5>
                        <p>프로젝트 개요 설명 ~~ <br>
                          진행단계 설정 안했을 경우<br>
                        하단에 참여자 프로필사진</p>
                        <div class="users_area">
                          <div id="users_Img" class="users_cropcircle"></div>
                          <div id="users_Img" class="users_cropcircle"></div>
                          <div id="users_Img" class="users_cropcircle"></div>
                          <p>AA님 외 N명 참여중</p>
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