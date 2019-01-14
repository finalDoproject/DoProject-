<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div >
    <div class="container-fluid gedf-wrapper" style="width: 60%;" id="taskUpdate">
        <div >
            <div class=" gedf-main">
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
								<div class="workTab" name="tLevelSelect">
									<input type="hidden" name="tlevel" id="tlevel" value="0"/>
									<button type="button" style="text-decoration: none;" name="level" id="level${tnum.count }1" class="tLevelSelect tab1" value="1">요청</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tnum.count }2" class="tLevelSelect tab2" value="2">진행</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tnum.count }3" class="tLevelSelect tab5" value="3">피드백</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tnum.count }4" class="tLevelSelect tab3" value="4">완료</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tnum.count }5" class="tLevelSelect tab4" value="5">보류</button>
								</div>
							</div>
							<script>
							$(function(){
								var num = '<c:out value="${tnum.count}"/>'
								var level = $('#levelchk'+num).val();
								var levelnum = $('#levelnum' + num).val();
								$("#level"+levelnum+level).addClass("selected");
								console.log(levelnum+"앞에는 num 뒤에는 레벨"+level);
							})
							</script>
						</c:if>
							<hr />
							<!-- 3. 시작일 지정 -->
							<div class="line" id="START_DT_LINE" style="display: inline-block;">
								<label class="icon3"><span class="blind" >시작일</span></label>&nbsp; &nbsp;  
								<div class="workdate" >
									<input class="START_DT"  name="tstartdate" value="${task.TSTARTDATE}" ><button id="START_DT_DEL" style="margin-left: -8px;display:none;" class="workdateDel"><span class="blind">삭제</span></button>
									<span id="START_DT_CNTN" class="c_red" style="display:none;">시작일이 마감일보다 이후 날짜로 되어 있습니다.</span>
								</div>
							</div>
							<!-- 4. 마감일 지정 -->
							&nbsp;~&nbsp; 
							<div class="line" id="END_DT_LINE" style="display: inline-block;">
								<label class="icon4" ><span class="blind" >마감일</span></label>
								<div class="workdate" >
									<input class="END_DT"  name="tenddate"  value="${task.TENDDATE}" id="dp1545179837850"><button id="END_DT_DEL" style="margin-left: -8px; display:none;" class="workdateDel"><span class="blind">삭제</span></button>
									<span id="END_DT_CNTN" class="c_red" style="display:none;">마감일이 시작일 이전 날짜로 되어 있습니다.</span><span id="END_DT_OVERDUE" class="c_red" style="display:none;">마감기한이 지났습니다.</span>
								</div>
							</div>
						<hr />
                        <p class="card-text" style="height: auto;">
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
				
               
            </div>
        </div>
    </div>
</div>
</body>
</html>