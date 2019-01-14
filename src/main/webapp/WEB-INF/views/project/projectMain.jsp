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
<script>
// 상세 불러오는 모달
function optionModalClk(pno){
	 var pno = pno;

	 console.log(pno);
	$.ajax({
       url  :"${pageContext.request.contextPath}/project/projectMainDetail",
       data : {pno:pno},
       dataType: "json",
       type : "get",
       success : function(data) {
       	var oneProject = data.OneProject;
       	var OneProjectLvList = data.OneProjectLvList;
    	console.log(oneProject);
       	console.log(OneProjectLvList);
       	
       	var persentn = oneProject.plevelck/oneProject.plevel*100;
       	var persent = Math.floor(persentn);
   		console.log(persent);
       	if(oneProject.plevel == 0){
       		
       		var printPer ="";
       		printPer+='<label for="recipient-name" class="form-control-label">진행률</label>';       
       		printPer+='<p class="btn btn-light lvProgress" style="width: 100px; height: 100px; border-radius: 70px; line-height: 80px;font-weight: 600;font-size: 30px; cursor:default; ">X</p>';
       		printPer+=
       		$('.formPer').append(printPer);
       		printPer = "";   
       		
       		var printHTML = "";
           	printHTML+='<small>프로젝트명</small>';
           	printHTML+='<input name="thisPno" style="display: none;" value="'+oneProject.pno+'" ></input>';
           	printHTML+='<h4>'+oneProject.ptitle+'</h4>';
           	printHTML+='<small>프로젝트 개요</small>';
           	printHTML+='<p>'+oneProject.psummary+'</p>';
           	$('#onePj').append(printHTML);
           	printHTML = "";  
           	
           	var printListHTML = "";
   			printListHTML+='<label for="ck1">설정된 레벨이 없습니다.</label><br>';
   			$('#checkLevel').append(printListHTML);
   			printListHTML = ""; 	
   			
   			var footerHTML = "";
   			footerHTML+= '<button type="button" class="btn btn-sm updateModal" style="background-color: coral; color: white"  data-toggle="modal" data-target="#updateModal" onclick="updateModalClk('+oneProject.pno+')">수정</button>';
          	$('.footbtn').append(footerHTML);
         	footerHTML = ""; 
          
       	}else{
       		
       		var printPer ="";
       		printPer+='<label for="recipient-name" class="form-control-label">진행률</label>';       
       		printPer+='<p class="btn btn-light lvProgress" style="width: 100px; height: 100px; border-radius: 70px; line-height: 80px;font-weight: 600;font-size: 30px; cursor:default; ">'+persent+'% </p>';
       		printPer+=
       		$('.formPer').append(printPer);
       		printPer = "";   
       		
           	var printHTML = "";
           	printHTML+='<small>프로젝트명</small>';
           	printHTML+='<input name="thisPno" style="display: none;" value="'+oneProject.pno+'" ></input>';
           	printHTML+='<h4>'+oneProject.ptitle+'</h4>';
           	printHTML+='<small>프로젝트 개요</small>';
           	printHTML+='<p>'+oneProject.psummary+'</p>';
           	$('#onePj').append(printHTML);
           	printHTML = "";   
           	
           	var footerHTML = "";
   			footerHTML+= '<button type="button" class="btn btn-sm updateModal" style="background-color: coral; color: white"  data-toggle="modal" data-target="#updateModal" onclick="updateModalClk('+oneProject.pno+')">수정</button>';
          	$('.footbtn').append(footerHTML);
         	footerHTML = ""; 
         	
           	var printListHTML = "";
    		for(var i=0; i<OneProjectLvList.length;i++){
    			printListHTML+='<input type="checkbox" name="levelCk" onClick="LevelSum(this.form);" id="'+OneProjectLvList[i].lno+'" class="'+oneProject.pno+'" value="'+OneProjectLvList[i].lcheck+'">';
    			printListHTML+='<input id="thisLck" name="thisLck" style="display: none; class="'+OneProjectLvList[i].lcheck+'"></input>';
    			printListHTML+='<label for="ck">&nbsp'+OneProjectLvList[i].lname+'</label><br>';
    			//printListHTML+='<label for="ck1">설정된 레벨이 없습니다.</label><br>';
    			$('#checkLevel').append(printListHTML);
    			printListHTML = ""; 	
    			
    			
    			// 체크값 Y 일 때 자동으로 체크
    			if(OneProjectLvList[i].lcheck =='Y'){
    				var ckNum =OneProjectLvList[i].lno;
    				 //console.log("Y값ck:" + ckNum );
    				 $('input:checkBox[id='+ckNum+']').prop( "checked", true );
    			}else{
    				var ckNumN =OneProjectLvList[i].lno;
    				//console.log("N값ck:" + ckNumN );
    				$('input:checkBox[id='+ckNumN+']').prop( "checked", false );
    			}	 
    		}
    		
       	}
   		
		
		
       },
       error : function(jqxhr, textStatus, errorThrown){
           console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
       }
    });
	 
	
};

</script>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	  <div id="wrapper" >
      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item" style="margin-top: 20px;">
          <a class="nav-link " href="#" data-toggle="modal" data-target="#projectModal">
            <i class="fas fa-folder-plus"></i>
            <span>프로젝트 생성</span>
          </a>
        </li>
      </ul>
          
          <!-- Modal -->
          <div class="modal fade" id="projectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 999999" data-backdrop="static">
              <div class="modal-dialog" role="document">
              
               <form id="proejctEnrollFrm" name="proejctEnrollFrm" method="post">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="projectModalLabel">프로젝트 생성</h5>
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
						<table width="400" border="0" cellspacing="0" cellpadding="0">
						  <tr>
						    <td colspan="2" align="left" bgcolor="#FFFFFF">
						      <table width="100%" border="0" cellpadding="0" cellspacing="0">
						        <tr>
						         <td colspan="5" bgcolor="#FFFFFF" height="25" align="left">
						         
						         <label for="message-text" class="form-control-label">프로젝트 단계설정 (최대 5단계)</label>
						         <button type="button" class="btn plusbtn btn-light" onClick="insRow()">+</button>
						        </td>
						        
						        </tr>
						        <tr>
						         <td height="25">
						           <table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
						            <tr>
						              <!-- <td><input type="text" name="lname" class="form-control firstLname" style="width: 90% !important; display: inline-block; margin-bottom: 5px;"></td> -->
						              <td align="left"></td>
						            </tr>
						          </table></td>
						        </tr>
						       </table>
						      </td>
						   </tr>
						 </table>
						 <table width="460" border="0" cellspacing="0" cellpadding="0">
						    <tr>
						      <td height="10">
						      </td>
						    </tr>
						 </table>
                        </div>
                        <div class="modal-footer" style="display: flex; flex-direction: row; justify-content: center; align-items: center;" >
		                  <button type="button" class="btn btn-light btn-sm" data-dismiss="modal">취소</button>
		                  <button type="button" class="btn btn-sm btn-send" style="background-color: coral; color: white">만들기!</button>
		                </div>                 
                  </div>
                </div>
               </form>
              </div>
            </div>

      <div id="content-wrapper" >

        <div class="container-fluid">

          <!-- Page Content --> 
          
          <c:forEach items="${projectList}" var="project" varStatus="vs">
          <c:if test="${project.plevel >0}">
            <div class="pj_folder" id="pj_folder" style="background: rgba(255, 220, 205, 1);">
                <button type="button"  class="optionBtn btn btn-link" data-toggle="modal" data-target="#optionModal" onclick="optionModalClk(${project.pno})">
                    <i class="fas fa-cog setting_icon fa-1x"></i></button>
              <div class="pj_folder_in" >
            		<span id="pno" name="pno" style="display: none;">${project.pno}</span>
                    <h5>${project.ptitle}</h5>
                    <p>${project.psummary}</p>
                    <div class="progress_area">
                      <small>진행률</small>
                      <div class="progress">
                        <fmt:parseNumber var="num1" value="${project.plevel}"/>
                        <fmt:parseNumber var="num2" value="${project.plevelck}"/>
                        <fmt:parseNumber var="persent" integerOnly="true" value="${num2/num1*100}"/>
                        <div class="progress-bar bg-success" role="progressbar" 
                        style="width: ${persent}%;" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100">
                        <b id="per">${persent}%</b></div>
                      </div>
                      <p>AA님 외 N명 참여중</p>
                    </div>       
              </div>
            </div>
            </c:if>
            
            <c:if test="${project.plevel<1}">
              <div class="pj_folder" style="background: rgb(252, 247, 204);">
                  <button type="button"  class="optionBtn btn btn-link" data-toggle="modal" data-target="#optionModal"  onclick="optionModalClk(${project.pno})">
                    <i class="fas fa-cog setting_icon fa-1x"></i></button>
                  <div class="pj_folder_in">
                  		<span id="pno" name="pno" style="display: none;">${project.pno}</span>
                        <h5>${project.ptitle}</h5>
                        <p>${project.psummary}</p>
                        <div class="users_area">
                          <div id="users_Img" class="users_cropcircle"></div>
                          <div id="users_Img" class="users_cropcircle"></div>
                          <div id="users_Img" class="users_cropcircle"></div>
                          <p>AA님 외 N명 참여중</p>
                        </div>       
                  </div>
                </div>
			</c:if>
			</c:forEach>
			
                <!-- optionModal -->
                <div class="modal fade" id="optionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 999999" data-backdrop="static">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                      <form id="optionFrm" name="optionFrm">
                      
                      
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">프로젝트 상세</h5>
                          <button type="button" class="close detailmodalClose" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" >&times;</span>
                          </button>
                        </div>
                        
                        <div class="modal-body">
                        
                          <div style="position: relative; height:160px;">
                            <div class="form-group col-md-4 formPer" style="border: 0px solid black; display: inline-block; position: absolute; left: 20px; padding-top: 10px">
                              
                            </div>
                          <div class="form-group col-md-6 formLv" style="border: 0px solid black; background-color: rgb(245, 245, 245); display: inline-block; position: absolute; right: 30px; padding: 5px; height: 160px; overflow: auto;">
                            <label for="message-text" class="form-control-label">목표단계</label>
                            <div id="checkLevel" style="text-align: left; padding-left: 8px">
                              
                            </div>
                          </div>
                        </div>   
                          <hr>
                       	<div id="onePj" style="text-align: left">
                         </div>
                       </div>
                       
                        <div class="modal-footer footbtn">
                          <button type="button" class="btn  btn-light btn-sm detailmodalClose" data-dismiss="modal">확인</button>
                        </div>
                        
                        </form>
                      </div>
                    </div>
                  </div>
          <!-- /Page Content -->

          <!-- update Modal -->
          <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 999999" data-backdrop="static">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">프로젝트 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <form id="updateModalFrm">
                  <div class="modal-body" style="text-align: left">
                  <input class="pj_num" style="display: none;">
                      <div class="form-group">
                        <label for="recipient-name" class="form-control-label" id="reTitle">프로젝트 명</label>

                      </div>
                      <div class="form-group">
                        <label for="message-text" class="form-control-label" id="rePsummary">프로젝트 개요</label>
                       
                      </div> 
                       <div class="form-group levelbox" >
                        <hr>
						<table width="400" border="0" cellspacing="0" cellpadding="0">
						  <tr>
						    <td colspan="2" align="left" bgcolor="#FFFFFF">
						      <table width="100%" border="0" cellpadding="0" cellspacing="0">
						        <tr>
							         <td colspan="5" bgcolor="#FFFFFF" height="25" align="left">
								         <label for="message-text" class="form-control-label">프로젝트 단계수정</label>
							         </td>
						        </tr>
						        <tr>
						         <td height="25">
						           <table id="UpAddTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
							            <tr>
							              <!-- <td><input type="text" name="lname" class="form-control firstLname" style="width: 90% !important; display: inline-block; margin-bottom: 5px;"></td> -->
							              <td align="left"></td>
							            </tr>
						          </table>
						        </td>
						        </tr>
						       </table>
						      </td>
						   </tr>
						 </table>
						 <table width="460" border="0" cellspacing="0" cellpadding="0">
						    <tr>
						      <td height="10">
						      </td>
						    </tr>
						 </table>
                        </div>
                        <div class="modal-footer" style="display: flex; flex-direction: row; justify-content: center; align-items: center;" >
		                  <button type="button" class="btn btn-light btn-sm" data-dismiss="modal">취소</button>
		                  <button type="button" class="btn btn-sm btn-send" style="background-color: coral; color: white">수정</button>
		                </div>                 
                  </div>
                  </form>
                </div>
              </div>
            </div>

        </div>
        <!-- /.container-fluid -->

        
      </div>
      <!-- /.content-wrapper -->
      
    </div>
    
	
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
	
	<script>

	// 체크 값 바꾸기 N/Y
	function LevelSum(frm){
		   var sum = 0;
		   var count = frm.levelCk.length;
		   var param = {}; 
		   $('input:checkbox[name="levelCk"]').change(function(){
			    console.log("체인지:"+$('input:checkbox[name="levelCk"]'));
			    param.lpno = $(this).prop('class');
				param.lno = $(this).prop('id');
				param.lcheck = $(this).val();
	   			console.log("체크값: " +  param.lno); 
	   			console.log("lpno: " +  param.lpno); 
	   			param.plevelck = sum;
	   			param.pno = $("#onePj [name=thisPno]").val();
	   			var jsonStr = JSON.stringify(param);
	   			 console.log("jsonStr:"+jsonStr);
	   			 
	   			levelajax(jsonStr);
		   });
		   for(var i=0; i < count; i++ ){
		       if( frm.levelCk[i].checked == true ){
			    	sum ++;	
		       }
		   }
		  console.log("선택되어진 체크박스의 갯수는 " + sum + "개입니다." );
	};
	
	function levelajax(jsonStr){
		$.ajax({
		       url  :"${pageContext.request.contextPath}/project/projectLevelCk.do",
		       data : jsonStr,
		       dataType: "json",
		       contentType: 'application/json; charset=utf-8',
		       type : "post",
		       success : function(data) {
		    	   console.log(data);
		    	   
		       },
		       error : function(jqxhr, textStatus, errorThrown){
		           console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
		       }
		   }); 
	}
	
	// 상세수정 모달
	function updateModalClk(pno){
		var this_pno = pno;
		console.log("수정창");
		$("#updateModal .modal-body .pj_num").val(this_pno);
		//console.log($("#updateModal .modal-body .pj_num").val());
		$.ajax({
	       url  :"${pageContext.request.contextPath}/project/projectMainUpdate",
	       data : {pno:pno},
	       dataType: "json",
	       type : "get",
	       success : function(data) {
			var oneProject = data.OneProject;
	        var oneProjectLvList = data.OneProjectLvList;
	           
	    	var titleHtml ="";
	    	titleHtml+='<input type="text" class="form-control" name="ptitle" placeholder="프로젝트명" value="'+oneProject.ptitle+'">';
	       	$('#reTitle').append(titleHtml);
	       	titleHtml = "";   
	       	
	       	var psummaryHtml ="";   	
	       	psummaryHtml+='<textarea class="form-control" name="psummary" placeholder="개요" style="resize: none;">'+oneProject.psummary+'</textarea>';
	        $('#rePsummary').append(psummaryHtml);
	        psummaryHtml = "";   
	        
	        var lvListHTML = "";
	        if(oneProjectLvList==0){
	        	lvListHTML+='<label for="ck1">설정된 레벨이 없습니다.</label><br>';
	        }else{
	    		for(var i=0; i<oneProjectLvList.length;i++){
	    			lvListHTML+='<input type="text" id="'+oneProjectLvList[i].lno+'" name="lname" class="form-control" style="width: 90% !important; display: inline-block; margin-bottom: 5px;" value="'+oneProjectLvList[i].lname+'">';
	    			console.log(oneProjectLvList[i].lno+":"+oneProjectLvList[i].lname);
	    		}
	        }
	        $('#UpAddTable').append(lvListHTML);
			lvListHTML = ""; 	
	        
	       },
	       error : function(jqxhr, textStatus, errorThrown){
	           console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
	       }
	    });
		
	};
	
	
	$("#updateModalFrm .btn-send").on("click",function(){
		var param = {};
		param.pno= $(".modal-body .pj_num").val();
		param.ptitle = $("#reTitle [name=ptitle]").val();
		param.psummary = $("#rePsummary [name=psummary]").val();
		
		var jsonStr = JSON.stringify(param);
		console.log(jsonStr);
		
		var UpAddTablecount = $("#UpAddTable [name=lname]").length;
		var larr = new Array();
		if(UpAddTablecount!=0){
			for(var i=0; i<UpAddTablecount;i++){
				var lobj = new Object();
				lobj.lpno = $(".modal-body .pj_num").val();
				lobj.lno = $("#UpAddTable  [name=lname]").eq(i).prop('id');
				lobj.lname = $("#UpAddTable  [name=lname]").eq(i).val();
				console.log(lobj);
				larr.push(lobj);		
				var jsonArr = JSON.stringify(larr);
			}
				console.log(jsonArr);
		}
		

		 $.ajax({
            url  : "${pageContext.request.contextPath}/project/projectMainUpdateFrm",
            data : {jsonStr:jsonStr, jsonArr:jsonArr},
            dataType: "json",
            type : "post",
            success : function(data){
                console.log(data);
                location.reload();
               
            },
            error : function(jqxhr, textStatus, errorThrown){
                console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
            }
        });	
		
	});
	
	$('.detailmodalClose').click(function () { 
		 // location.reload();
		$('#onePj').empty();
		$('#checkLevel').empty();
		$('.formPer').empty();
		$('.footbtn').empty();
		location.reload();
	});

	
		// level checkBox 
	    var oTbl;
	  	var count = 2;
	    
	    //Row 추가
	    function insRow() {
	    	if(count<=6){
		      oTbl = document.getElementById("addTable");
		      var oRow = oTbl.insertRow();
		      oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
		      var oCell = oRow.insertCell();
		    	//삽입될 Form Tag
		        var frmTag = "<input type='text' name='lname' class='form-control' style='width: 90% !important; display: inline-block; margin-bottom: 5px;'> ";
		        frmTag += "<button type='button' class='btn plusbtn btn-light' onClick='removeRow()' >-</button>";
		        
		      oCell.innerHTML = frmTag;
		      count++;
	    	}else{
	    		alert("최대 5단계를 초과할 수 없습니다.");
	    	}
	    }
	    //Row 삭제
	    function removeRow(thisCount) {
	    	if(count>1){
		      oTbl.deleteRow(oTbl.clickedRowIndex);
		      count--;
	    	}
	    }	
	
		$("#proejctEnrollFrm .btn-send").on("click",function(){
			//파라미터를 post방식으로 전송 -> message body에 씀
			//json문자열로 처리해야 컨트롤러에서 @RequestBody가 처리함(HttpMessageConverter에 의해 커맨트객체 매핑)
			//ajax요청 필수속성  => contentType: 'application/json; charset=utf-8' 
			
			var frm = document.proejctEnrollFrm;
		      
		      for( var i = 0; i <= frm.elements.length - 1; i++ ){
		         if( frm.elements[i].name == "lname" )
		         {
		             if( !frm.elements[i].value ){
		                 alert("단계설정을 입력하세요!");
		                     frm.elements[i].focus();
		    	 return;
		              }
		          }
		       } 
			
			var param = {};
			param.ptitle = $("#proejctEnrollFrm [name=ptitle]").val();
			param.psummary = $("#proejctEnrollFrm [name=psummary]").val();
			param.pmmno =$(".headerMno").text();
			param.plevel =$("#proejctEnrollFrm [name=lname]").length;
			
			var larr = new Array();
			
			for (var i=0; i<$("#proejctEnrollFrm [name=lname]").length; i++){
				if($("#proejctEnrollFrm [name=lname]").val ==null){
					param.plevel = 0;
				}else{
				var lobj = new Object();
				lobj.lno = i+1;
				lobj.lname = $("#proejctEnrollFrm [name=lname]").eq(i).val();
				larr.push(lobj);					
				var jsonArr = JSON.stringify(larr);
				console.log(jsonArr);
				}
			}
			var jsonStr = JSON.stringify(param);
			console.log(jsonStr);

			 $.ajax({
	            url  : "${pageContext.request.contextPath}/project/projectMainLv",
	            data : {jsonStr:jsonStr, jsonArr:jsonArr},
	            dataType: "json",
	            type : "post",
	            success : function(data){
	                console.log(data);
	                location.reload();
	               
	            },
	            error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
	            }
	        });				
		});

	
	
	 $('.pj_folder_in').click(function () {  
         //e.preventDefault();  
        /*  var url = "${pageContext.request.contextPath}/project/projectPage.do";  
         window.open(url, "_self");   */
         var pno = $(this).children("#pno").text();
         var mno = $(".headerMno").text();
         //var pno = document.getElementById('pno').val();
         console.log(pno);

         console.log("메인"+mno);
         
         location.href = "${pageContext.request.contextPath}/project/projectPage.do?pno="
             +pno+"&mno="+mno;
         
     }); 
	 
	 /* project level btn */
	 $(document).ready(function(){
        $(".addLevel").click(function(){
          $(".addLevel").hide();
          $(".delLevel").show();  
          $(".levelbox").show();  
          $("#addTable").show();
        });
        $(".delLevel").click(function(){
          $(".addLevel").show();
          $(".delLevel").hide();  
          $(".levelbox").hide(); 
          $("#addTable").hide();
          for(var i=count; i>-1; i--){
	          oTbl.deleteRow(oTbl.clickedRowIndex);
	          count--;
          }
        });
        $(".updateModal").click(function(){
            $("#updateModal").modal('show'); 
            $("#optionModal").modal('hide');
          });
        
        
      });
	  
	
	</script>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>