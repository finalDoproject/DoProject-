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
        <li class="nav-item" style="position: absolute; top:760px;">
          <a class="nav-link" href="#">
            <i class="fas fa-user-friends"></i>
            <span>참여자리스트</span></a>
        </li>
      </ul>
         
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