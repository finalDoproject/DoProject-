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
</head>
<body>
<br /><br /><br />
<div >
    <div class="container-fluid gedf-wrapper" style="width: 60%;">
        <div >
            <div class=" gedf-main">
			<c:forEach items="${tasklist}" var="task" varStatus="tnum">

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
                            <div>
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        	더보기<i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" href="#">수정하기</a>
                                        <a class="dropdown-item" href="#">삭제</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
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
								console.log(num);
								console.log(level);
								console.log(levelnum);
								
								$(".tLevelSelect").each(function(){
									$(this).prop('disabled', true);
								});
								
								$("#level"+levelnum+level).addClass("selected");
								console.log(levelnum+"앞에는 num 뒤에는 레벨"+level);
							})
							</script>
						</c:if>
							<hr />
							<!-- 3. 시작일 지정 -->
							<c:if test="${task.TSTARTDATE != null}">
							<div class="line" style="display: inline-block;">
								<label class="icon3"><span class="blind" >시작일</span></label>&nbsp; &nbsp;  
								<div >
									<fmt:formatDate value="${task.TSTARTDATE}" pattern="yyyy.MM.dd" />
								</div>
							</div>
							</c:if>
							<!-- 4. 마감일 지정 -->
							&nbsp;~&nbsp; 
							<div class="line"  style="display: inline-block;">
								<label class="icon4" ><span class="blind" >마감일</span></label>
								<div  >
									<fmt:formatDate value="${task.TENDDATE}" pattern="yyyy.MM.dd" />
									
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
				</c:forEach>
               
            </div>
        </div>
    </div>
</div>
</body>
</html>