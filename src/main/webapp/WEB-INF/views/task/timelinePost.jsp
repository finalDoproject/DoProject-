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
<c:forEach items="${tasklist}" var="task" varStatus="tnum">
	<c:set var="tcount" value="${tnum.count}" />
    <div class="container-fluid gedf-wrapper" style="width: 60%;" id="${task.tno }">
        <div >
            <div class=" gedf-main">
            <input type="hidden" name="tno" id="tno${tnum.count }" value="${task.tno }"/>
			<input type="hidden" name="ctno" id="ctno${tcount}" value="${task.tno }" />
			<input type="hidden" name="pno" id="pno" value="${project.pno}" />
            <input type="hidden" name="mno" id="mno" value="${member.mno}" />
                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header" style="background-color : #F88E6F;">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div >
                                	<c:forEach items="${m}" var="m">
                                		<c:if test="${m.nickName eq task.twriter}">
                                			<img class="rounded-circle" width="45" src="${pageContext.request.contextPath }/resources/upload/profile/${m.renamedFileName}" alt="">
                                		</c:if>
                                	</c:forEach>
                                </div>
                                <div >
                                    <div class="h5 m-0">&nbsp; ${task.twriter }</div>
                                    <div class="h7 text-muted"></div>
                                </div>
                            </div>
                            <div>
                            <c:if test="${member.userId eq task.twriter}">
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        	더보기<i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <a class="dropdown-item" data-toggle="modal" data-target="#taskUpdate" id="updatebtn${tnum.count }" name="${tnum.count }">수정하기</a>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/task/taskdelete.do?tno=${task.tno}&mno=${member.mno}&pno=${project.pno}" id="deltask">삭제</a>
                                        <%-- <a class="dropdown-item" href="${pageContext.request.contextPath}/task/deleteAttach.do?tno=${task.tno}&mno=${member.mno}">담아두기</a> --%>
                                    </div>
                                </div>
                               </c:if> 
                            </div>
                        </div>
					
                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>${task.twritedate }</div>
                        
                            <h3 class="card-title">${task.ttitle }</h3>
                            <hr />
                        <div class="form-group">
							<h4><label class="col-md-4 control-label" for="담당자 추가" style="margin-top :7px;">담당자 :
								<c:forEach items="${m}" var="m" varStatus="tnum">
									<c:if test="${m.mno == task.tmno }">
										${m.nickName }
									</c:if> 
								</c:forEach>
								</label> 
								</h4>
						</div>
						<hr />
                         <c:if test="${task.tlevel != null}">
                         <p id="levelp"></p>
                         <input type="hidden" value="${task.tlevel}" id="levelchk${tcount }"/>
                         <input type="hidden" value="${tcount}" id="levelnum${tcount }"/>
	                        <div class="line" >
								<label class="icon1"><span class="blind"></span></label>
								<div class="workTab" name="tLevelSelect" >
									<input type="hidden" name="tlevel" id="tlevel" value="0"/>
									
									<button type="button" style="text-decoration: none;" name="level" id="level${tcount }1" class="tLevelSelect1 tab1" value="1">요청</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tcount }2" class="tLevelSelect1 tab2" value="2">진행</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tcount }3" class="tLevelSelect1 tab5" value="3">피드백</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tcount }4" class="tLevelSelect1 tab3" value="4">완료</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tcount }5" class="tLevelSelect1 tab4" value="5">보류</button>
									<button type="button" style="text-decoration: none;" name="level" id="level${tcount }6" class="tLevelSelect1 tab6" value="6">일정</button>
								</div>
							</div>
							<script>
							$(function(){
								var num = ${tcount};
								var level = $('#levelchk'+num).val();
								var levelnum = $('#levelnum' + num).val();
								/* console.log("num"+num);
								console.log(level);
								console.log(levelnum); */
								
								$(".tLevelSelect1").each(function(){
									$(this).prop('disabled', true);
								});
								
								$("#level"+levelnum+level).addClass("selected");
								/* console.log(levelnum+"앞에는 num 뒤에는 레벨"+level); */
							})
							</script>
						</c:if>
							<hr />
							<!-- 3. 시작일 지정 -->
							<c:if test="${task.tstartdate != null}">
							<div class="line" style="display: inline-block;">
								<label class="icon3"><span class="blind" >시작일</span></label>&nbsp; &nbsp;  
								<div >
									<input name="startdate" value="${fn:substring(task.tstartdate,0,11)}" readonly>
								</div>
							</div>
							</c:if>
							<!-- 4. 마감일 지정 -->
							&nbsp;~&nbsp; 
							<div class="line"  style="display: inline-block;">
								<label class="icon4" ><span class="blind" >마감일</span></label>
								<div  >
									<input name="enddate" value="${fn:substring(task.tenddate,0,11)}" readonly>
								</div>
							</div>
						<hr />
									<!-- 5. 진척도 지정 -->
			<br />
						<div class="line" id="PROGRESS_LINE" >
							<label class="icon5" style="font-size: 16px; margin-bottom:10px;">진척도 : </label>
							<a class="workPrgrs" style="display: inline-block;">
								<div class="workPrgrs_bg"><!-- 20170407 수정 -->
									<strong id="PROGRESS_PER" class="txt"></strong>
									<span id="PROGRESS" class="bar" ></span><!-- progress bar 100%일때 추가 class="color100p" -->
									<!-- toltip -->
									<div class="pcnt0" style="width:5%;display:block"><span class="pcnt"><button>0%</button></span></div>
									<div class="pcnt20" style="left:5%;"><span class="pcnt"><button>20%</button></span></div><!-- bar style="right:80%;" -->
									<div class="pcnt40"><span class="pcnt"><button>40%</button></span></div><!-- bar style="right:60%;" -->
									<div class="pcnt60"><span class="pcnt"><button>60%</button></span></div><!-- bar style="right:40%;" -->
									<div class="pcnt80"><span class="pcnt"><button>80%</button></span></div><!-- bar style="right:20%;" -->
									<div class="pcnt100"><span class="pcnt"><button>100%</button></span></div><!-- bar style="right:0;" -->
								</div><!-- 20170407 수정 -->
							</a>
						</div>
						<!-- 6. 우선순위 지정 -->
						<input type="hidden" id="nowp${tcount }" value="${task.ttpriority }" />
						<div class="form-group" >
							우선순위 : 
								<div class="col-md-4"  style="display: inline-block;">
									<select id="ttpriority" name="ttpriority" class="form-control" >
										<option value="1" class="ttp1${tcount }">낮음</option>
										<option value="2" style="color:green;" class="ttp2${tcount }">보통</option>
										<option value="3"style="color:orange;" class="ttp3${tcount }" >높음</option>
										<option value="4" style="color:red;" class="ttp4${tcount }">긴급</option>
									</select>

								</div>
						</div>
					</div>
					 <script>
						$(function(){
								var num = "${tcount}";
								var tpr = $('#nowp'+ num).val();
								
								if($('.ttp1'+num).val() == tpr){
									$('.ttp1'+num).attr("selected", true);
									
									$('.ttp1'+num).parent().prop('disabled', true);
								}
								if($('.ttp2'+num).val() == tpr){
									$('.ttp2'+num).attr("selected", true);
									$('.ttp2'+num).parent().prop('disabled', true);
								}
								if($('.ttp3'+num).val() == tpr){
									$('.ttp3'+num).attr("selected", true);
									$('.ttp3'+num).parent().prop('disabled', true);
								}
								if($('.ttp4'+num).val() == tpr){
									$('.ttp4'+num).attr("selected", true);
									$('.ttp4'+num).parent().prop('disabled', true);
								}
							})
										
						</script> 
					<div>
                        <p class="card-text" style="height: auto; margin:0 auto; border : 1px solid lightgray; " >
                            ${task.tcontent}
                            <br /><br /><br /><br />
                        </p>
                    </div>
                    <br /><br />
                    </div>
                    
                    
                    <c:forEach  items="${task.taskFiles}" var="attach" varStatus="tnum">
						<button type="button" 
								class="btn btn-outline-danger btn-block" style="border-color : #F88E6F;" onclick="location.href='${pageContext.request.contextPath}/resources/upload/task/${attach.fnewname}'">
								첨부파일 - ${attach.foldname }
						</button>
						
					</c:forEach>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                    </div>
                    <c:if test="${task.taskComment != null}">
                    <c:forEach items="${task.taskComment}" var="c" varStatus="cnum">
	                    <div id="commentdiv${cnum.count }" style="border : 1px solid lightgray;" >
								<c:forEach items="${m}" var="m" varStatus="tnum">
									<c:if test="${m.mno == c.cwriter }">&nbsp;&nbsp;&nbsp;&nbsp;
									<img class="rounded-circle" width="45" id="commentImg${cnum.count }" style=" float:left; margin-left:20px; margin-top:10px;" src="${pageContext.request.contextPath }/resources/upload/profile/${m.renamedFileName}" alt="" />
										<h3 style="float:left; margin-left:20px; margin-top:10px;">${m.nickName } </h3> ${c.cwritedate} <br>
									</c:if> 
								</c:forEach>
	                            <textarea style="width: 60%; background-color: transparent; margin-top : 10px; margin-bottom:10px; resize:none;" maxlength="4000" readonly>${c.ccontent}</textarea>
	                           
                           <c:if test="${member.mno == c.cwriter }">
                           <button style="float: right; width:50px; height:50px; border-radius: 5px; background-color: #F88E6F; margin-right:20px; margin-top:10px;" class="primary small" onclick="location.href='${pageContext.request.contextPath }/comment/deletecomment.do?cno=${c.cno}&pno=${project.pno}&mno=${member.mno}'">삭제</button>         
	                    	</c:if>
	                    </div>
                    </c:forEach>
                    </c:if>
                    <input type="hidden" name="cwriter" value="${member.mno}" />
                    <div id="locdiv${tcount}" style="display:hidden"></div>
<%--                      <div id="commentdivi${tcount }" style="border : 1px solid lightgray; display:hidden;" >
                     	<img class="rounded-circle" width="45" id="commentImgi${tcount }" style=" float:left; margin-left:20px; margin-top:10px; display:inline-block;"  src="" alt="" />
                    </div> --%>

                    <div id="commentdiv" style="border : 1px solid lightgray;">
                       <c:forEach items="${m}" var="m">
                             <c:if test="${m.mno eq member.mno}">
                                <img class="rounded-circle" width="45" style=" float:left; margin-left:20px; margin-top:10px;" src="${pageContext.request.contextPath }/resources/upload/profile/${m.renamedFileName}" alt="">
                             </c:if>
                       </c:forEach>
                           <textarea style="width: 60%; background-color: transparent; margin-top : 10px; margin-bottom:10px; resize:none;" maxlength="4000" name="ccontent${tcount }" id="ccontent${tcount }"></textarea>
                           <button style="float: right; border-radius: 5px; background-color: #F88E6F; margin-right:20px;" class="button primary small hi" id="incomment${tcount }" value="${tcount }">등록</button>      
                    </div>
                </div>
                <!-- Post /////-->

				<br /><br /><br />
				<br/>
				
               
            </div>
        </div>
        </c:forEach>
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
           <!--  --> <form name="requestForm" action="${pageContext.request.contextPath}/task/taskUpdate.do?mno=${member.mno}&pno=${project.pno}" method="post"  enctype="multipart/form-data">
					<h1 id="tnoh1"></h1>
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
                        
                            <h3 class="card-title"><input id="upttitle" name="ttitle" type="text" class="form-control" style="margin:0 auto; width:360px; border : 3px solid lightgray; background : white;"
								required /></h3>
                            <hr />
                         

	                        <div class="line" >
								<label class="icon1"><span class="blind"></span></label>
								<div class="workTab" name="tLevelSelect">
									<input type="hidden" name="tlevel" id="tlevel" class="tlevelup" value="0"/>
									<button type="button" style="text-decoration: none;" id="level1" class="tLevelSelect2 tab1" value="1">요청</button>
									<button type="button" style="text-decoration: none;" id="level2" class="tLevelSelect2 tab2" value="2">진행</button>
									<button type="button" style="text-decoration: none;" id="level3" class="tLevelSelect2 tab5" value="3">피드백</button>
									<button type="button" style="text-decoration: none;" id="level4" class="tLevelSelect2 tab3" value="4">완료</button>
									<button type="button" style="text-decoration: none;" id="level5" class="tLevelSelect2 tab4" value="5">보류</button>
									<button type="button" style="text-decoration: none;" id="level6" class="tLevelSelect2 tab6" value="6">일정</button>
								</div>
							</div>
							
							<script>
							
								$(".tLevelSelect2").each(function(){
									$(this).click(function(){
										
										$('.tlevelup').val($(this).val());
									})
								});
								
								
							</script> 
						
							<hr />
						<div class="form-group">
							<label class="col-md-4 control-label" for="담당자 추가">담당자</label>
							<div class="col-md-4">
								<select id="uptmno" name="tmno" class="form-control" style="margin-left:130px;">
								</select>
				
							</div>
						</div>
						<hr />
							<!-- 3. 시작일 지정 -->
							<div class="line" id="START_DT_LINE" style="display: inline-block;">
								<label class="icon3"><span class="blind" >시작일</span></label>&nbsp; &nbsp;  
								<div class="workdate" >
									<input class="START_DT"  name="tstartdate" value="${task.tstartdate}" id="sd" ><button id="START_DT_DEL" style="margin-left: -8px;display:none;" class="workdateDel"><span class="blind">삭제</span></button>
									<span id="START_DT_CNTN" class="c_red" style="display:none;">시작일이 마감일보다 이후 날짜로 되어 있습니다.</span>
								</div>
							</div>
							<!-- 4. 마감일 지정 -->
							&nbsp;~&nbsp; 
							<div class="line" id="END_DT_LINE" style="display: inline-block;">
								<label class="icon4" ><span class="blind" >마감일</span></label>
								<div class="workdate" >
									<input class="END_DT"  name="tenddate"  value="${task.tenddate}" id="ed"><button id="END_DT_DEL" style="margin-left: -8px; display:none;" class="workdateDel"><span class="blind">삭제</span></button>
									<span id="END_DT_CNTN" class="c_red" style="display:none;">마감일이 시작일 이전 날짜로 되어 있습니다.</span><span id="END_DT_OVERDUE" class="c_red" style="display:none;">마감기한이 지났습니다.</span>
								</div>
							</div>
						<hr />
			<!-- 6. 우선순위 지정 -->
			<div class="form-group" >
				우선순위 : 
					<div class="col-md-4"  style="display: inline-block;">
						<select id="ttpriority" name="ttpriority" class="form-control">
							<option value="1">낮음</option>
							<option value="2" style="color:green;">보통</option>
							<option value="3"style="color:orange;">높음</option>
							<option value="4" style="color:red;">긴급</option>
						</select>
					</div>
					<script>
/* 						$(function(){
								var num = $('#count');
								var tpr = $('#nowp'+ num).val();
								
								if($('.ttp1'+num).val() == tpr){
									$('.ttp1'+num).attr("selected", true);
									
									$('.ttp1'+num).parent().prop('disabled', true);
								}
								if($('.ttp2'+num).val() == tpr){
									$('.ttp2'+num).attr("selected", true);
									$('.ttp2'+num).parent().prop('disabled', true);
								}
								if($('.ttp3'+num).val() == tpr){
									$('.ttp3'+num).attr("selected", true);
									$('.ttp3'+num).parent().prop('disabled', true);
								}
								if($('.ttp4'+num).val() == tpr){
									$('.ttp4'+num).attr("selected", true);
									$('.ttp4'+num).parent().prop('disabled', true);
								}
							})
									 */	
						</script> 
			</div>
                        <textarea name="tcontent" id="uptcontent" cols="" rows="" onkeyup="fn_textAreaResize(this);" 
						class="mentions input ui-autocomplete-input" 
						style="line-height: 23px; 
						background-color: transparent; 
						height: 119px; width:320px;
						border-radius: 5px;
						background:white;" 
						placeholder="글을 작성하세요." 
						autocomplete="off"></textarea>
                    </div>
					<div class="pst_btn_bx" id="filetag">	
						<button type="button" id="filebtn"
								class="btn btn-outline-danger btn-block" style="border-color : #F88E6F;">
						</button>
						<button type="button" class="btn btn-outline-danger btn-block" onclick="deleteAttach();">첨부파일 삭제</button>
					</div>	
					
				<div class="pst_btn_bx" id="filetag2">	
					<span class="btn app_addfile">		
					<input type="file" name="upFile" id="upFile1" multiple/>
					
					</span>		
					
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
	console.log("tno : " + tno);
	
	/* $('#levelp').append('<input type="hidden" value="'+num +'" id="levelnum'+num +'"/>'); */
	
	$.ajax({
	    url  :'${pageContext.request.contextPath}/task/taskUpdateView.do',
	    type : "get",
	    dataType: "json",
	    contentType: 'application/json; charset=utf-8',
	    data : {tno : tno},
	    success : function(data) {
	 	   console.log(data);
	       	var task = data.task;
	       	/* $('#tnoh1').append('<input type="hidden" name="count" id="levelchk'+num+'" value="'+task.tlevel +'"/>'); */
	       	$('#level'+task.tlevel).addClass("selected");
	       	$('#tnoh1').append('<input type="hidden" class="tno" name="tno" id="'+task.tno+num+'" value="'+task.tno +'"/>');
	       	if(data.attach != null){
	       		var attach = data.attach;	
	       		$('#filebtn').attr("onclick" , "location.href='${pageContext.request.contextPath}/resources/upload/task/'" + attach.fnewname);
	       		$('#filebtn').text("첨부파일  -" + attach.foldname);
	       		$('#filetag2').empty();
	       	}else{
	       		$('#filetag').empty();
	       	}
			$('#level'+task.tlevel).addClass("selected");
			$('.tlevelup').val(task.tlevel);
			
			console.log(task.tstartdate.substring(0,10));
			

			/* if($(task.tlevel == 6)){ */
				$('#uptwriter').text(task.twriter);
				/*  	$('#upwritedate').text(task.twritedate); */
				 		  $('#upttitle').attr("value",task.ttitle);
				 		  $('#uptcontent').text(task.tcontent);
				 	   	  $('#sd').val(task.tstartdate.substring(0,10));
				 	   	$('#ed').val(task.tenddate.substring(0,10));
			/* }else{
				$('#uptwriter').text(task.twriter);
			   $('#upwritedate').text(task.twritedate);
				$('#upttitle').attr("value",task.ttitle);
				$('#uptcontent').attr("value",task.tcontent);
				$('#sd').prop('value', task.tstartdate);
				$('#ed').prop('value', task.tenddate);
			} */
				 	   donutPie();
	    },
	    error : function(jqxhr, textStatus, errorThrown){
	        console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
	    }
	    
	}); 
})
$('button[id^=incomment]').click(function(){
	var thisid = $(this).val();
	
	if($('#ccontent'+thisid).val() == null){
		alert("댓글 내용을 입력해주세요.");
		event.preventDefault();
		return false;
	}

	var pno = ${project.pno};
	var mno = ${member.mno};
	var ccontent = $('#ccontent'+thisid).val();
	var ctno = $('#ctno'+thisid).val();
	console.log("con :" + ccontent +"ctno : " +ctno);

	$.ajax({
	    url  :'${pageContext.request.contextPath}/comment/insertcomment.do',
	    type : "get",
	    dataType: "json",
	    contentType: 'application/json; charset=utf-8',
	    data : { ccontent : ccontent, pno : pno, mno : mno, ctno : ctno},
	    success : function(data) {
				console.log(data);
				var attach = data.img;
				var comment = data.comment;
				var m = data.m;  

            	$('#locdiv'+thisid).after('<div id="commentdivi'+thisid +'" style="border : 1px solid lightgray;" ><img class="rounded-circle" width="45" id="commentImgi'+thisid +'" style=" float:left; margin-left:20px; margin-top:10px; display:inline-block;"  src="" alt="" /></div>');
				$('#commentdivi'+thisid).append(' <h4 type="text" value="" style=" float : left; display:inline-block;  margin-left:20px; margin-top:10px;">'+ m.nickName+'</h4>');
				$('#commentdivi'+thisid).append(' <textarea style="width: 65%; background-color: transparent; margin-top : 10px; margin-bottom:10px; resize:none; display:inline-block;" maxlength="4000" placeholder="댓글을 입력하세요" id="nowcontent'+thisid+'" readonly>'+comment.ccontent+'</textarea> &nbsp;');
				$('#commentImgi'+thisid).prop("src", "${pageContext.request.contextPath }/resources/upload/profile/"+ attach.renamedFileName);
				$('#commentImgi'+thisid).css('display','block'); 
				$('#commentImgi'+thisid).after('<button id="incom" style="float: right; width:50px; height:50px; border-radius: 5px; background-color: #F88E6F; margin-right:20px; margin-top:10px;" class="primary small">삭제</button>');
				$('#incom').attr('onclick', "location.href='${pageContext.request.contextPath }/comment/deletecomment.do?cno="+comment.cno+"&pno="+pno+"&mno="+ mno+"'");
                    
	    },
	    error : function(jqxhr, textStatus, errorThrown){
	        console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
	    }
	    
	})
});



function deleteAttach(){
	var tno = $('.tno').val();
	$.ajax({
	    url  :'${pageContext.request.contextPath}/task/deleteAttach.do',
	    type : "get",
	    dataType: "json",
	    contentType: 'application/json; charset=utf-8',
	    data : {tno : tno},
	    success : function(data) {
				alert(data.msg);
				$('#filetag').empty();
	    },
	    error : function(jqxhr, textStatus, errorThrown){
	        console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
	    }
	    
	}); 
}



	function validate(){
		
/* 		if($("#tlevel").val() == 0){
			alert("업무 단계를 입력해주세요.");
			return false;
		} */
		
		if($("#tmno").val() == ""){
			alert("업무 담당자를 지정해주세요.");
			event.preventDefault();
			return false;
		}
		
		if($("#dp1545179837850").val() == ""){
			alert("업무 종료일을 입력해주세요.");
			event.preventDefault();
			return false;
		}
		
		if($("#ttpriority").val() == ""){
			alert("업무 우선 순위를 입력해주세요.");
			event.preventDefault();
			return false;
		}
	}
	



    
	
	function commentin(){
		
		if($('#ccontent').val() == null){
			alert("내용을 입력해주세요.");
			event.preventDefault();
			return false;
		}
	}
	
	$('#deltask').click(function(){
		 donutPie();
	})

	
		function donutPie(){
		var pieData = {
			요청: 0,
			진행: 0,
			피드백: 0,
			완료: 0,
			보류: 1
		};
		var chartDonut = c3.generate({
			bindto: "#piechart",
			data: {
				json: [pieData],
				keys: {
					value: Object.keys(pieData),
				},
				type: "donut",
			},
			donut: {
				title: "전체 " + "건",
			},
		});
	}
	</script>
</body>
</html>