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
		#status {
		    border: 3px dashed black
		}
		
		.schedule {
		
		margin-left : auto;
		margin-right : auto;
		width : 100%;
		height : 75%;
		border : 5px solid black;
		
		}
		
		button {
		
		margin-left : auto;
		margin-right : auto;
		}
</style>

</head>
<body>

    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
    스케줄 매칭 하기
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
            <table class="table table-bordered schedule">
                <thead>
                    <tr >
                        <th></th>
                        <th>일</th>
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                        <th>토</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>9</th>
                        <th id="1" class="select"></th>
                        <th id="16" class="select"></th>
                        <th id="31" class="select"></th>
                        <th id="46" class="select"></th>
                        <th id="61" class="select"></th>
                        <th id="76" class="select"></th>
                        <th id="91" class="select"></th>
                    </tr>
                    <tr>
                         <th>10</th>
                         <th id="2" class="select"></th>
                         <th id="17" class="select"></th>
                         <th id="32" class="select"></th>
                         <th id="47" class="select"></th>
                         <th id="62" class="select"></th>
                         <th id="77" class="select"></th>
                         <th id="92" class="select"></th>
                    </tr>
                    <tr>
                          <th>11</th>
                          <th id="3" class="select"></th>
                          <th id="18" class="select"></th>
                          <th id="33" class="select"></th>
                          <th id="48" class="select"></th>
                          <th id="63" class="select"></th>
                          <th id="78" class="select"></th>
                          <th id="93" class="select"></th>
                    </tr>
                        <tr>
                        <th>12</th>
                        <th id="4" class="select"></th>
                        <th id="19" class="select"></th>
                        <th id="34" class="select"></th>
                        <th id="49" class="select"></th>
                        <th id="64" class="select"></th>
                        <th id="79" class="select"></th>
                        <th id="94" class="select"></th>
                    </tr>
                    <tr>
                            <th>13</th>
                            <th id="5" class="select"></th>
                            <th id="20" class="select"></th>
                            <th id="35" class="select"></th>
                            <th id="50" class="select"></th>
                            <th id="65" class="select"></th>
                            <th id="80" class="select"></th>
                            <th id="95" class="select"></th>
                    </tr>
                    <tr>
                            <th>14</th>
                            <th id="6" class="select"></th>
                            <th id="21" class="select"></th>
                            <th id="36" class="select"></th>
                            <th id="51" class="select"></th>
                            <th id="66" class="select"></th>
                            <th id="81" class="select"></th>
                            <th id="96" class="select"></th>
                    </tr>
                    <tr>
                            <th>15</th>
                            <th id="7" class="select"></th>
                            <th id="22" class="select"></th>
                            <th id="37" class="select"></th>
                            <th id="52" class="select"></th>
                            <th id="67" class="select"></th>
                            <th id="82" class="select"></th>
                            <th id="97" class="select"></th>
                    </tr>
                    <tr>
                            <th>16</th>
                            <th id="8" class="select"></th>
                            <th id="23" class="select"></th>
                            <th id="38" class="select"></th>
                            <th id="53" class="select"></th>
                            <th id="68" class="select"></th>
                            <th id="83" class="select"></th>
                            <th id="98" class="select"></th>
                    </tr>
                    <tr>
                            <th>17</th>
                            <th id="9" class="select"></th>
                            <th id="24" class="select"></th>
                            <th id="39" class="select"></th>
                            <th id="54" class="select"></th>
                            <th id="69" class="select"></th>
                            <th id="84" class="select"></th>
                            <th id="99" class="select"></th>
                    </tr>
                    <tr>
                            <th>18</th>
                            <th id="10" class="select"></th>
                            <th id="25" class="select"></th>
                            <th id="40" class="select"></th>
                            <th id="55" class="select"></th>
                            <th id="70" class="select"></th>
                            <th id="85" class="select"></th>
                            <th id="100" class="select"></th>
                    </tr>
                    <tr>
                            <th>19</th>
                            <th id="11" class="select"></th>
                            <th id="26" class="select"></th>
                            <th id="41" class="select"></th>
                            <th id="56" class="select"></th>
                            <th id="71" class="select"></th>
                            <th id="86" class="select"></th>
                            <th id="101" class="select"></th>
                    </tr>
                    <tr>
                            <th>20</th>
                            <th id="12" class="select"></th>
                            <th id="27" class="select"></th>
                            <th id="42" class="select"></th>
                            <th id="57" class="select"></th>
                            <th id="72" class="select"></th>
                            <th id="87" class="select"></th>
                            <th id="102" class="select"></th>
                    </tr>
                    <tr>
                            <th>21</th>
                            <th id="13" class="select"></th>
                            <th id="28" class="select"></th>
                            <th id="43" class="select"></th>
                            <th id="58" class="select"></th>
                            <th id="73" class="select"></th>
                            <th id="88" class="select"></th>
                            <th id="103" class="select"></th>
                    </tr>
                    <tr>
                            <th>22</th>
                            <th id="14" class="select"></th>
                            <th id="29" class="select"></th>
                            <th id="44" class="select"></th>
                            <th id="59" class="select"></th>
                            <th id="74" class="select"></th>
                            <th id="89" class="select"></th>
                            <th id="104" class="select"></th>
                    </tr>
                    <tr>
                            <th>23</th>
                            <th id="15" class="select"></th>
                            <th id="30" class="select"></th>
                            <th id="45" class="select"></th>
                            <th id="60" class="select"></th>
                            <th id="75" class="select"></th>
                            <th id="90" class="select"></th>
                            <th id="105" class="select"></th>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary">저장</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
   <!-- Optional JavaScript -->
    <!-- 먼저 jQuery가 오고 그 다음 Popper.js 그 다음 Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" ></script>
  
</body>
	

	<!-- select 클릭 시 효과  + 아이디 값 가져오기 -->
    <script>
        $('.select').click(function(){
        	var dtNo = $(this).attr("id");
        	
        	 $.ajax({
             	url : '${pageContext.request.contextPath}/side/matchingDT.do',
             	data : {dtNo : dtNo},
             	dataType : "json",
             	success : function(data) {
             		console.log(data);
             		if(data > 0 ){
             			$('#'+dtNo).css("background-color", "rgb(248, 142, 111)");
             		}
             
             		
             	 },error : function(request, status, error){
          			alert(request + "\n"
          					  + status + "\n"
          					  + error);
             	}
             });
        });
        
        
        
    
    </script>
</html>