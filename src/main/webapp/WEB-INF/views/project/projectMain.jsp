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
              
               <form id="proejctEnrollFrm">
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

        <div class="container-fluid">


          <!-- Page Content --> 
          <c:forEach items="${projectList}" var="project" varStatus="vs">
          <c:if test="${project.plevel >0}">
            <div class="pj_folder" style="background: rgba(255, 220, 205, 1);">
                <button type="button"  class="optionBtn btn btn-link" data-toggle="modal" data-target="#optionModal">
                    <i class="fas fa-cog setting_icon fa-1x"></i></button>
              <div class="pj_folder_in" >
            		<span id="pno" style="display: none;">${project.pno}</span>
                    <h5>${project.ptitle}</h5>
                    <p>${project.psummary}</p>
                    <div class="progress_area">
                      <small>진행률</small>
                      <div class="progress">
                        <div class="progress-bar bg-success" role="progressbar" 
                        style="width: 75%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">75%</div>
                      </div>
                      <p>AA님 외 N명 참여중</p>
                    </div>       
              </div>
            </div>
            </c:if>
            
            <c:if test="${project.plevel<1}">
              <div class="pj_folder" style="background: rgb(252, 247, 204);">
                  <button type="button"  class="optionBtn btn btn-link" data-toggle="modal" data-target="#optionModal">
                    <i class="fas fa-cog setting_icon fa-1x"></i></button>
                  <div class="pj_folder_in">
                  		<span id="pno" style="display: none;">${project.pno}</span>
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
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">프로젝트 생성</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <div style="position: relative; height:160px;">
                            <div class="form-group col-md-4" style="border: 0px solid black; display: inline-block; position: absolute; left: 30px; padding-top: 10px">
                              <label for="recipient-name" class="form-control-label">진행률</label>
                              <p class="btn btn-light" style="width: 100px; height: 100px; border-radius: 70px; line-height: 80px;font-weight: 600;font-size: 30px; cursor:default; ">
                                60<small>%</small>
                              </p>
                            </div>
                         
                          <div class="form-group col-md-6" style="border: 0px solid black; background-color: rgb(245, 245, 245); display: inline-block; position: absolute; right: 30px; padding: 5px">
                            <label for="message-text" class="form-control-label">목표단계</label>
                            <div class="checkLevel" style="text-align: left; padding-left: 8px">
                              <input type="checkbox" name="levelCk" value="ck1" id="ck1">
                              <label for="ck1">목표 설정 1</label><br>
                              <input type="checkbox" name="levelCk" value="ck2" id="ck2">
                              <label for="ck2">목표 설정 2</label><br>
                              <input type="checkbox" name="levelCk" value="ck3" id="ck3">
                              <label for="ck3">목표 설정 3</label><br>
                              <input type="checkbox" name="levelCk" value="ck4" id="ck4">
                              <label for="ck4">목표 설정 4</label><br>
                              <input type="checkbox" name="levelCk" value="ck5" id="ck5">
                              <label for="ck5">목표 설정 5</label>
                            </div>
                          </div>
                        </div>                  
                          <hr>
                          <div style="text-align: left">
                            <small>프로젝트 명</small>
                            <h4>프로젝트 테스트 1</h4>
                            <small>프로젝트 개요</small> 
                            <p>전인 유소년에게서 구하지 못할 바이며 시들어 가는 노년에게서 구하지 못할 바이며 오직 우리 청춘에서만 구할 수 있는 것이다</p>                           
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-light btn-sm updateModal" data-toggle="modal" data-target="#updateModal">수정</button>
                          <button type="button" class="btn btn-sm" style="background-color: coral; color: white" data-dismiss="modal">확인</button>
                        </div>
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
                  <div class="modal-body" style="text-align: left">
                    <form>
                      <div class="form-group">
                        <label for="recipient-name" class="form-control-label">프로젝트 명</label>
                        <input type="text" class="form-control" id="recipient-name">
                      </div>
                      <div class="form-group">
                        <label for="message-text" class="form-control-label">프로젝트 개요</label>
                        <textarea class="form-control" id="message-text" style="resize: none;"></textarea>
                      </div>                  
                        <a href="#" class="addLevel" style="color:#ff7f50; font-weight: 700; font-size: 13px; display: none">프로젝트 단계 설정 추가</a>
                        <a href="#" class="delLevel" style="color: rgb(185, 185, 185); font-weight: 700; font-size: 13px;">프로젝트 단계 설정 취소</a>                        
                        <div class="form-group levelbox" >
                          <hr>
                          <label for="message-text" class="form-control-label">프로젝트 단계설정 (최대 5단계)</label>
                          <input type="text" class="form-control" style="width: 70% !important; display: inline-block; margin-bottom: 5px;">
                          <button type="button" class="btn plusbtn btn-light">+</button>

                          <input type="text" class="form-control" style="width: 70% !important; display: inline-block; margin-bottom: 5px;">
                          <button type="button" class="btn plusbtn btn-light">+</button>

                          <input type="text" class="form-control" style="width: 70% !important; display: inline-block; margin-bottom: 5px;">
                          <button type="button" class="btn plusbtn btn-light">+</button>

                          <input type="text" class="form-control" style="width: 70% !important; display: inline-block; margin-bottom: 5px;">
                          <button type="button" class="btn plusbtn btn-light">+</button>

                          <input type="text" class="form-control" style="width: 70% !important; display: inline-block; margin-bottom: 5px;">
                          <button type="button" class="btn minusbtn btn-light">-</button>
                        </div>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-light btn-sm" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-sm" style="background-color: coral; color: white">수정</button>
                  </div>
                </div>
              </div>
            </div>

        </div>
        <!-- /.container-fluid -->

        
      </div>
      <!-- /.content-wrapper -->
      
    </div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>
	
	$(function(){
		
		
		$("#proejctEnrollFrm .btn-send").on("click",function(){
			//파라미터를 post방식으로 전송 -> message body에 씀
			//json문자열로 처리해야 컨트롤러에서 @RequestBody가 처리함(HttpMessageConverter에 의해 커맨트객체 매핑)
			//ajax요청 필수속성  => contentType: 'application/json; charset=utf-8' 
			
			var param = {};
			param.ptitle = $("#proejctEnrollFrm [name=ptitle]").val();

			param.psummary = $("#proejctEnrollFrm [name=psummary]").val();
			param.pmmno =$(".headerMno").text();

			var jsonStr = JSON.stringify(param);
			console.log(jsonStr);
			
			$.ajax({
	            url  : "${pageContext.request.contextPath}/project/projectMain",
	            data : jsonStr,
	            dataType: "json",
	            contentType: 'application/json; charset=utf-8',
	            type : "post",
	            success : function(data){
	                console.log(data);
	                
	               
	            },
	            error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
	            }
	        });
			 location.reload();
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
        });
        $(".delLevel").click(function(){
          $(".addLevel").show();
          $(".delLevel").hide();  
          $(".levelbox").hide();  
        });
        $(".updateModal").click(function(){
            $("#updateModal").modal('show'); 
            $("#optionModal").modal('hide');
          });
      });

      // level checkBox 
      $(document).ready(function() { 
          $("input:checkbox").on('click', function() {
              if ( $(this).prop('checked') ) {
                    $(this).next().addClass("selected");
                    
              } else { $(this).next().removeClass("selected");
              } 
          }); 
      });
	</script>
</body>

</html>