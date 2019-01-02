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

.modal-title{
	margin-left : 180px;
	color : black;
		}		
.schedule {
	margin-left : auto;
	margin-right : auto;
	width : 100%;
	height : 75%;
	border : 5px solid black;
		}
.store {
	margin-left : auto;
	margin-right : auto;
		}

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

        <hr>

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
  				<a class="dropdown-item" onclick="alert('팀장은 나갈수 없습니다.')"
				style="text-align:center; font-weight:bolder;">프로젝트 나가기</a>
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
                   <input type="text" class="nickname" name="nickname" placeholder="이름 검색" style="width: 70% !important; display: inline-block; margin-bottom: 5px;">&nbsp;
                   <button type="button" id="findUserBtn" class="btn btn-outline-warning">검색</button>
                 </div>
                 <div class="result" id="findUser-result"></div>                
             </div>
             <div class="modal-footer">
               <button type="button" class="btn btn-light btn-sm" data-dismiss="modal">취소</button>
               <button type="button" class="btn btn-sm btn-send" style="background-color: coral; color: white">초대하기</button>
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
                                        <option value="${m.mno}">${m.nickName} </option>
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
      

     
      <!-- right nav --> 
      <div id="rightNav">
      <c:forEach items="${memoList}" var="memo" varStatus="vs">
         <div class="memoBox">
         <c:if test="${memo.mmcontent eq null}">
	     	<textarea class="memopad" id="" cols="22" rows="9" placeholder="메모를 작성하세요!"></textarea>
	     </c:if>
	     <c:if test="${memo.mmcontent ne null}">
	     	<textarea class="memopad" id="" cols="22" rows="9" >${memo.mmcontent}</textarea>
	     </c:if>
	     </div>
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
          <h6>스케줄매칭 </h6>
          <ul style="list-style-type: disc;">
            <c:forEach items="${sArr}" var="s" varStatus="status">
              <li>
                
                <c:if test="${s.SSNO eq 0}">
                <a href="#" style="color: #555;">${s.SMCONTENT} <button class="request">요청 준비</button> </a>
                </c:if>
                <c:if test="${s.SSNO eq 1}">
                <a style="color: #555;">${s.SMCONTENT}
                <input type="hidden" value="${s.SMNO}" id="smno"/>
                <button class="ongoing" data-toggle="modal" data-target="#ongoingModalCenter" onclick="dd();">진행중</button> </a>
                </c:if>
                <c:if test="${s.SSNO eq 2}">
                <a href="#" style="color: #555;">${s.SMCONTENT} <button class="complete">완료</button> </a>
                </c:if>
               
              </li>
            </c:forEach>
            </ul>
        </div>
        <hr>

        <!--스케줄 매칭 요청에 대한 Modal -->
  <div class="modal fade mod" id="ongoingModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">스케줄 매칭</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <table class="table table-bordered schedule">
                <thead>
                    <tr >
                        <th></th>
                        <th>일</th>
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                        <th>토</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>9</th>
                        <th id="1" class="select"></th>
                        <th id="16" class="select"></th>
                        <th id="31" class="select"></th>
                        <th id="46" class="select"></th>
                        <th id="61" class="select"></th>
                        <th id="76" class="select"></th>
                        <th id="91" class="select"></th>
                    </tr>
                    <tr>
                         <th>10</th>
                         <th id="2" class="select"></th>
                         <th id="17" class="select"></th>
                         <th id="32" class="select"></th>
                         <th id="47" class="select"></th>
                         <th id="62" class="select"></th>
                         <th id="77" class="select"></th>
                         <th id="92" class="select"></th>
                    </tr>
                    <tr>
                          <th>11</th>
                          <th id="3" class="select"></th>
                          <th id="18" class="select"></th>
                          <th id="33" class="select"></th>
                          <th id="48" class="select"></th>
                          <th id="63" class="select"></th>
                          <th id="78" class="select"></th>
                          <th id="93" class="select"></th>
                    </tr>
                        <tr>
                        <th>12</th>
                        <th id="4" class="select"></th>
                        <th id="19" class="select"></th>
                        <th id="34" class="select"></th>
                        <th id="49" class="select"></th>
                        <th id="64" class="select"></th>
                        <th id="79" class="select"></th>
                        <th id="94" class="select"></th>
                    </tr>
                    <tr>
                            <th>13</th>
                            <th id="5" class="select"></th>
                            <th id="20" class="select"></th>
                            <th id="35" class="select"></th>
                            <th id="50" class="select"></th>
                            <th id="65" class="select"></th>
                            <th id="80" class="select"></th>
                            <th id="95" class="select"></th>
                    </tr>
                    <tr>
                            <th>14</th>
                            <th id="6" class="select"></th>
                            <th id="21" class="select"></th>
                            <th id="36" class="select"></th>
                            <th id="51" class="select"></th>
                            <th id="66" class="select"></th>
                            <th id="81" class="select"></th>
                            <th id="96" class="select"></th>
                    </tr>
                    <tr>
                            <th>15</th>
                            <th id="7" class="select"></th>
                            <th id="22" class="select"></th>
                            <th id="37" class="select"></th>
                            <th id="52" class="select"></th>
                            <th id="67" class="select"></th>
                            <th id="82" class="select"></th>
                            <th id="97" class="select"></th>
                    </tr>
                    <tr>
                            <th>16</th>
                            <th id="8" class="select"></th>
                            <th id="23" class="select"></th>
                            <th id="38" class="select"></th>
                            <th id="53" class="select"></th>
                            <th id="68" class="select"></th>
                            <th id="83" class="select"></th>
                            <th id="98" class="select"></th>
                    </tr>
                    <tr>
                            <th>17</th>
                            <th id="9" class="select"></th>
                            <th id="24" class="select"></th>
                            <th id="39" class="select"></th>
                            <th id="54" class="select"></th>
                            <th id="69" class="select"></th>
                            <th id="84" class="select"></th>
                            <th id="99" class="select"></th>
                    </tr>
                    <tr>
                            <th>18</th>
                            <th id="10" class="select"></th>
                            <th id="25" class="select"></th>
                            <th id="40" class="select"></th>
                            <th id="55" class="select"></th>
                            <th id="70" class="select"></th>
                            <th id="85" class="select"></th>
                            <th id="100" class="select"></th>
                    </tr>
                    <tr>
                            <th>19</th>
                            <th id="11" class="select"></th>
                            <th id="26" class="select"></th>
                            <th id="41" class="select"></th>
                            <th id="56" class="select"></th>
                            <th id="71" class="select"></th>
                            <th id="86" class="select"></th>
                            <th id="101" class="select"></th>
                    </tr>
                    <tr>
                            <th>20</th>
                            <th id="12" class="select"></th>
                            <th id="27" class="select"></th>
                            <th id="42" class="select"></th>
                            <th id="57" class="select"></th>
                            <th id="72" class="select"></th>
                            <th id="87" class="select"></th>
                            <th id="102" class="select"></th>
                    </tr>
                    <tr>
                            <th>21</th>
                            <th id="13" class="select"></th>
                            <th id="28" class="select"></th>
                            <th id="43" class="select"></th>
                            <th id="58" class="select"></th>
                            <th id="73" class="select"></th>
                            <th id="88" class="select"></th>
                            <th id="103" class="select"></th>
                    </tr>
                    <tr>
                            <th>22</th>
                            <th id="14" class="select"></th>
                            <th id="29" class="select"></th>
                            <th id="44" class="select"></th>
                            <th id="59" class="select"></th>
                            <th id="74" class="select"></th>
                            <th id="89" class="select"></th>
                            <th id="104" class="select"></th>
                    </tr>
                    <tr>
                            <th>23</th>
                            <th id="15" class="select"></th>
                            <th id="30" class="select"></th>
                            <th id="45" class="select"></th>
                            <th id="60" class="select"></th>
                            <th id="75" class="select"></th>
                            <th id="90" class="select"></th>
                            <th id="105" class="select"></th>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary store">저장</button>
        </div>
      </div>
    </div>
  </div>
        
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
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <!-- datepicker를 위한 js -->
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	
	<!-- select2를 위한 js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/js/BootSideMenu.js"></script>
    
    <script type="text/javascript">
    
	 	// select2 
	    $('.member-multiple').select2({
	    	placeholder : "함께할 인원을 선택해주세요."
	    }); 
	 	<!-- select 클릭 시 효과  + 아이디 값 가져오기 -->
	    function dd(){
		    	//alert("dd");
		    	
		    	$(".select").click(function(){
		    		console.log("clicked it!");
		    	});
		    	
		    	/* var dtNo = $(this).attr("id");
		    	var smNo = $('#smno').attr("id"); */
		    	
		    	
		    	 /* $.ajax({
		         	url : '${pageContext.request.contextPath}/project/matchingDT.do',
		         	data : {dtNo : dtNo},
		         	dataType : "json",
		         	success : function(data) {
		         		console.log(data);
		         		if(data > 0 ){
		         			$('#'+dtNo).css("background-color", "rgb(248, 142, 111)");
		         		}
		         
		         		
		         	 },error : function(request, status, error){
		      			alert(request + "\n"
		      					  + status + "\n"
		      					  + error);
		         	}
		         }); */
		};
	    
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
       	var getParameters = function (paramName) { // 리턴값을 위한 변수 선언 
   			var returnValue; // 현재 URL 가져오기 
   			var url = location.href; // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔 
   			var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
   			// 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return 
   			for (var i = 0; i < parameters.length; i++) { 
   				var varName = parameters[i].split('=')[0]; 
   					if (varName.toUpperCase() == paramName.toUpperCase()) { 
   						returnValue = parameters[i].split('=')[1]; 
   						return decodeURIComponent(returnValue);
   					} 
   				} 
   			};
        	
          var memopad = $('.memopad');
          var pno = getParameters('pno');
          var mno = getParameters('mno');
          console.log(pno+":"+mno);
          
          memopad.focus(function(){
        	  $(memopad).html()
         
         
          });
          memopad.blur(function(){
           var saveMemo = $(memopad).val();

            console.log(saveMemo);
  
        	  $.ajax({
  				url: "${pageContext.request.contextPath}/project/projectPage.do",
  				dataType: "json",
  				/* contentType: 'application/json; charset=utf-8', */
  				type:"post",
  				data:{saveMemo:saveMemo,
  						pno:pno, mno:mno},
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
    $(function(){
   	 
 	   // 한국어 설정
 	   $.datepicker.setDefaults($.datepicker.regional['ko']);
 	   
 	   // 시작일
 	   $('#startdate').datepicker({
 		  // 데이터 형식 지정
 		  dateFormat : "yy-mm-dd",
 		  // 달 / 주 이름 지정
 		  monthNamesShort : ["1월",,"2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
 		  dayNamesMin : ["일","월","화","수","목","금","토"],
 		  // 오늘 날짜 이후로 선택 가능
 		  minDate : 1,
 		  onClose : function(selectDate) {
 			  // 시작일 datepicker가 닫힐 때
 			  // 종료일의 선택할 수 있는 최소날짜를 선택일로 지정
 			  
 			  $("#enddate").datepicker("option", "minDate", selectDate);
 			  
 			  // 선택 후 7일간 선택 가능하도록 날짜 제한 두기
 			  var date = $(this).datepicker('getDate');
 			  
 			  date.setDate(date.getDate()+7);
 			  $("#enddate").datepicker("option", "maxDate", date);
 		  }
 		   
 	   });
 	   
 	   // 종료일
 	   $('#enddate').datepicker({
 		  dateFormat : "yy-mm-dd",
  		  monthNamesShort : ["1월",,"2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
  		  dayNamesMin : ["일","월","화","수","목","금","토"],
  		  minDate : 0,
  		  
  		  // 시작 날짜에도 엉뚱한 날짜 선택할 수 없도록 제한두기.
  		  onClose : function(selectDate){
  			 
  			  $('#startdate').datepicker("option", "maxDate", selectDate);
  		  }
 	   });
    });
	
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
	</script>
	
	
    
	
</body>

</html>