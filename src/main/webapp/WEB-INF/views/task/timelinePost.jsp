<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
        crossorigin="anonymous">
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<br /><br /><br />
<div >

    <div class="container-fluid gedf-wrapper" style="width: 60%;">
        <div >
            <div class=" gedf-main">
			<c:forEach items="${tasklist}" var="task" varStatus="tnum">
			<input type="hidden" name="tno" id="tno${tnum.count }" value="${task.TNO }"/>
                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header" style="background-color : #F88E6F;">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div >
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div >
                                    <div class="h5 m-0">&nbsp; ${task.TWRITER }</div>
                                    <div class="h7 text-muted"></div>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        	더보기<i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" data-toggle="modal" data-target="#taskUpdate" id="updatebtn${tnum.count }" name="${tnum.count }">수정하기</a>
                                        <a class="dropdown-item" href="#">삭제</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>
					
                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>${task.TWRITEDATE }</div>
                        
                            <h3 class="card-title">${task.TTITLE }</h3>
                            <hr />
                         <c:if test="${task.TLEVEL != null}">
                         <input type="hidden" value="${task.TLEVEL}" id="levelchk${tnum.count }"/>
                         <input type="hidden" value="${tnum.count }" id="levelnum${tnum.count }"/>
	                        <div class="line" >
								<label class="icon1"><span class="blind"></span></label>
								<div class="workTab" name="tLevelSelect" >
									<input type="hidden" name="tlevel" id="tlevel" value="0"/>
									<button type="button" style="text-decoration: none;" name="level" id="level${tnum.count }1" class="tLevelSelect1 tab1" value="1">요청</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tnum.count }2" class="tLevelSelect1 tab2" value="2">진행</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tnum.count }3" class="tLevelSelect1 tab5" value="3">피드백</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tnum.count }4" class="tLevelSelect1 tab3" value="4">완료</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tnum.count }5" class="tLevelSelect1 tab4" value="5">보류</button>
								</div>
							</div>
							<script>
							$(function(){
								var num = '<c:out value="${tnum.count}"/>'
								var level = $('#levelchk'+num).val();
								var levelnum = $('#levelnum' + num).val();
								console.log(num);
								console.log(level);
								console.log(levelnum);
								
								$(".tLevelSelect1").each(function(){
									$(this).prop('disabled', true);
								});
								
								$("#level"+levelnum+level).addClass("selected");
								console.log(levelnum+"앞에는 num 뒤에는 레벨"+level);
							})
							</script>
						</c:if>
							<hr />
							<!-- 3. 시작일 지정 -->
							<c:if test="${task.TSTARTDATE != null}">
							<div class="line" style="display: inline-block;">
								<label class="icon3"><span class="blind" >시작일</span></label>&nbsp; &nbsp;  
								<div >
									<fmt:formatDate value="${task.TSTARTDATE}" pattern="yyyy.MM.dd" />
								</div>
							</div>
							</c:if>
							<!-- 4. 마감일 지정 -->
							&nbsp;~&nbsp; 
							<div class="line"  style="display: inline-block;">
								<label class="icon4" ><span class="blind" >마감일</span></label>
								<div  >
									<fmt:formatDate value="${task.TENDDATE}" pattern="yyyy.MM.dd" />
									
								</div>
							</div>
						<hr />
                        <p class="card-text" style="height: auto;" >
                            ${task.TCONTENT}
                        </p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                    </div>
                    <div id="commentdiv">
                           <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="" >
                           <textarea style="width: 75%; background-color: transparent; margin-top : 10px; margin-bottom:10px; resize:none;" maxlength="4000" placeholder="댓글을 입력하세요" ></textarea>
                           <a href=""	style="float: right; border-radius: 5px; background-color: #F88E6F; margin-right:20px;" class="button primary small">등록</a>         
                    </div>
                   
                </div>
                <!-- Post /////-->

				<br /><br /><br />
				<br/>
				</c:forEach>
               
            </div>
        </div>
    </div>
</div>

 <div class="modal fade mod" id="taskUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle" style="color : black; margin-left : 180px; font-weight: bolder;">
              		업무 수정</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
           <!--  --> <form name="requestForm" action="matching.do?pno=${project.pno}&mno=${memberNo}"  method="post">

                                <div class="card gedf-card">
                    <div class="card-header" style="background-color : #F88E6F;">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div >
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                    &nbsp;&nbsp;
                                </div>
                                <div >
                                    <div class="h5 m-0" id="uptwriter">&nbsp;</div>
                                    <div class="h7 text-muted"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2" id="upwritedate"><i class="fa fa-clock-o"></i></div>
                        
                            <h3 class="card-title" id="upttitle"></h3>
                            <hr />
                         
                         <input type="hidden" value="${task.tlevel}" id="levelchk${tnum.count }"/>
                         <input type="hidden" value="${tnum.count }" id="levelnum${tnum.count }"/>
	                        <div class="line" >
								<label class="icon1"><span class="blind"></span></label>
								<div class="workTab" name="tLevelSelect">
									<input type="hidden" name="tlevel" id="tlevel" value="0"/>
									<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab1" value="1">요청</button>
									<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab2" value="2">진행</button>
									<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab5" value="3">피드백</button>
									<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab3" value="4">완료</button>
									<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab4" value="5">보류</button>
								</div>
							</div>
							
							<script>
								$(".tLevelSelect").each(function(){
									$(this).click(function(){
										$('#tlevel').val($(this).val());
									});
								});
								
								$(function(){
									var num = '<c:out value="${tnum.count}"/>'
									var level = $('#levelchk'+num).val();
									var levelnum = $('#levelnum' + num).val();
									
									$("#level"+levelnum+level).addClass("selected");
								})
							</script>
						
							<hr />
							<!-- 3. 시작일 지정 -->
							<div class="line" id="START_DT_LINE" style="display: inline-block;">
								<label class="icon3"><span class="blind" >시작일</span></label>&nbsp; &nbsp;  
								<div class="workdate" >
									<input class="START_DT"  name="tstartdate" value="${task.tstartdate}" ><button id="START_DT_DEL" style="margin-left: -8px;display:none;" class="workdateDel"><span class="blind">삭제</span></button>
									<span id="START_DT_CNTN" class="c_red" style="display:none;">시작일이 마감일보다 이후 날짜로 되어 있습니다.</span>
								</div>
							</div>
							<!-- 4. 마감일 지정 -->
							&nbsp;~&nbsp; 
							<div class="line" id="END_DT_LINE" style="display: inline-block;">
								<label class="icon4" ><span class="blind" >마감일</span></label>
								<div class="workdate" >
									<input class="END_DT"  name="tenddate"  value="${task.tenddate}" id="dp1545179837850"><button id="END_DT_DEL" style="margin-left: -8px; display:none;" class="workdateDel"><span class="blind">삭제</span></button>
									<span id="END_DT_CNTN" class="c_red" style="display:none;">마감일이 시작일 이전 날짜로 되어 있습니다.</span><span id="END_DT_OVERDUE" class="c_red" style="display:none;">마감기한이 지났습니다.</span>
								</div>
							</div>
						<hr />
                        <textarea class="card-text" style="height: auto; width:300px;" id="upcontent">
                            
                        </textarea>
                    </div>

                <button type="submit" class="ok">수정 완료</button>
                <br /><br />
            </div>
                 </form>         
            </div>
          </div>
        </div>
      </div>
<!--  수정 modal -->

<script>

$('a[id^=updatebtn]').click(function(){
		var num = $(this).prop("name");
		var tno = $('#tno'+num).val();
		console.log("num : " + num);
		$.ajax({
		    url  :'${pageContext.request.contextPath}/task/taskUpdate.do',
		    type : "get",
		    dataType: "json",
		    contentType: 'application/json; charset=utf-8',
		    data : {tno : tno},
		    success : function(data) {
		 	   console.log(data);
		 	   console.log("num ajax"+ num);
		 	   for(var i in data){
		 		  $('#uptwriter').text(data[i].twriter);
		 		  $('#upttitle').text(data[i].ttitle);
		 		  $('#upcontent').text(data[i].tcontent);
               }
		 	   
		    },
		    error : function(jqxhr, textStatus, errorThrown){
		        console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
		    }
		}); 

})

</script>
</body>
</html>