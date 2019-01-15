<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- Bootstrap 4 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<!-- Bootstrap core CSS-->
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="${pageContext.request.contextPath }/resources/css/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath }/resources/css/sb-admin.css"
	rel="stylesheet">
<!-- Logo fonts -->
<link href="https://fonts.googleapis.com/css?family=Exo+2:300i,800i"
	rel="stylesheet">
</head>
<body id="page-top">
	<div>
		<nav class="navtop navbar navbar-expand static-top" >
	      <div class="logo_area " style="width: 200px; height: 60px;">
	        <a class="navtop_logo"  href="/dp">
	        	<b style="font-family:'Exo 2', sans-serif; font-size: 26px">DOPE</b>
	        	<small style="font-family:'Exo 2', sans-serif; font-size: 17px">Do Project!</small></a>
	      </div>
	
	     
	
	      <!-- Navbar Search -->
	        <div class="input-group">
	          <div class="input-group-append searchBar_area" >
	            <i class="fas fa-search" style="color: rgba(73, 77, 82, 0.6); margin: 5px 10px;"></i>
			      <form id="searchListFrm" action="${pageContext.request.contextPath}/project/projectSearch.do?" >
			      <input type="hidden" name="mno" value="${member.mno}">
			      <input type="text" class="searchBar" id="searchWd" name="searchWd" placeholder="검색어 입력 후 Enter" />
		      	 </form>
	          </div>
	        </div>
	
	      <!-- Navbar -->
	      <ul class="navbar-nav" style="padding-right: 30px; position: absolute; right: 0;">
	          <li class="nav-item dropdown no-arrow mx-1" style="margin-top: 10px">
	              <a class="nav-link dropdown-toggle goPjview" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
	              target=_blank title="프로젝트 목록보기">
	              <!-- <i class="fas fa-folder" style="color: rgba(248, 143, 111, 0.6)"></i> -->
	               <c:if test="${!empty member}">

							<span class="headerMno" id="mnoSession" data-value="@Request.RequestContext.HttpContext.Session['mno']" name="mno" style="display: none;">${member.mno}</span>
							<span id="nick" style="display: none;">${member.nickName}</span>
							<span>${member.nickName}님</span>&nbsp;&nbsp;

	               </c:if>
	              <i class="fas fa-home" style="color: rgba(248, 143, 111, 0.6)"></i>
	              </a>
	            </li>
	        <li class="nav-item dropdown no-arrow mx-1" style="margin-top: 10px">
	          <a class="nav-link dropdown-toggle" onclick="alarmList(${member.mno});" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <i class="fas fa-bell fa-fw" style="color:rgba(248, 143, 111, 0.6)"></i>
	            <span class="badge badge-danger" id="alarmCount"></span>
	          </a>
	          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown" id="alarmList">
	          </div>
	        </li>
	        <li class="nav-item dropdown no-arrow mx-1" style="margin-top: 10px">
	        <!-- c:if 부분 조건식 수정해서 프로젝트 메인인지 상세인지로 구분, chat 표현방식 바꾸기 -->
	        <c:set var="pno" value="${param.pno}" />
	          <c:if test="${pno eq null}">
	          <a class="nav-link dropdown-toggle" href="#" onclick="openAlert()" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <i class="fas fa-comment fa-fw" style="color: rgba(248, 143, 111, 0.6)"></i>
	          </a>
	          </c:if>
	          <c:if test="${pno ne null}">
	          <a class="nav-link dropdown-toggle" href="#" onclick="openChat()" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <i class="fas fa-comment fa-fw" style="color: rgba(248, 143, 111, 0.6)"></i>
	            <span class="badge badge-danger" id="chatCount"></span>
	          </a>
	          </c:if>
	        </li>
	        <li class="nav-item dropdown no-arrow">
	          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <!-- <i class="fas fa-user-circle fa-fw" style="color: rgba(248, 143, 111, 0.6)"></i> -->
	            <div id="userImg" class="cropcircle" ><img src="${pageContext.request.contextPath }/resources/upload/profile/${member.renamedFileName}" alt="" id="userImg" class="cropcircle"/></div>
	            
	          </a>
	          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
	            <a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/mycalendar.do">My Page</a>
	            <a class="dropdown-item" href="#">Activity Log</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">Logout</a>
	          </div>
	        </li>
	      </ul>
	    </nav>
	</div>



	<!-- Bootstrap 4 JavaScript -->
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>



<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath }/resources/js/sb-admin.min.js"></script>
	<script>

		$('.goPjview').click(function(e) {
			e.preventDefault();
			var url = "${pageContext.request.contextPath}/project/projectMain.do?mno="+${member.mno};
			window.open(url, "_self");
		});


		function openChat() {
			var windowObj = null;
			var xPos = (document.body.clientWidth / 2) - 400;
			xPos += window.screenLeft;
			var yPos = (screen.availHeight / 2) - 300;
			
			var pno = '<c:out value="${param.pno}"/>';
			
			if(pno == null){
			alert("로그인이 필요한 기능입니다.");	
			}else{		
			windowObj = window.open(
					'${pageContext.request.contextPath}/chat.ch?pno='+pno, '채팅방',
					'width=800,height=600,top=' + yPos + ',left=' + xPos
					+ ',toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no');
			}
			
		}

		function openAlert() {
			alert("프로젝트에 참여한 후 확인 가능합니다.");
		}
		
		function deleteAlarmList(aNo,aPno){
			$.ajax({
				type: "GET",
				url:"${pageContext.request.contextPath}/alarm/delete.al",
				dataType:"json",
				type : "GET",
				data : {ano:aNo},
				async : false,
				success : function(response){
					if(response==2 || response==5){
						if(confirm("해당 프로젝트로 이동하시겠습니까?") == true){
							location.href="${pageContext.request.contextPath}/project/projectPage.do?pno="+aPno+"&mno=${member.mno}";
						}
					}
				},
				error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"error:"+error);
			    }
			});
		}
		
		function alarmList(mNo){
			$("#alarmList").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/alarm/alarmList.al",
				dataType:"json",
				type : "GET",
				data : {mno:mNo},
				async : false,
				success:function(response){
					var printHTML = "";
					if(response.length == 0){
						//존재하지 않음
						printHTML+="<a style='display: block;width: 100%;padding: 0.25rem 1.5rem;clear: both;font-weight: 400;color: #a0a0a0;";
						printHTML+="text-align: inherit;white-space: nowrap;border: 0'>알림 내역이 없습니다.</a>";
						$('#alarmList').append(printHTML);
						printHTML = "";
					}else{
						//존재함
						for(var i=0; i<response.length;i++){
							if(response[i].atype == 1){
								printHTML+="<a class='dropdown-item' onclick='deleteAlarmList("+response[i].ano+", "+response[i].apno+");'><span style='font-weight:bold'>[${member.nickName}]</span>님 회원 가입을 축하합니다.</a>";
							}else if(response[i].atype == 2){
								printHTML+="<a class='dropdown-item' onclick='deleteAlarmList("+response[i].ano+", "+response[i].apno+");'><span style='font-weight:bold'>["+response[i].ptitle+"]</span>에 초대되었습니다.</a>";
							}else if(response[i].atype == 3){
								printHTML+="<a class='dropdown-item' onclick='deleteAlarmList("+response[i].ano+", "+response[i].apno+");'><span style='font-weight:bold'>["+response[i].ptitle+"]</span>에서 <span style='font-weight:bold'>["+response[i].nickname+"]</span>님이 나갔습니다.</a>";
							}else if(response[i].atype == 4){
								printHTML+="<a class='dropdown-item' onclick='deleteAlarmList("+response[i].ano+", "+response[i].apno+");'><span style='font-weight:bold'>["+response[i].ptitle+"]</span>에서 추방당했습니다.</a>";
							}else if(response[i].atype == 5){
								printHTML+="<a class='dropdown-item' onclick='deleteAlarmList("+response[i].ano+", "+response[i].apno+");'><span style='font-weight:bold'>["+response[i].ttitle+"]</span>에서 담당자로 지명되었습니다.</a>";
							}else if(response[i].atype == 6){
								printHTML+="<a class='dropdown-item' onclick='deleteAlarmList("+response[i].ano+", "+response[i].apno+");'><span style='font-weight:bold'>["+response[i].smcontent+"]</span> 새로운 요청이 있습니다.</a>";
							}else if(response[i].atype == 7){
								printHTML+="<a class='dropdown-item' onclick='deleteAlarmList("+response[i].ano+", "+response[i].apno+");'><span style='font-weight:bold'>["+response[i].smcontent+"]</span>이 종료되었습니다.</a>";
							}
							$('#alarmList').append(printHTML);
							printHTML = "";					
						}						
					}
				},
				error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"error:"+error);
			    }
			});
		}
		
	    $(document).ready(function(){
			// 192.168.20.72 ---> 서버 실행시키는 ip, 접속 또한 localhost가 아닌 ip로 접속해야 함
			var wsUri = "ws://192.168.20.72/count";
			function send_message() {
		        websocket = new WebSocket(wsUri);
		        websocket.onopen = function(evt) {
		            onOpen(evt);
		            /* onChatCountOpen(evt); */
		        };
		        websocket.onmessage = function(evt) {
		            onMessage(evt);
		            /* onChatCountMessage(evt); */
		        };
		        websocket.onerror = function(evt) {
		            onError(evt);
		            /* onChatCountError(evt); */
		        };
		    }
			
			function onOpen(evt) {
				var pno = '<c:out value="${param.pno}"/>';
				if(pno == null || pno == ""){
					websocket.send($('#nick').text() + ":" + "0");
				}else{
					websocket.send($('#nick').text() + ":" + pno);
				}
		    }
		    function onMessage(evt) {
		    	var AlarmData=evt.data.split(":")[0];
		    	var ChatData=evt.data.split(":")[1];
		    	if(AlarmData!=0 && AlarmData < 10){
		    		$("#alarmCount").empty();
		    		$('#alarmCount').text(AlarmData);
		    	}else if(AlarmData > 9){
		    		$("#alarmCount").empty();
		    		$('#alarmCount').text("9+");
		    	}else{
		    		$("#alarmCount").empty();
		    	}
		    	if(ChatData!=0){
		    		$("#chatCount").empty();
		    		$('#chatCount').text("+");
		    	}else{
		    		$('#chatCount').empty();
		    	}
		    }
		    function onError(evt) {
		    }
		    
	    	send_message();
	    });

	</script>
</body>
</html>