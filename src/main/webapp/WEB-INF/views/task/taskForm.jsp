<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>    
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  


<title>업무 작성 폼</title>

<style>
body{
	font-size:14px;color:#505050;
	font-family:Apple SD Gothic Neo, Malgun Gothic, '돋움', '굴림', Arial, sans-serif;
	src: url('../font/MalgunGothic.eot');
	src: url('../font/MalgunGothic.eot?#iefix') format('embedded-opentype'),
	url('../font/MalgunGothic.woff') format('woff'),
	url('../font/MalgunGothic.ttf') format('truetype');
	overflow-y: scroll;
}
input,select,textarea,button{
	margin:0;vertical-align:middle;border:1px solid #e7e7e7;
	font-family:Apple SD Gothic Neo, Malgun Gothic, '돋움', '굴림', Arial, sans-serif;
	src: url('../font/MalgunGothic.eot');
	src: url('../font/MalgunGothic.eot?#iefix') format('embedded-opentype'),
	url('../font/MalgunGothic.woff') format('woff'),
	url('../font/MalgunGothic.ttf') format('truetype');
}

/* input 기본 스타일 초기화 */
input[type=text],
input[type=password],
input[type=number],
input[type=email],
input[type=phone],
button {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background:none;
	border:none;
	font-family:NotoSansCJKkr !important;
}

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
    color: white;
}

.tab2.selected {
    background-color: #008CBA;
    color: white;
}


.tab3.selected {
    background-color: #f44336;
    color: white;
}

.tab4.selected {
	background-color: #e7e7e7;
}

.tab5.selected {
    background-color: #555555;
    color: white;
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

input:focus{outline:none;}

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
	<div class="post_write_wrap">
	<div class="post_dnd_ly" style="display:none">	
	<div class="post_dnd_ly_po off">		
	<div class="status_bar" style="width:41%;"></div>		
	<div class="txt">첨부할 파일, 이미지 등을 여기에 끌어다 놓으세요.</div>		
	<div class="pctfilenm">	<strong>41%</strong><span>#콜라보모바일_Ver2.3.0_160105.pdf</span></div>	
	</div>
	</div>
	
	<div class="post_write_tab">											
	<ul>																				
	<li class="ico4 on"><a>업무</a><span></span></li>					
	<li class="ico3 off"><a>일정</a><span></span></li>								
	</ul>															
	</div>															
	<div class="pst_write_bx" id="collabo_427890">	
	<div class="workwriteWrap mgb30" style="min-height: 120px;">
	<!-- 업무명 -->
	<div class="titleBx">
		<input type="text" name="TASK_NM" placeholder="업무명을 입력하세요" maxlength="500">
		<span id="TASK_NM_READ_ONLY" class="titleReadOnly" style="display:none;"></span>
		<span id="TASK_SRNO" class="num" style="display: none;">업무번호 10023</span>
	</div>
	
	<a id="GO_WORK_FLOW" class="goWorkFlow" style="display: none;">이곳을 클릭하여 해당 글로 이동할 수 있습니다.</a>
	<!-- 업무내용 -->
	<div class="workwriteCont line-fold"><!-- 더보기 close class="line-fold" / 더보기 open class="line-open" -->
		<!-- line1 -->
		<div class="line">
			<label class="icon1"><span class="blind">상태</span></label>
			<div class="workTab">
				<button class="tab1">요청</button>
				<button class="tab2">진행</button>
				<button class="tab5">피드백</button>
				<button class="tab3">완료</button>
				<button class="tab4">보류</button>
			</div>
		</div>
		<!-- line2 -->
		<div class="line" id="WORKER_LINE">
			<label class="icon2"><span class="blind">담당자</span></label>
			<div id="workerTagLayer" class="nameBx">
				
				<span id="workerTagSelected"></span>
				<button class="namePlus" style="display:none;">담당자 변경</button>
				<div class="txt_add_nm">
					<span class="txt_add_nm_in">
						<span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span><input name="WORKER" type="text" placeholder="담당자 추가" class="ui-autocomplete-input" autocomplete="off">
					</span>
					<!-- user layer -->
					<div id="workerSelectLayer" class="mentions-input" style="top: 21px; left: -1px; min-width: 170px; display: none;"><!-- 20170407 -->
						<ul tabindex="0" class="user_list sizeSamll ui-autocomplete ui-front ui-menu ui-widget ui-widget-content ui-corner-all" style="left: 0px; top: 0px; width: 130% !important; display: block;"><!-- 20170407 -->
						</ul>
					</div>
					<!-- //user layer -->
							
				</div>										
			</div>
			
			<div id="workerSelectItemLayer" style="display:none;">
				<li class="ui-menu-item" role="presentation">
					<a tabindex="-1" class="ui-corner-all" id="ui-id-45">
						<div class="photo_wrap">
							<!-- <div class="photo_po"><img width="40" height="40" src="/design2/img_rn/img_photo_null32.png" onerror="this.src='/design2/img_rn/img_photo_null32.png'"></div> -->
						</div>
						<p><strong></strong></p>
					</a>
				</li>
			</div>
			
			<div id="workerTagItemLayer" style="display:none;">
				<div class="nameTag">
					<!-- <img src="/design2/img_rn/img_photo_null32.png" alt="" onerror="this.src='/design2/img_rn/img_photo_null32.png'"> -->
					<strong></strong>
					<button><span class="blind">삭제</span></button>
				</div>
			</div>
				
				
		</div>
		<!-- line3 -->
		<div class="line" id="START_DT_LINE">
			<label class="icon3"><span class="blind">시작일</span></label>
			<div class="workdate" style="display: block;">
				<input class="START_DT" start_dt="" type="text" placeholder="시작일 추가" id="dp1545179837849"><button id="START_DT_DEL" style="margin-left: -8px;display:none;" class="workdateDel"><span class="blind">삭제</span></button>
				<span id="START_DT_CNTN" class="c_red" style="display:none;">시작일이 마감일보다 이후 날짜로 되어 있습니다.</span>
			</div>
		</div>
		<!-- line4 -->
		<div class="line" id="END_DT_LINE">
			<label class="icon4"><span class="blind">마감일</span></label>
			<div class="workdate" style="display: block;">
				<input class="END_DT" end_dt="" type="text" placeholder="마감일 추가" id="dp1545179837850"><button id="END_DT_DEL" style="margin-left: -8px; display:none;" class="workdateDel"><span class="blind">삭제</span></button>
				<span id="END_DT_CNTN" class="c_red" style="display:none;">마감일이 시작일 이전 날짜로 되어 있습니다.</span><span id="END_DT_OVERDUE" class="c_red" style="display:none;">마감기한이 지났습니다.</span>
			</div>
		</div>
		<div class="line" id="PROGRESS_LINE" style="display: block;">
			<label class="icon5"><span class="blind">진척도</span></label>
			<a class="workPrgrs">
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
		
		<!-- line6 -->
		<div class="line" id="PRIORITY_LINE">
			<label class="icon6"><span class="blind">우선순위</span></label>
			<div class="imptc">
				<input type="text" name="imptcInput" placeholder="우선순위 선택" style="display: block;">
				<span id="PRIORITY" class="lv1" style="display: none;">낮음</span>
				<button id="PRIORITY_DEL" style="margin-left:-1px;display:none;" class="workdateDel"><span class="blind">삭제</span></button>
				<!-- level layerpopup -->
				<div id="PRIORITY_LAYER" class="imptc_ly" style="display: none;">
					<ul>
						<li><button class="lv1" data="0">낮음</button></li>
						<li><button class="lv2" data="1">보통</button></li>
						<li><button class="lv3" data="2">높음</button></li>
						<li><button class="lv4" data="3">긴급</button></li>
					</ul>
				</div>
			</div>
		</div>
		
		

		<!-- 더보기버튼 -->
		<!-- <button class="workmore">항목 추가 입력</button> -->
	</div>
	</div>	
	
	<!-- 최초화면툴팁layer -->	
	<div class="red_ttip_ly" id="postTtip" style="display:none;"><div class="po"><span class="tail"></span><p class="txt_r">내용을 입력하세요.</p></div></div>	
	<div class="red_ttip_ly" id="postTtipTask" style="display:none;"><div class="po"><span class="tail"></span><p class="txt_r">업무명을 입력하세요.</p></div></div>	
	<!-- //최초화면툴팁layer -->
	
	<!-- <div class="mentions-input" style="display: block;">
	<div class="highlighter" 
	style="white-space: pre-wrap; 
	overflow-wrap: break-word; 
	margin: 0px; padding: 0px; 
	border-width: 0px; 
	font-size: 14px; 
	font-style: normal; 
	font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, 돋움, 굴림, Arial, sans-serif; 
	font-weight: 400; 
	line-height: 23px; 
	box-sizing: content-box;">
	<div class="highlighter-content"></div>
	</div> -->
	
	<span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
	<textarea cols="" rows="" onkeyup="fn_textAreaResize(this);" 
	class="mentions input ui-autocomplete-input" 
	style="line-height: 23px; 
	background-color: transparent; 
	height: 76px;" 
	placeholder="글을 작성하세요." 
	autocomplete="off"></textarea>
	<input type="hidden" value="">
	<ul class="user_list ui-autocomplete ui-front ui-menu ui-widget ui-widget-content ui-corner-all" id="ui-id-49" tabindex="0" style="display: none;"></ul></div>	
	<div class="todo-area" style="display:none;"></div>	
	<div class="schd-area" style="display:none;"></div>	
	<div class="liveurl-loader"></div>	
	<div class="liveurl-area"></div>	
	
	<!-- 사진 -->	
	<div class="photo_loll_wrap" name="COLABO_IMG_BOX" style="display:none;"><div class="photo_loll_fix"><ul name="COLABO_PIC_UL"></ul></div></div>	
	<!-- //사진 -->	
	
	<!-- 파일 -->	
	<div class="filedown_bx" name="COLABO_FILE_BOX" style="display:none;"></div>	
	<!-- //파일 --></div>
	
	<div class="collabo_file_box" style="display:none;" name="COLABO_FILE_BOX">
		<dl><dd><ul name="COLABO_ATCH_UL"></ul></dd></dl></div>
	<div class="pst_btn_bx" style="height: 24px;">	
	<span class="btn app_addfile">		
	<input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple/>
	<!-- <a title="첨부파일" class="fileicon">파일첨부</a> 업로드전	 -->	
	</span>		
	</div>	
	</div>
	
	<div class="right">		
	<input type="submit" class="btn_style1" id="insertFlow" onclick="fn_insertCollaboCommt('427890');" value="UPLOAD"/>
	</div>
	</div>
	</div>
</body>
</html>