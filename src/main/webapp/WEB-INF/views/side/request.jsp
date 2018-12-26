<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Final</title>
    <!-- meta tags 필요 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
    
    <!-- Select 2 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    
    <!-- Fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" >
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<style>
    .request_title {
        font-weight: bold;
        border : 1px solid #fbfbfb;
        width : 100%;
    }
    button {
        margin-left: auto;
        margin-right: auto;
    }
    .datepicker {
    	width : 180px;
    }

</style>

</head>
<body>

 <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
        스케줄 요청
      </button>
      
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
                             		
                                    <c:forEach items="${member}" var="member" varStatus="status">
                                        <option value="${member.nickName}">${member.nickName} </option>
                                     </c:forEach>
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
      
    
        

         <!-- Optional JavaScript -->
    <!-- 먼저 jQuery가 오고 그 다음 Popper.js 그 다음 Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
   
   
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    


    <script>
            // select2 
            $(function() {
            $('.member-multiple').select2({
                    placeholder: '함께할 인원을 선택하세요.'
                    }); 
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
            
            
            
            
			
           
            
    
    </script>

</body>

</html>