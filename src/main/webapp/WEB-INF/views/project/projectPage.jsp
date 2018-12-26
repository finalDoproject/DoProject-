<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do Project!</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/project_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/BootSideMenu.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<div id="wrapper" >

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item" style="margin-top: 20px;">
          <a class="nav-link" href="#">
            <i class="fas fa-pen-alt"></i>
            <span>글 작성하기</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" >
            <i class="fas fa-map-marker-alt"></i>
            <span>일정 작성하기</span>
          </a>
        </li>
        <hr>

        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="fas fa-fw fa-table"></i>
            <span>전체보기</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="fas fa-map-marked-alt"></i>
            <span>전체일정</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="fas fa-file-download"></i>
            <span>파일함</span></a>
        </li>
        <li>
        <div class="dropup" style="position: absolute; top:760px; margin-left:20px;">
  			<a class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
  				style="background-color:#F88E6F;">
    			<i class="fas fa-user-friends" style="color: rgba(255, 255, 255, 0.7);"></i> <span style="color: rgba(255, 255, 255, 0.7);">참여자리스트</span>
  			</a>
  			<div class="dropdown-menu">
  				<div>
    			<a class="dropdown-item" href="#" style="height:40px; vertical-align:middle;" onclick="kick();">
    				<img src='https://bootdey.com/img/Content/avatar/avatar1.png' alt='profilpicture' style='float: left; width:30px; height:30px; border-radius: 50%;'>
    				&nbsp;<span style="vertical-align:middle;">홍길동</span></a>
				</div>
				<div>
				<a class="dropdown-item" href="#" style="height:40px; vertical-align:middle;" onclick="kick();">
					<img src='https://bootdey.com/img/Content/avatar/avatar1.png' alt='profilpicture' style='float: left; width:30px; height:30px; border-radius: 50%;'>
					&nbsp;<span style="vertical-align:middle;">신사임당</span></a>
				</div>
				<div>
				<a class="dropdown-item" href="#" style="height:40px; vertical-align:middle;" onclick="kick();">
					<img src='https://bootdey.com/img/Content/avatar/avatar1.png' alt='profilpicture' style='float: left; width:30px; height:30px; border-radius: 50%;'>
					&nbsp;<span style="vertical-align:middle;">김유신</span></a>
				</div>
				<div>
				<a class="dropdown-item" href="#" style="height:40px; vertical-align:middle;" onclick="kick();">
					<img src='https://bootdey.com/img/Content/avatar/avatar1.png' alt='profilpicture' style='float: left; width:30px; height:30px; border-radius: 50%;'>
					&nbsp;<span style="vertical-align:middle;">고길동</span></a>
				</div>
				<div>
				<a class="dropdown-item" href="#" style="text-align:center; font-weight:bolder;" onclick="out();">프로젝트 나가기</a>
  				</div>
			</div>
		</div>
		</li>
      </ul>
         
      <!-- right nav -->
      <div id="rightNav">
        <div class="memoBox">
            <textarea class="memopad" id="" cols="22" rows="9" onclick="this.value=''">간단한 메모를 작성하세요.
        </textarea>
      </div>
      <hr>
      <div class="cal" style="color: #555">
        <h6>달력</h6>
        <div style="width: 200px; height: 200px; background-color: antiquewhite; margin: 0 auto"></div>
      </div>
      <hr>
      <div class="todo" style="color: #555">
        <h6>할일</h6>
        <p>
          <input type="checkbox" name="todo_answer" value="ck1" id="ck1"> 
          <label for="ck1">우유 사기</label> <i class="fas fa-times-circle delete_todo" style="display: none"></i>
        </p>
        <p>
          <input type="checkbox" name="todo_answer" value="ck2" id="ck2">
          <label for="ck2">자전거 타기</label> <i class="fas fa-times-circle delete_todo" style="display: none"></i>
        </p>
        <p>
          <input type="checkbox" name="todo_answer" value="ck3" id="ck3">
          <label for="ck3">낮잠 자기</label> <i class="fas fa-times-circle delete_todo" style="display: none"></i>
        </p>
        <p>
          <input type="checkbox" name="todo_answer" value="ck4" id="ck4">
          <label for="ck4">고양이랑 놀아주기</label> <i class="fas fa-times-circle delete_todo" style="display: none"></i>
        </p>
        <p>
          <input type="checkbox" name="todo_answer" value="ck5" id="ck5">
          <label for="ck5">점심메뉴 정하기</label> <i class="fas fa-times-circle delete_todo" style="display: none"></i>
        </p>
        
      </div>
      <hr>
      <div class="timetable" style="color: #555">
          <h6>스케줄매칭</h6>
          <ul style="list-style-type: disc;">
            
              <li>
                <a href="#" style="color: #555;">고양이 친목모임 <button class="ongoing">진행중</button></a>
              </li>
              <li>
                <a href="#" style="color: #555;">연말 모임<button class="complete">완료</button></a>
              </li>
            </ul>
        </div>
        <hr>
      </div>
      <!-- /right nav -->

      <div id="content-wrapper" >

        <div class="container-fluid" style="height: 2000px">


          <!-- Page Content -->
          <h1>페이지 콘텐츠 부분입니다</h1>
          <hr>
          <p>This is a great starting point for new custom pages.</p>
          <!-- /Page Content -->

        </div>
        <!-- /.container-fluid -->

        
      </div>
      <!-- /.content-wrapper -->
      
    </div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	 <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
	
	<!-- right nav-->
    <script src="https://www.w3schools.com/lib/w3.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/js/BootSideMenu.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            w3.includeHTML(init);
        });

        function init() {
            $('#rightNav').BootSideMenu({
                side: "right",
                //pushBody:false,
                width: '280px',
                closeOnClick: true
            });
        }
        // right nav memopad 
        $(document).ready(function() {
          var memopad = $('.memopad');
          memopad.focus(function(){
           // $(this).val("포커스 on");
          });
          memopad.blur(function(){
            // $(this).val("포커스 out");
          });
        });
        // right nav checkBox 
        $(document).ready(function() { 
        $("input:checkbox").on('click', function() {
             if ( $(this).prop('checked') ) {
                  $(this).next().addClass("selected");
                  
             } else { $(this).next().removeClass("selected");
             } 
             if($(this).next().next(".delete_todo").css("display") == "none"){
                $(this).next().next(".delete_todo").show();
            } else {
                $(this).next().next(".delete_todo").hide();
            }
        }); 
    });
        
        function kick(){
        	if(confirm("추방하시겠습니까?") == true){
        		document.form.submit();
        	}else{
        		return;
        	}
        }
        
        function out(){
        	if(confirm("해당 프로젝트에서 나가시겠습니까?") == true){
        		document.form.submit();
        	}else{
        		return;
        	}
        }

   	
    </script>
	
</body>

</html>