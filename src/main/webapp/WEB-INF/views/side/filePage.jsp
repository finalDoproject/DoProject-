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

<!-- Select 2 -->
<link href="${pageContext.request.contextPath }/resources/css/select2.min.css" rel="stylesheet" />

<!-- jsCalendar -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/jsCalendar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/jsCalendar.clean.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<style>
	
.ok{
	float:right;
	width: 112px;
	height: 37px;
	border-radius:5px;
	background-clip: padding-box;
	background-color: #F88E6F;
	border:none;
	color: #fff;
	font-weight: bold;
	margin-left :auto;
	margin-right : auto;
}

.ok:hover{background-color: #fff; border:1px solid #F88E6F; color:#F88E6F; cursor:pointer;}
.ok:focus{outline: none;}

</style>
<script>
var chk = 0;
function taskToggle(){
	if(chk == 0){
		$('#taskForm').css('display', 'block');
		chk=1;
	}else{
		$('#taskForm').css('display', 'none');
		chk=0;
	}
}
</script>
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div id="wrapper" >
	<span id="mno" style="display: none;">${member.mno}</span>
	<span id="pno" style="display: none;">${project.pno}</span>
	<c:set value="${member.mno}" var="mno"/>
	<c:set value="${pno}" var="pno"/>
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
          <li class="nav-item">
        	<a class="nav-link" id ="request" href="#" data-toggle="modal" data-target="#exampleModalCenter">
        	<i class="far fa-clock" ></i>
        	<span id="req">스케줄 매칭 요청</span>
        	</a>
        </li>
        <hr>

        <li class="nav-item">
          <a class="nav-link" href="/dp/project/projectPage.do?pno=${pno}&mno=${mno}">
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
		<hr />
        <li class="nav-item">
          <a class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
    			<i class="fas fa-user-friends"></i>
    			<span>참여자 목록</span>
  			</a>
  			<div class="dropdown-menu">
  				<div>
				<a class="dropdown-item" href="#" data-toggle="modal" data-target="#invitationModal" style="text-align:center; font-weight:bolder; font-size: 14px; color:coral">프로젝트 초대하기</a>
				</div>
  				<c:forEach items="${memberList}" var="mList">
  				<c:if test="${project.pmno eq member.mno}">
  				<div>
  				<a class="dropdown-item" href="#" style="height:40px; vertical-align:middle;" onclick="kick('${mList.nickName}', '${project.pno}', '${mList.mno}');">
    				<img src='${pageContext.request.contextPath}/resources/images/profile/${mList.mProfile}' alt='profilpicture' style='float: left; width:30px; height:30px; border-radius: 50%;'>
    				&nbsp;<span style="vertical-align:middle;">${mList.nickName}</span></a>
				</div>
  				</c:if>
  				<c:if test="${project.pmno ne member.mno}">
  				<div>
  				<a class="dropdown-item" href="#" style="height:40px; vertical-align:middle;">
    				<img src='${pageContext.request.contextPath}/resources/images/profile/${mList.mProfile}' alt='profilpicture' style='float: left; width:30px; height:30px; border-radius: 50%;'>
    				&nbsp;<span style="vertical-align:middle;">${mList.nickName}</span></a>
				</div>
  				</c:if>
  				</c:forEach>
  				<c:if test="${project.pmno ne member.mno}">
  				<a class="dropdown-item" href="#" onclick="leaveProject('${project.pno}', '${member.mno}');"
				style="text-align:center; font-weight:bolder;">프로젝트 나가기</a>
				</c:if>
				<c:if test="${project.pmno eq member.mno}">
  				<a class="dropdown-item" onclick="deleteProject('${project.pno}', '${member.mno}')"
				style="text-align:center; font-weight:bolder;">프로젝트 지우기</a>
				</c:if>
			</div>
        </li>
        <div id="taskForm" class="taskForm" style="position:absolute; display: none; width:400px; height:650px; background-color : #F88E6F;">
        	<c:import url="../task/tasktest.jsp"/>
        </div>
      </ul>
      
      <!-- invitationModal -->
      <div class="modal fade" id="invitationModal" tabindex="-1" role="dialog" aria-labelledby="invitationModalLabel" aria-hidden="true" style="z-index: 999999" data-backdrop="static">
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
                   <label for="recipient-name" class="form-control-label">프로젝트 초대하기</label><br />
                   <input type="text" class="nickname" name="nickname" id="nickname" placeholder="닉네임 검색" style="width: 70% !important; display: inline-block; margin-bottom: 5px;">&nbsp;
                   <button type="button" id="findUserBtn" onclick="findUser();" class="btn btn-outline-warning">검색</button>
                 </div>
                 <div class="form-group" id="searchMemberList">
                 </div>
                 <div class="result" id="findUser-result"></div>                
             </div>                 
           </div>

          </form>
         </div>
       </div>
      
      <!-- 스케줄 매칭 Modal -->
      <div class="modal fade mod" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle" style="color : black; margin-left : 180px; font-weight: bolder;">
              스케줄 매칭</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form name="requestForm" action="matching.do?pno=${project.pno}&mno=${memberNo}"  method="post">
                    <table class="table">
                            <thead>
                              <tr>
                                <th scope="col" colspan="4">
                                <input type="text" name="title" placeholder="제목을 입력해주세요." 
                                style="width : 100%; border-radius : 1px;" >
                                </th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row"><i class="fas fa-user fa-2x"></i></th>
                                <td colspan="3">
                                	
                                    <select class="member-multiple" name="mNickname" multiple="multiple"
                                    style="width : 100%" data-placeholder="스케줄 매칭을 요청할 인원을 선택해주세요">
                             		
                                     <c:forEach items="${mArr}" var="m" varStatus="status">
                                        <c:if test = "${m.mno eq member.mno}">
                                        <option value="${m.mno}" disabled="disabled">${m.nickName} </option>
                                        </c:if>
                                        <c:if test = "${m.mno ne member.mno}">
                                        <option value="${m.mno}">${m.nickName} </option>
                                        </c:if>
                                     </c:forEach> 

                                     </select>
                                </td>
                              </tr>
                              <tr>
                                <th scope="row"><i class="far fa-calendar fa-2x"></i></th>
                                <td colspan="3">
                                        <input type="text" class="datepicker" name="startDate" id="startdate" placeholder="시작 날짜 선택"/>  
                                        <i class="fas fa-long-arrow-alt-right"></i>
                                        <input type="text" class="datepicker" name="endDate" id="enddate" placeholder="종료 날짜 선택" />
                                </td>
                              </tr>
                            </tbody>
                          </table>
                          <div class="modal-footer" >
                <button type="submit" class="ok">요청 완료</button>
            </div>
                 </form>         
            </div>
          </div>
        </div>
      </div>
      
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
            <div id="content-wrapper" >

        <div class="container-fluid" style="height: 2000px;">
			<section id="file-container" class="container">
				<p>총 ${totalContents }건의 게시물이 있습니다.</p>
				<table id="tbl-board" class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>파일명</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>첨부파일</th>
					</tr>
					<c:forEach items="${list}" var="f"> 
					<c:forEach begin="1" end="${fn:length(list)}">
					<tr id="${f.fno}">
						<td>${f.fno}</td>
						<td>${f.foldName}</td>
						<td>${f.twritedate}</td>
						<td>${f.twriter}</td>
						<td align="center">
						<a href="${pageContext.request.contextPath}/resources/upload/task/${f.fnewName}" download>
						<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px></a>
					</c:forEach>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
	</div>
	</div>
      
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
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
	<!-- select2를 위한 js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    
    <script type="text/javascript">
 		// select2 
    	$('.member-multiple').select2({
    	placeholder : "함께할 인원을 선택해주세요."
    	}); 
 
    	$('.select2-search__field').attr("style", "width : 370px");
    	
	 	$(function(){
	    	$("#findUserBtn").on("click",function(){
	    		var nickname = $('.nickname').val();
	    		
	    		console.log(nickname);
	    		$.ajax({
	                url  : "${pageContext.request.contextPath}/project/projectPage",
	                data: {nickname:nickname},
	                dataType: "json",
	                type : "get",
	                success : function(data){
	                    console.log(data);
	                    var html = "<table class=table>";
	                    html+="<tr><th>이름</th><th>ID</th></tr>";
		        		if(data==0) alert("해당하는 정보가 없습니다.");
		        		else{
		        			 for(var i in data){
		                     	html += "<tr><td>"+data[i].nickname+"</td>";
		                     	html += "<td>"+data[i].userId+"</td></tr>";
		                     }
		        			 html+="</table>";
		                     $("#findUser-result").html(html);
		        		}
		        	},
		            error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
		            }

	            });
	    	});
	    	
		});
	 	
        $(document).ready(function () {
            w3.includeHTML(init);
        });
    </script>
   
    <script>
    $('input[type="text"]').keydown(function() {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	    }
	});
    function inviteProject(mno, nickName, pno){
    	if(confirm("[" + nickName + "] 님을 초대하시겠습니까?") == true){
    		// 알림내용 추가, 알림 선택시 초대 수락(알림 테이블에 상태 변경 필요?)
    		if(mno != ${mno}){
    			location.href="${pageContext.request.contextPath}/project/inviteProject.do?pno="+pno+"&mno="+mno;
    		}else{
    			alert("본인은 초대할 수 없습니다.");
    		}
    	}else{
    		return false;
    	}
	}
	function kick(name, pno, mno){
		if(confirm("[" + name + "] 님을 추방하시겠습니까?") == true){
			if(mno == ${member.mno}){
				alert("본인은 추방할 수 없습니다.");
			}else{
				location.href="${pageContext.request.contextPath}/project/exile.do?pno="+pno+"&mno="+mno;
			}
		}else{
			return;
		}
	}
	function leaveProject(pno, mno){
		if(confirm("프로젝트에서 나가시겠습니까?") == true){
			location.href="${pageContext.request.contextPath}/project/exile.do?pno="+pno+"&mno="+mno;
		}else{
			return false;
		}
	}
	function deleteProject(pno, mno){
		if(confirm("프로젝트를 제거하시겠습니까?") == true){
			location.href="${pageContext.request.contextPath}/project/deleteProject.do?pno="+pno+"&mno="+mno;
		}else{
			return false;
		}
	}
	function findUser(){
		$("#searchMemberList").empty();
		$.ajax({
			url: "${pageContext.request.contextPath }/project/searchMember.do",
			dataType : "json",
			type : "GET",
			data : {userNick:$("#nickname").val()},
			success : function(response){
				var printHTML = "";
				if(response.length == 0){
					// 존재하지 않음
					printHTML+="<div>";
					printHTML+="<a class='dropdown-item' href='#' style='height:40px; vertical-align:middle;'>";
					printHTML+="&nbsp;<span style='vertical-align:middle;'>존재하지 않는 아이디 또는 닉네임 입니다.</span></a>";
					printHTML+="</div>";
					$('#searchMemberList').append(printHTML);
					printHTML = "";
				}else{
					// 존재함
					for(var i=0; i<response.length;i++){
						printHTML+="<div onclick='inviteProject("+response[i].mno+",&#39;"+response[i].nickName+"&#39;,${pno});'>";
						printHTML+="<a class='dropdown-item' href='#' style='height:40px; vertical-align:middle;'>";
						printHTML+="<img src='${pageContext.request.contextPath}/resources/images/profile/" + response[i].mProfile + "' alt='profilpicture' style='float: left; width:30px; height:30px; border-radius: 50%;'>";
						printHTML+="&nbsp;<span style='vertical-align:middle;'>"+response[i].nickName+"</span></a>";
						printHTML+="</div>";
						$('#searchMemberList').append(printHTML);
						printHTML = "";
					}
				}
			},
		    error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"error:"+error);
		    }
		});
	}
	</script>
	
	
    
	
</body>

</html>