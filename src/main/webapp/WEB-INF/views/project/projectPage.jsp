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

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/project_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/BootSideMenu.css">

<!-- jsCalendar -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/jsCalendar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/jsCalendar.clean.css">

<!-- Select 2 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div id="wrapper" >

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item" style="margin-top: 20px;">
          <a class="nav-link" onclick="taskToggle();">
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
        
         <li class="nav-item" style="position: absolute; top:720px;">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#invitationModal">
            <i class="fas fa-user-friends"></i>
            <span>초대하기</span></a>
        </li>
        
        <li class="nav-item" style="position: absolute; top:760px;">
          <a class="nav-link" href="#">
            <i class="fas fa-user-friends"></i>
            <span>참여자리스트</span></a>
		
        <hr />
        <li class="nav-item">
          <a class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
    			<i class="fas fa-user-friends"></i>
    			<span>참여자 목록</span>
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
        </li>
        <div id="taskForm" class="taskForm" style="position:absolute; display: none; width:400px; height:600px; background-color : #F88E6F;">
        	<c:import url="../intro/tasktest.jsp"/>
        </div>
      </ul>
      <!-- invitationModal -->
      <div class="modal fade" id="invitationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 999999" data-backdrop="static">
              <div class="modal-dialog" role="document">
              
               <form id="proejctEnrollFrm">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="invitationModalLabel">${project.ptitle}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <div class="form-group">
                        <label for="recipient-name" class="form-control-label">프로젝트 명</label>
                        <input type="text" class="form-control" name="ptitle" placeholder="프로젝트명">
                      </div>
                      <div class="form-group">
                        <label for="message-text" class="form-control-label">프로젝트 개요</label>
                        <textarea class="form-control" name="psummary" placeholder="개요" style="resize: none;"></textarea>
                      </div>                  
                        <a href="#" class="addLevel" style="color:#ff7f50; font-weight: 700; font-size: 13px;">프로젝트 단계 설정 추가</a>
                        <a href="#" class="delLevel" style="color: rgb(185, 185, 185); font-weight: 700; font-size: 13px; display: none">프로젝트 단계 설정 취소</a>                        
                        <div class="form-group levelbox" style="display: none;">
                          <hr>
                          <label for="message-text" class="form-control-label">프로젝트 단계설정 (최대 5단계)</label>
                          <button type="button" class="btn plusbtn btn-light">+</button>
                          <button type="button" class="btn minusbtn btn-light">-</button>
                          
                          <input type="text" class="form-control" style="width: 70% !important; display: inline-block; margin-bottom: 5px;">

                        </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-light btn-sm" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-sm btn-send" style="background-color: coral; color: white">만들기!</button>
                  </div>                  
                </div>
               </form>
              </div>
            </div>   
      

     
      <!-- right nav --> 
      <div id="rightNav">
      <c:forEach items="${memoList}" var="memo" varStatus="vs">
      <%-- <form action="${pageContext.request.contextPath}/memo/insertMemo.do" class="form-inline"> --%>
          <div class="memoBox">
	            <textarea class="memopad" id="" cols="22" rows="9" <%-- onclick="this.value='${memo.mmcontent}'" --%>>${memo.mmcontent}</textarea>
	        
	      </div>
      <!-- </form> -->
      </c:forEach>
      <hr>
      <div class="cal" style="color: #555">
      	
      	 <!-- Wrapper -->
        <div id="calWrapper">
          <!-- Calendar element -->
          <div id="events-calendar"></div>
          <!-- Events -->       
          <div id="events"></div>
          <!-- Clear -->
          <div class="clear"></div>
        </div>
        <div class="clear"></div>       
      	  
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
          <button class="request" data-toggle="modal" data-target="#exampleModalCenter">요청하기</button>
          <br /><br />
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
        
        <!-- Modal -->
      <div class="modal fade mod" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Schedule Matching</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form name="requestForm" action="matching.do" method="post">
                    <table class="table">
                            <thead>
                              <tr>
                                <th scope="col" colspan="4">
                                <input type="text" name="title" placeholder="제목을 입력해주세요." style="width : 100%">
                                </th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row"><i class="fas fa-user fa-2x"></i></th>
                                <td colspan="3">
                                	
                                    <select class="member-multiple" name="mNickname" multiple="multiple"
                                    style="width : 100%" data-placeholder="스케줄 매칭을 요청할 인원을 선택해주세요">
                             		
<%--                                     <c:forEach items="${member}" var="member" varStatus="status">
                                        <option value="${member.nickName}">${member.nickName} </option>
                                     </c:forEach> --%>
                                     </select>
                                </td>
                              </tr>
                              <tr>
                                <th scope="row"><i class="far fa-calendar fa-2x"></i></th>
                                <td colspan="3">
                                        <input type="text" class="datepicker" name="startDate" id="startdate" placeholder="시작 날짜 선택"/>  
                                        <i class="fas fa-long-arrow-alt-right "></i>
                                        <input type="text" class="datepicker" name="endDate" id="enddate" placeholder="종료 날짜 선택" />
                                </td>
                              </tr>
                            </tbody>
                          </table>
                          <div class="modal-footer" >
                <button type="submit" class="btn btn-primary">요청 완료</button>
              <button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
                 </form>         
            </div>
            
            
          </div>
        </div>
      </div>
      
     
      </div>
      <!-- /right nav -->

      <div id="content-wrapper" >

        <div class="container-fluid" style="height: 2000px">


          <!-- Page Content -->
          <h1>페이지 콘텐츠 부분입니다</h1>
          <hr>
          <p>This is a great starting point for new custom pages.</p>
          <!-- /Page Content -->
<a href="#">TEST</a>
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
    
    
    <!-- datepicker를 위한 js -->
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<!-- select2를 위한 js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
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
        	  $(memopad).html()
         
         
          });
          memopad.blur(function(){
           var saveMemo = $(memopad).val();

            console.log(saveMemo);
  
        	  $.ajax({
  				url: "${pageContext.request.contextPath }/project/projectPage.do",
  				dataType: "json",
  				/* contentType: 'application/json; charset=utf-8', */
  				type:"post",
  				data:{saveMemo:saveMemo},
  				success : function(data){
  					// alert(data.msg);
  					$(memopad).reload();
  				},
  		        error:function(jqxhr, textStatus, errorThrown){
  					console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
  		        }
  			});
            
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
    </script>
    
    <!-- jsCalendar -->
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jsCalendar.js"></script>
   <script>
    // Create the calendar
    $("#calWrapper").ready(function () {
			// Get elements
			var elements = {
				// Calendar element
				calendar : document.getElementById("events-calendar"),
				// Input element
				events : document.getElementById("events")
			}

			// Create the calendar
			elements.calendar.className = "clean-theme";
			var calendar = jsCalendar.new(elements.calendar);

			// Create events elements
			elements.title = document.createElement("div");
			// elements.title.className = "title";
			// elements.events.appendChild(elements.title);
			// elements.subtitle = document.createElement("div");
			// elements.subtitle.className = "subtitle";
			// elements.events.appendChild(elements.subtitle);
			elements.list = document.createElement("div");
			elements.list.className = "list";
			elements.events.appendChild(elements.list);
			elements.actions = document.createElement("div");
			elements.actions.className = "action";
			elements.events.appendChild(elements.actions);
			elements.addButton = document.createElement("input");
			elements.addButton.type = "button";
			elements.addButton.value = "Add";
			elements.actions.appendChild(elements.addButton);

			var events = {};
			var date_format = "DD/MM/YYYY";
			var current = null;

			var showEvents = function(date){
				// Date string
				var id = jsCalendar.tools.dateToString(date, date_format, "en");
				// Set date
				current = new Date(date.getTime());
				// Set title
				// elements.title.textContent = id;
				// Clear old events
				elements.list.innerHTML = "";
				// Add events on list
				if (events.hasOwnProperty(id) && events[id].length) {
					// Number of events
					// elements.subtitle.textContent = events[id].length + " " + ((events[id].length > 1) ? "events" : "event");

					var div;
					var close;
					// For each event
					for (var i = 0; i < events[id].length; i++) {
						div = document.createElement("div");
						div.className = "event-item";
						div.textContent = (i + 1) + ". " + events[id][i].name;
						elements.list.appendChild(div);
						close = document.createElement("div");
						close.className = "close";
						close.textContent = "×";
						div.appendChild(close);
						close.addEventListener("click", (function (date, index) {
							return function () {
								removeEvent(date, index);
							}
						})(date, i), false);
					}
				} else {
					// elements.subtitle.textContent = "No events";
				}
			};

			var removeEvent = function (date, index) {
				// Date string
				var id = jsCalendar.tools.dateToString(date, date_format, "en");

				// If no events return
				if (!events.hasOwnProperty(id)) {
					return;
				}
				// If not found
				if (events[id].length <= index) {
					return;
				}

				// Remove event
				events[id].splice(index, 1);

				// Refresh events
				showEvents(current);

				// If no events uncheck date
				if (events[id].length === 0) {
					calendar.unselect(date);
				}
			}

			// Show current date events
			showEvents(new Date());

			// Add events
			calendar.onDateClick(function(event, date){
				// Update calendar date
				calendar.set(date);
				// Show events
				showEvents(date);
			});

			elements.addButton.addEventListener("click", function(){
				// Get event name
				var names = ["John", "Bob", "Anna", "George", "Harry", "Jack", "Alexander"];
				var name = prompt(
					"Event info",
					names[Math. floor(Math.random() * names.length)] + "'s birthday."
				);

				//Return on cancel
				if (name === null || name === "") {
					return;
				}

				// Date string
				var id = jsCalendar.tools.dateToString(current, date_format, "en");

				// If no events, create list
				if (!events.hasOwnProperty(id)) {
					// Select date
					calendar.select(current);
					// Create list
					events[id] = [];
				}

				// Add event
				events[id].push({name : name});

				// Refresh events
				showEvents(current);
      }, false);
    });
	</script>
    
	
</body>

</html>