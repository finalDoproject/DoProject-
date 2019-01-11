<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do Project!</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/project_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fullcalendar/fullcalendar.print.min.css" media="print">
<style>
/* Custom FullCalander Style */
.fc-time, .fc-title { color: #fff; }

/* Custom Modal Style */
#myCalendarModal { top: 20%; left: 20%; }

</style>
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
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/profile.do?mno=${member.mno}">
            
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
                        <h4 class="page-title">내 캘린더</h4>
                    </div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="#">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">내 캘린더</li>
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
                    <div id="calendar"></div>
                </div>
            </div>
        </div>
          <!-- /Page Content -->

        </div>
        <!-- /.container-fluid -->

        
      </div>
      <!-- /.content-wrapper -->
      
    </div>
    <!-- Button trigger modal -->
	<button type="button" id="myCalendarModalBtn" class="btn btn-primary" data-toggle="modal" data-target="#myCalendarModal">
	</button>

    <!-- Modal -->
    <div id="myCalendarModal" class="modal fade" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <input type="text" id="editCalendar" class="form-control input-lg" placeholder="일정을 입력해주세요" />
	        <input type="hidden" id="calendarId" />
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" onclick="updateCalendar();">수정</button>
	        <button type="button" class="btn btn-primary" onclick="deleteCalendar();">삭제</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>
	 $('.pj_folder').click(function (e) {  
         e.preventDefault();  
         var url = "${pageContext.request.contextPath}/project/projectPage.do";  
         window.open(url, "_self");  
     });  

	 var gEvent;
	 function updateCalendar() {
		 var calendarId = $("#calendarId").val();
		 var editCalendar = $("#editCalendar").val();

		 gEvent.title = editCalendar;
		 $('#calendar').fullCalendar('updateEvent', gEvent);
		 
		 alert("수정이 완료 되었습니다!");
		 
		 // Close Modal
          $("#myCalendarModal").modal('hide');
	 }
	 
	 function deleteCalendar() {
		 var calendarId = $("#calendarId").val();
		 
		 if(confirm("선택하신 일정을 삭제하시겠습니까?")) {
			 $('#calendar').fullCalendar('removeEvents', calendarId);
			 
			 // Close Modal
			 $("#myCalendarModal").modal('hide');
		 }
	 }
	</script>
	<script src="${pageContext.request.contextPath }/resources/fullcalendar/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/fullcalendar/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/fullcalendar/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/custom_fullcalendar.js"></script>
    <script src="${pageContext.request.contextPath }/resources/fullcalendar/locale/ko.js"></script>
</body>

</html>