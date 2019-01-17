<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do Project!</title>

<!-- jQuery UI CSS파일 -->
	<!-- jQuery UI CSS파일 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<link rel="stylesheet" href="../resources/css/task.css" />
	<!-- jQuery 기본 js파일 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>    
	<!-- jQuery UI 라이브러리 js파일 -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSep_oACVc__OknKvoBB2SN9ndH85aTLE&libraries=places"></script>
<style>  

/* input 기본 스타일 초기화 */



/*업무진행상태*/
.workwriteWrap button{cursor:pointer;}
button, a{cursor:pointer;}
.workTab{margin:7px 0 0 0;display:inline-block;height:32px;overflow:hidden;}
.workTab button{
	display:inline-block;
	vertical-align:top;
	padding-bottom:2px;margin-left:-1px;
	width:61px;height:32px;line-height:14px;
	font-size:14px;color:#969696;text-align:center;
	background-color:#fff;border:1px solid #f0f1f3;
}

.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}


.tab1.selected {
    background-color: #4CAF50;
    border : #4CAF50;
    color: white;
}

.tab2.selected {
    background-color: #008CBA;
    border : #008CBA;
    color: white;
}


.tab3.selected {
    background-color: #f44336;
    border : #f44336;
    color: white;
}

.tab4.selected {
	background-color: #e7e7e7;
	border : #e7e7e7;
}

.tab5.selected {
    background-color: #555555;
    border : #555555;
    color: white;
}

.tab6.selected {
	background-color: yellow;
    border : yellow;
    color: black;
}

/* 업무진척도 */
/* 업무진척도 */
.workPrgrs{display:block;margin-top:6px;margin-bottom:-3px;padding-bottom:3px;height:20px;}
.workPrgrs:focus{outline:0;border:0;}
.workPrgrs_bg{position:relative;width:150px;height:14px;border-radius:3px;background-color:#eaeaea;}
.workPrgrs_bg .txt{z-index:1;position:absolute;top:0;left:0;right:0;text-align:center;font-size:10px;color:#111;}
.workPrgrs_bg .bar{
	display:block;
	position:absolute;top:0;left:0;bottom:0;
	border-radius:3px;
	background-color:#7099de;
}
.bar.color100p{background-color:#6db47c;}
.workPrgrs_bg .pcnt{
	z-index:1000;display: none;
	position:absolute;top:20px;left:100%;
	margin-left:-18px;
	width:36px;height:23px;line-height:21px;
	border-radius:3px;
	background-color:rgba(0,0,0,0.6);
}
.workPrgrs_bg .pcnt button{
	position:relative;
	display: block;
	width:36px;height:23px;line-height:21px;
	font-size:11px;color:#fff;text-align:center;
	border:0;background:none;
}
.workPrgrs_bg .pcnt::before{
	display:block;position:absolute;top:-5px;left:50%;
	margin-left:-5px;
	content:" ";
	width:10px;height:5px;
	background:url(${pageContext.request.contextPath}/resources/images/bg/tail_filelayer.png) no-repeat;
	opacity:0.8;
}
.pcnt0, .pcnt20, .pcnt40, .pcnt60, .pcnt80, .pcnt100{z-index:100;display: none;position:absolute;top:0;bottom:-10px;width:20%;}
.pcnt20{left:0%;width:15%;display:block;}
.pcnt40{left:20%;display:block;}
.pcnt60{left:40%;display:block;}
.pcnt80{left:60%;display:block;}
.pcnt100{left:80%;display:block;}
.pcnt20.on > .pcnt, .pcnt20:hover > .pcnt,
.pcnt40.on > .pcnt, .pcnt40:hover > .pcnt,
.pcnt60.on > .pcnt, .pcnt60:hover > .pcnt,
.pcnt80.on > .pcnt, .pcnt80:hover > .pcnt,
.pcnt100.on > .pcnt, .pcnt100:hover > .pcnt{display: block;}
.pcnt0.on > .pcnt, .pcnt0:hover > .pcnt{display:block;left:5%;}
.cblist_contwrap .workPrgrs{margin:0 !important;padding:0 !important;position:absolute;bottom:0;right:0;}
.cblist_contwrap.bdk_type .workPrgrs{margin:0 !important;padding:0 !important;position:relative !important;}
.cblist_contwrap.bdk_type .workPrgrs .workPrgrs_bg{margin:0 auto !important;}



/*업무중요도, 우선순위*/
.imptc span, .imptc button{
	display:inline-block;
	font-size:14px;color:#000;
	border:0;background:none;
}
/*.imptc span{margin-top:2px;} 20170421 수정 */
.imptc_ly{z-index:1000;position:absolute;top:33px;left:35px;width:120px;border:1px solid #d2d2d2;border-radius:2px;background-color:#fff;}
.imptc span::before, .imptc button::before{
	display:inline-block;vertical-align:middle;
	content:" ";
	margin:-2px 8px 0 0;
	width:10px;height:11px;
	background:url(../img_rn/ico/ico_implv.png) no-repeat;
}
.workTable-tr.finished .imptc span::before,
.workTable-tr .imptc button::before{
	display:inline-block;vertical-align:middle;
	content:" ";
	margin:-2px 8px 0 0;
	width:10px;height:11px;
	background:url(../img_rn/ico/ico_implv2.png) no-repeat;
}
.workTable-tr.hold .imptc span::before,
.workTable-tr.hold .imptc button::before{
	display:inline-block;vertical-align:middle;
	content:" ";
	margin:-2px 8px 0 0;
	width:10px;height:11px;
	background:url(../img_rn/ico/ico_implv2.png) no-repeat;
}
.imptc span.lv1::before, .imptc button.lv1::before,
.workTable-tr.hold .imptc span.lv1::before, .workTable-tr.hold .imptc button.lv1::before,
.workTable-tr.finished .imptc span.lv1::before, .workTable-tr.finished .imptc button.lv1::before{
	background-position:0 0;
}
.imptc span.lv2::before, .imptc button.lv2::before,
.workTable-tr.hold .imptc span.lv2::before, .workTable-tr.hold .imptc button.lv2::before,
.workTable-tr.finished .imptc span.lv2::before, .workTable-tr.finished .imptc button.lv2::before{
	background-position:0 -28px;
}
.imptc span.lv3::before, .imptc button.lv3::before,
.workTable-tr.hold .imptc span.lv3::before, .workTable-tr.hold .imptc button.lv3::before,
.workTable-tr.finished .imptc span.lv3::before, .workTable-tr.finished .imptc button.lv3::before{
	background-position:0 -56px;
}
.imptc span.lv4::before, .imptc button.lv4::before,
.workTable-tr.hold .imptc span.lv4::before, .workTable-tr.hold .imptc button.lv4::before,
.workTable-tr.finished .imptc span.lv4::before, .workTable-tr.finished .imptc button.lv4::before{
	background-position:0 -83px;
}
.imptc span.blank::before, .imptc button.blank::before,
.workTable-tr.hold .imptc span.blank::before, .workTable-tr.hold .imptc button.blank::before,
.workTable-tr.finished .imptc span.blank::before, .workTable-tr.finished .imptc button.blank::before{
	background:none;
}
.imptc span.lv4, .imptc button.lv4{
	color:#d64648;
}
.imptc_ly button{
	display:block;
	vertical-align:middle;
	padding-left:12px;padding-bottom:2px;
	width:100%;height:30px;line-height:18px;
	text-align:left;
	box-sizing:border-box;
}
.imptc_ly button:hover, .imptc_ly button:focus{background-color:#f5f5f5;}


</style>
<script>
$(document).ready(function(){
	$('.pcnt100').click(function(){
		$('#PROGRESS').css('right','0%')
		/* $('#PROGRESS').css('background-color','#6db47c'); */
		$('#PROGRESS').addClass('color100p');
	});
	
	$('.pcnt80').click(function(){
		$('#PROGRESS').css('right','20%')
		$('#PROGRESS').removeClass('color100p');
	});
	$('.pcnt60').click(function(){
		$('#PROGRESS').css('right','40%')
		$('#PROGRESS').removeClass('color100p');
	});
	
	$('.pcnt40').click(function(){
		$('#PROGRESS').css('right','60%')
		$('#PROGRESS').removeClass('color100p');
	});
	
	$('.pcnt20').click(function(){
		$('#PROGRESS').css('right','80%')
		$('#PROGRESS').removeClass('color100p');
	});
	
	$('.pcnt0').click(function(){
		$('#PROGRESS').css('right','100%')
		$('#PROGRESS').removeClass('color100p');
	});


	$('.tab1').click(function(){
		$(this).addClass('selected');
		$(this).siblings().removeClass('selected');
	});
		
	$('.tab2').click(function(){
		$(this).addClass('selected');
		$(this).siblings().removeClass('selected');
	});

	$('.tab3').click(function(){
		$(this).addClass('selected');
		$(this).siblings().removeClass('selected');
	});

	$('.tab4').click(function(){
		$(this).addClass('selected');
		$(this).siblings().removeClass('selected');
	});

	$('.tab5').click(function(){
		$(this).addClass('selected');
		$(this).siblings().removeClass('selected');
	});
	
	$('.tab6').click(function(){
		$(this).addClass('selected');
		$(this).siblings().removeClass('selected');
	});
	
	/*업무 우선순위*/
	if($('.imptc').onclick){
		$('#PRIORITY_LAYER').css('display','block');
	}
	/* $('.imptc').click(function(){
		
	}); */
});

$(function() {
    $( ".START_DT" ).datepicker({
    	onClose:function(selectedDate){
    		$(".END_DT").datepicker("option","minDate",selectedDate);
    	}
    });
    
    $(".END_DT").datepicker({
    	onClose:function(selectedDate){
    		$(".START_DT").datepicker("option","maxDate",selectedDate);
    	}
    });
});

</script>
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
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypost.do?mno=${member.mno}">
            
            <span>내가 쓴 글</span></a>
        </li>
        <%-- <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/mypage/keeping.do">
            
            <span>담아둔 글</span></a>
        </li> --%>
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
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb" style="background-color : white">
                                    <li class="breadcrumb-item">
                                        <a href="/">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">내가 쓴글</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- ============================================================== -->
            <!-- Container fluid -->
            <!-- ============================================================== -->
   <c:forEach items="${task}" var="task" varStatus="tnum">
	<c:set var="tcount" value="${tnum.count}" />
    <div class="container-fluid gedf-wrapper" style="width: 60%;" onclick="">
        <div >
            <div class=" gedf-main">
			
			<input type="hidden" name="tno" id="tno${tnum.count }" value="${task.tno }"/>
                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header" style="background-color : #F88E6F;">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div >
                                    <img class="rounded-circle" width="45" src="${pageContext.request.contextPath }/resources/upload/profile/${member.renamedFileName}" alt="">
                                </div>
                                <div >
                                    <div class="h5 m-0">&nbsp; ${task.twriter }</div>
                                    <div class="h7 text-muted"></div>
                                </div>
                            </div>
                            
                        </div>
					
                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>${task.twritedate }</div>
                        
                            <h3 class="card-title">${task.ttitle }</h3>
                            <hr />
                        <div class="form-group">
							<h4><label class="col-md-4 control-label" for="담당자 추가" style="margin-top :7px;">담당자 :
								<c:forEach items="${mem}" var="m" varStatus="tnum">
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
									<input name="tstartdate" value="${task.tstartdate}" readonly>
								</div>
							</div>
							</c:if>
							<!-- 4. 마감일 지정 -->
							&nbsp;~&nbsp; 
							<div class="line"  style="display: inline-block;">
								<label class="icon4" ><span class="blind" >마감일</span></label>
								<div  >
									<input name="tstartdate" value="${task.tenddate}" readonly>
								</div>
							</div>
						<hr />
			
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

                </div>
                <!-- Post /////-->

				<br /><br /><br />
				<br/>
            </div>
        </div>
         </c:forEach> 
	
	<script>
	
	 $('.pj_folder').click(function (e) {  
         e.preventDefault();  
         var url = "${pageContext.request.contextPath}/project/projectPage.do";  
         window.open(url, "_self");  
     });  
	
	</script>
</body>

</html>