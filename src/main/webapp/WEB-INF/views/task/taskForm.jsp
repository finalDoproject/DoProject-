<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- jQuery UI CSS파일 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<link rel="stylesheet" href="../resources/css/task.css" />
	<!-- jQuery 기본 js파일 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>    
	<!-- jQuery UI 라이브러리 js파일 -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  


	<title>업무 작성 폼</title>
	<%-- <c:import url="../common/header.jsp"/> --%>

	<script>
	
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=boardContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	
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
		<%-- <c:import url="../common/introSidebar.jsp"/> --%><!-- css적용이 안됌 -->
		<form name="taskForm" action="${pageContext.request.contextPath}/task/taskFormEnd.do" method="post" onsubmit="return validate(); " enctype="multipart/form-data">
		<div class="post_write_tab">
		<ul>
		<li class="ico4 on"><a>업무</a></li>
		<li class="ico3 off"><a>일정</a></li>	
		</ul>
		</div>
		
		<div class="pst_write_bx" id="collabo_427890">	
		<div class="workwriteWrap mgb30" style="min-height: 120px;">
		<!-- 업무명 -->
		<div class="titleBx">
			<input type="text" name="ttitle" id="ttitle" placeholder="업무명을 입력하세요" maxlength="500">
		</div>
		<div class="writerBx">
			작성자 <input type="text" name="twriter" id="twriter" value="유저01" readonly required>
		</div>
		
		<!-- 업무내용 -->
		<div class="workwriteCont line-fold">
			<!-- 1. 업무상태 지정 -->
			<div class="line" >
				<label class="icon1"><span class="blind">상태</span></label>
				<div class="workTab" name="tLevelSelect">
					<input type="hidden" name="tlevel" id="tlevel" value="0"/>
					<button type="button" name="level" class="tLevelSelect tab1" value="1">요청</button>
					<button type="button" name="level" class="tLevelSelect tab2" value="2">진행</button>
					<button type="button" name="level" class="tLevelSelect tab5" value="3">피드백</button>
					<button type="button" name="level" class="tLevelSelect tab3" value="4">완료</button>
					<button type="button" name="level" class="tLevelSelect tab4" value="5">보류</button>
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
			<div class="line" id="WORKER_LINE">
				<label class="icon2" ><span class="blind" >담당자</span></label>
				<div id="workerTagLayer" class="nameBx" >
					<span id="workerTagSelected"></span>
					<button class="namePlus" style="display:none;">담당자 변경</button>
					<div class="txt_add_nm">
						<span class="txt_add_nm_in">
							<span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
							<input name="tmanager" type="text" placeholder="담당자 추가" class="ui-autocomplete-input" autocomplete="off">
						</span>
						<!-- user layer -->
						<div id="workerSelectLayer" class="mentions-input" style="top: 21px; left: -1px; min-width: 170px; display: none;"><!-- 20170407 -->
							<ul tabindex="0" class="user_list sizeSamll ui-autocomplete ui-front ui-menu ui-widget ui-widget-content ui-corner-all" style="left: 0px; top: 0px; width: 130% !important; display: block;"><!-- 20170407 -->
							</ul>
						</div>
						<!-- //user layer -->		
					</div>									
				</div>
			</div>
			<!-- 3. 시작일 지정 -->
			<div class="line" id="START_DT_LINE">
				<label class="icon3"><span class="blind">시작일</span></label>
				<div class="workdate" style="display: block;">
					<input class="START_DT" start_dt="" type="text" name="tstartdate" placeholder="시작일 추가"><button id="START_DT_DEL" style="margin-left: -8px;display:none;" class="workdateDel"><span class="blind">삭제</span></button>
					<span id="START_DT_CNTN" class="c_red" style="display:none;">시작일이 마감일보다 이후 날짜로 되어 있습니다.</span>
				</div>
			</div>
			<!-- 4. 마감일 지정 -->
			<div class="line" id="END_DT_LINE">
				<label class="icon4"><span class="blind">마감일</span></label>
				<div class="workdate" style="display: block;">
					<input class="END_DT" end_dt="" type="text"  name="tenddate" placeholder="마감일 추가" id="dp1545179837850"><button id="END_DT_DEL" style="margin-left: -8px; display:none;" class="workdateDel"><span class="blind">삭제</span></button>
					<span id="END_DT_CNTN" class="c_red" style="display:none;">마감일이 시작일 이전 날짜로 되어 있습니다.</span><span id="END_DT_OVERDUE" class="c_red" style="display:none;">마감기한이 지났습니다.</span>
				</div>
			</div>
			<!-- 5. 진척도 지정 -->
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
			<!-- 6. 우선순위 지정 -->
			<div class="line" id="PRIORITY_LINE">
				<label class="icon6"><span class="blind">우선순위</span></label>
				<div class="imptc">
					<input type="number" name="ttpriority" placeholder="우선순위 선택" style="display: block;">
					
					<button id="PRIORITY_DEL" style="margin-left:-1px;display:none;" class="workdateDel"><span class="blind">삭제</span></button>
					<!-- level layerpopup -->
					<div id="PRIORITY_LAYER" class="imptc_ly" style="display:none; "name="ttpriority">
						<ul>
							<li><button class="lv1"  value="0">낮음</button></li>
							<li><button class="lv2"  value="1">보통</button></li>
							<li><button class="lv3"  value="2">높음</button></li>
							<li><button class="lv4"  value="3">긴급</button></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		<!-- 최초화면툴팁layer -->	
		
		<textarea name="tcontent" cols="" rows="" onkeyup="fn_textAreaResize(this);" 
		class="mentions input ui-autocomplete-input" 
		style="line-height: 23px; 
		background-color: transparent; 
		height: 76px;" 
		placeholder="글을 작성하세요." 
		autocomplete="off"></textarea>
				
		<div class="pst_btn_bx" style="height: 24px;">	
			<span class="btn app_addfile">		
			<input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple/>
			</span>		
		</div>	
		</div>
	
		<div class="right" style="display: inline-block;">
			<input type="submit" class="btn_style1" id="insertFlow" value="UPLOAD"/>
		</div>
		</form>
	</div>
</body>
</html>