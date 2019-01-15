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
<div class="post_write_wrap" style="text-align : center;" id="taskside">
		<%-- <c:import url="../common/introSidebar.jsp"/> --%><!-- css적용이 안됌 -->
		<form name="taskForm" id="taskForm" action="${pageContext.request.contextPath}/task/taskFormEnd.do" method="post" onsubmit="return validate(); " enctype="multipart/form-data">
		<div class="post_write_tab">
		</div>
		
		<div class="pst_write_bx" id="collabo_427890" >	
		<div class="workwriteWrap mgb30" style="min-height: 120px;">
		<!-- 업무명 -->
		<div class="form-group">
			<label class="col-md-4 " for="ttitle"></label>
				<div class="col-md-4">
					<input id="ttitle" name="ttitle" type="text" placeholder="업무명을 입력하세요" class="form-control" style="width:360px; border : 3px solid white; background : white;"
								required />
				</div>
			</div>
			<!-- 작성자 -->
		<div class="form-group">
				<div class="col-md-4">
					<input id="twriter" name="twriter" type="text" value="${member.nickName }" class="form-control" style="text-align:center; width:150px; margin-left:110px; border : 3px solid white; background : white;"
								readonly />
					<input type="hidden" name="mno" value="${member.mno }" />
					<input type="hidden" name="pno" value="${project.pno }" />
				</div>
		</div>
		
		<!-- 업무내용 -->
		<div class="workwriteCont line-fold">
			<!-- 1. 업무상태 지정 -->
			<div class="line" >
				<label class="icon1"><span class="blind"></span></label>
				<div class="workTab" name="tLevelSelect">
					<input type="hidden" name="tlevel" id="tlevel" value="0"/>
					<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab1" value="1">요청</button>
					<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab2" value="2">진행</button>
					<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab3" value="3">피드백</button>
					<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab4" value="4">완료</button>
					<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab5" value="5">보류</button>
					<button type="button" style="text-decoration: none;" name="level" class="tLevelSelect tab6" value="6">일정</button>
				</div>
				<script>
					$(".tLevelSelect").each(function(){
						$(this).click(function(){
							$('#tlevel').val($(this).val());
						});
					});
				</script>
			</div>
			<!-- 2. 담당자 지정 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="담당자 추가">담당자</label>
							<div class="col-md-4">
								<select id="tmno" name="tmno" class="form-control" style="margin-left:130px;">
								</select>
				
							</div>
						</div>
			<!-- 3. 시작일 지정 -->
			<div class="line" id="START_DT_LINE" style="display: inline-block;">
				<label class="icon3"><span class="blind" >시작일</span></label>&nbsp; &nbsp;  
				<div class="workdate" >
					<input class="START_DT"  name="tstartdate" placeholder="시작일 추가"><button id="START_DT_DEL" style="margin-left: -8px;display:none;" class="workdateDel"><span class="blind">삭제</span></button>
					<span id="START_DT_CNTN" class="c_red" style="display:none;">시작일이 마감일보다 이후 날짜로 되어 있습니다.</span>
				</div>
			</div>
			<!-- 4. 마감일 지정 -->
			&nbsp;~&nbsp; 
			<div class="line" id="END_DT_LINE" style="display: inline-block;">
				<label class="icon4" ><span class="blind" >마감일</span></label>
				<div class="workdate" >
					<input class="END_DT"  name="tenddate" placeholder="마감일 추가" id="dp1545179837850"><button id="END_DT_DEL" style="margin-left: -8px; display:none;" class="workdateDel"><span class="blind">삭제</span></button>
					<span id="END_DT_CNTN" class="c_red" style="display:none;">마감일이 시작일 이전 날짜로 되어 있습니다.</span><span id="END_DT_OVERDUE" class="c_red" style="display:none;">마감기한이 지났습니다.</span>
				</div>
			</div>
			<br />
	
<!--         <label for="locationTextField">Location</label>
        <input id="locationTextField" type="text" size="50"> -->
<%--          <c:import url="../task/searchLoc.jsp"/> --%>
<!--         <script>
            function init() {
                var input = document.getElementById('locationTextField');
                var autocomplete = new google.maps.places.Autocomplete(input);
            }
 
            google.maps.event.addDomListener(window, 'load', init);
        </script> -->
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
			</div>
		</div>
		</div>
		
		<!-- 최초화면툴팁layer -->	
		
		<textarea name="tcontent" cols="" rows="" onkeyup="fn_textAreaResize(this);" 
		class="mentions input ui-autocomplete-input" 
		style="line-height: 23px; 
		background-color: transparent; 
		height: 119px; width:320px;
		border-radius: 5px;
		background:white;" 
		placeholder="글을 작성하세요." 
		autocomplete="off"></textarea>
				
		<div class="pst_btn_bx" >	
			<span class="btn app_addfile">		
			<input type="file" name="upFile" id="upFile1" multiple/>
			</span>		
		</div>	
		</div>
		
		<div class="right" style="display: inline-block;">
			<input type="submit" class="btn btn-primary" id="insertFlow" value="UPLOAD"/>
		</div>
		</form>
	</div>
	
	<script>
			
	
	function validate(){
		if($("#ttitle").val() == ""){
			alert("업무 제목을 입력해주세요.");
			return false;
		}
		
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
		
		donutPie();

	}
	
	</script>
</body>
</html>