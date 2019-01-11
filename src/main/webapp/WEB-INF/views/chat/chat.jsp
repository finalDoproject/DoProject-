<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>채팅방</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- cnd방식으로 sockjs불러오기 -->
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/chat.css">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<script>

$(document).ready(function(){
	chatPtm($("#mno").text(), $("#pno").text());
});
var sock;
//웹소켓 객체 생성하기
sock=new SockJS("<c:url value='/chat'/>");
sock.onopen=onOpen;
sock.onmessage=onMessage;
sock.onclose=onClose;
var today=null;
var chatYou = "";
var chatMe = "";

$(function(){
	// 전송 아이콘 클릭하거나 엔터키를 눌렀을 때 웹소켓으로 데이터 전송,
	// shift + enter는 줄바꿈, 메시지 전송한 후 스크롤 최하단으로 이동
	$("#submit").click(function(){
		sendMessage();
		$("#chatContent").val('');
	    $("#chatList").scrollTop($("#chatList")[0].scrollHeight);
	});
	$("#chatContent").keyup(function(event){
		if (event.shiftKey && event.keyCode == 13) {
	    } else if (event.keyCode == 13) {
	    	sendMessage();
			$("#chatContent").val('');
		    $("#chatList").scrollTop($("#chatList")[0].scrollHeight);
	    }
	});
});

function sendMessage(){
	// 웹소켓을 컨트롤하기위해 채팅방 번호를 : 구분자로, 메시지와는 _ 구분자로 전달
	sock.send(chatYou+":"+chatMe+"_"+$("#chatContent").val());
	$("#chatContent").focus();
};

function onOpen(){
}

function onMessage(evt){
	var data=evt.data;//new text객체로 보내준 값을 받아옴.
	var host=null;//메세지를 보낸 사용자 ip저장
	var strArray=data.split("|");//데이터 파싱처리하기
	var userName=null;//대화명 저장
	var you=null; // 채팅방(프로젝트 번호 또는 1:1 채팅 상대 번호)
	var me=null; // 채팅방(내 번호)
	
	if(strArray.length>1)
	{
		sessionId=strArray[0]; // 세션 ID
		message=strArray[1]; // 메시지
		host=strArray[2].substr(1,strArray[2].indexOf(":")-1);
		userName=strArray[3]; // 
		you=strArray[4];
		me=strArray[5];
		today=new Date();
		
		if(userName == $("#nickName").text())
		{
			if(($("#chatMe").text() == me+"_"+you)){
				var printHTML="<div style='clear:both;'></div>";
				printHTML+="<div class='chat-bubble me' id='myChat'>";
				printHTML+="<div class='content' id='content' style='word-break:break-all;'>";
				printHTML+=ConvertSystemSourcetoHtml(message);
				printHTML+="</div><div class='time'>";
				printHTML+=sockformatAMPM(today)+"</div></div>";
				$('#chatList').append(printHTML);
				$("#chatList").scrollTop($("#chatList")[0].scrollHeight);
			}
		}
		else{
			// if조건으로 현재 있는 방에만 출력$("#chatMe").text(me+"_"+you);
			if(($("#chatMe").text() == you+"_"+me) || you.charAt(0) == 0){
				var printHTML="<div><img src='resources/images/profile/" + $("#renamedFileName").text() + "' alt='profilpicture' style='float: left;'>";
				printHTML+="<div class='chat-bubble you' style='float: left;'>";
				printHTML+="<div class='content'>";
				printHTML+=ConvertSystemSourcetoHtml(message);
				printHTML+="</div><div class='time'>";
				printHTML+=sockformatAMPM(today)+"</div></div></div>";
				printHTML+="<div style='clear: both;'></div>";
				$('#chatList').append(printHTML);
				$("#chatList").scrollTop($("#chatList")[0].scrollHeight);
			}
		}

	}
	
};

$(".contact").click(function(){
	sock.close();
});

function onClose(evt){
};
$(document).ready(function(){
	window.addEventListener('resize', resizeTest);
	
	function resizeTest(){
		if($(window).width() < 800 || $(window).height() < 600){
			window.resizeTo(800,600);
		}
	}

	$("#chatList").scrollTop($("#chatList")[0].scrollHeight);
});

function sockformatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}

function formatAMPM(hour, minute) {
    var hours = hour;
    var minutes = minute;
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}

function ConvertSystemSourcetoHtml(str){
	 str = str.replace(/</g,"&lt;");
	 str = str.replace(/>/g,"&gt;");
	 str = str.replace(/\"/g,"&quot;");
	 str = str.replace(/\'/g,"&#39;");
	 str = str.replace(/\n/g,"<br />");
	 return str;
}

function dateDiff(_date1, _date2) {
    var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
    var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);
 
    diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
 
    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));
 
    return diff;
}

function chatMtm(me, you, yourNick){
	/* location.href = "/chatOne.ch?pno="+$("#pno").text()+"&chWriter="+me+"&chReader="+you; */
	$("#chatContent").val('');
	$("#chatContent").focus();
	$("#chatNickName").text(yourNick);
	$("#chatMe").text(me+"_"+you);
	$("#chatMe").text();
	/* console.log($("#chatMe").text()); */
	chatYou = you;
	chatMe = me;
	$.ajax({
		url : "${pageContext.request.contextPath}/chatOne.ch?me="+me+"&you="+you,
		type : "GET",
		data : { "chWriter" : me, "chReader" : you, "pno" : $("#pno").text()},
		success : function(responseData){
			var data = responseData.chatOneList;
			var yourRenamedFileName = responseData.renamedFileName;
			
			if(data.length == 0){
				$("#thisImg").attr("src", "resources/images/profile/" + yourRenamedFileName);
				$("#chatList").empty();
			} else {
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth()+1;
				var yyyy = today.getFullYear();
				if(dd<10){ dd = '0'+dd }
				if(mm<10){ mm = '0'+mm }
				today = yyyy + '-' + mm + '-' + dd;
				
				$("#chatList").empty();
				for(var i = 0; i < data.length; i++){
					var chatDay = (data[i].chDate.year+1900) + '-' + (data[i].chDate.month+1) + '-' + (data[i].chDate.date);
					if(data[i].chWriter == me)
					{
						$("#thisImg").attr("src", "resources/images/profile/" + data[i].renamedFileName);
						var printHTML="<div style='clear:both;'></div>";
						printHTML+="<div class='chat-bubble me' id='myChat'>";
						printHTML+="<div class='content' id='content' style='word-break:break-all;'>";
						printHTML+=ConvertSystemSourcetoHtml(data[i].chContent);
						printHTML+="</div><div class='time'>";
						if(dateDiff(chatDay, today) == 0){
							printHTML+=formatAMPM(data[i].chDate.hours, data[i].chDate.minutes)+"</div></div>";
						} else {
							printHTML+=dateDiff(chatDay, today)+"일 전</div></div>";
						}
						$('#chatList').append(printHTML);
						$("#chatList").scrollTop($("#chatList")[0].scrollHeight);
					}
					else{
						$("#thisImg").attr("src", "resources/images/profile/" + data[i].renamedFileName);
						var printHTML="<div><img src='resources/images/profile/" + data[i].renamedFileName + "' alt='profilpicture' style='float: left;'>";
						printHTML+="<div class='chat-bubble you' style='float: left;'>";
						printHTML+="<div class='content'>";
						printHTML+=ConvertSystemSourcetoHtml(data[i].chContent);
						printHTML+="</div><div class='time'>";
						if(dateDiff(chatDay, today) == 0){
							printHTML+=formatAMPM(data[i].chDate.hours, data[i].chDate.minutes)+"</div></div></div>";
						} else {
							printHTML+=dateDiff(chatDay, today)+"일 전</div></div>";
						}
						printHTML+="<div style='clear: both;'></div>";
						$('#chatList').append(printHTML);
						$("#chatList").scrollTop($("#chatList")[0].scrollHeight);						
					}
				}
			}
		}
	});
}

function chatPtm(me, pno){
	$("#chatContent").val('');
	$("#chatContent").focus();
	$("#chatNickName").text($("#ptitle").text());
	$("#chatMe").text(me+"_"+"0"+pno);
	$("#chatMe").text();
	$("#thisImg").attr("src", "resources/images/profile/dope2.png");
	/* console.log($("#chatMe").text()); */
	chatYou = "0"+pno;
	chatMe = me;
	$.ajax({
		url : "${pageContext.request.contextPath}/chatProject.ch",
		type : "GET",
		data : { "pno" : pno },
		success : function(responseData){
			var data = responseData.chatProjectList;
			if(data.length == 0){
				$("#chatList").empty();
			} else {
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth()+1;
				var yyyy = today.getFullYear();
				if(dd<10){ dd = '0'+dd }
				if(mm<10){ mm = '0'+mm }
				today = yyyy + '-' + mm + '-' + dd;
				
				$("#chatList").empty();
				for(var i = 0; i < data.length; i++){
					var chatDay = (data[i].chDate.year+1900) + '-' + (data[i].chDate.month+1) + '-' + (data[i].chDate.date);
					if(data[i].chWriter == me)
					{
						var printHTML="<div style='clear:both;'></div>";
						printHTML+="<div class='chat-bubble me' id='myChat'>";
						printHTML+="<div class='content' id='content' style='word-break:break-all;'>";
						printHTML+=ConvertSystemSourcetoHtml(data[i].chContent);
						printHTML+="</div><div class='time'>";
						if(dateDiff(chatDay, today) == 0){
							printHTML+=formatAMPM(data[i].chDate.hours, data[i].chDate.minutes)+"</div></div>";
						} else {
							printHTML+=dateDiff(chatDay, today)+"일 전</div></div>";
						}
						$('#chatList').append(printHTML);
						$("#chatList").scrollTop($("#chatList")[0].scrollHeight);
					}
					else{
						var printHTML="<div><img src='resources/images/profile/" + data[i].renamedFileName + "' alt='profilpicture' style='float: left;'>";
						printHTML+="<div class='chat-bubble you' style='float: left;'>";
						printHTML+="<div class='content'>";
						printHTML+=ConvertSystemSourcetoHtml(data[i].chContent);
						printHTML+="</div><div class='time'>";
						if(dateDiff(chatDay, today) == 0){
							printHTML+=formatAMPM(data[i].chDate.hours, data[i].chDate.minutes)+"</div></div></div>";
						} else {
							printHTML+=dateDiff(chatDay, today)+"일 전</div></div>";
						}
						printHTML+="<div style='clear: both;'></div>";
						$('#chatList').append(printHTML);
						$("#chatList").scrollTop($("#chatList")[0].scrollHeight);						
					}
				}
			}
		}
	});
}

function chatTime() {
	$.ajax({
		url : "${pageContext.request.contextPath}/chatTime.ch",
		type : "GET",
		data : { "roomName" : $('#searchRoom').val() },
		success : function(data){
			console.log(data);
		},
		error : function(data){
			console.log("검색 결과 없음 : " + data);
		}
    });
}
</script>
</head>

<body>
	<%-- <div style="display:none;" id="chReader">${chReader}</div> --%>
	<div style="display:none;" id="chatMe"></div> 
	<div style="display:none;" id="mno">${member.mno}</div>
	<div style="display:none;" id="userId">${member.userId}</div>
	<div style="display:none;" id="password">${member.password}</div>
	<div style="display:none;" id="email">${member.email}</div>
	<div style="display:none;" id="nickName">${member.nickName}</div>
	<div style="display:none;" id="mCondition">${member.mCondition}</div>
	<div style="display:none;" id="mDate">${member.mDate}</div>
	<div style="display:none;" id="mProfile">${member.mProfile}</div>
	<div style="display:none;" id="renamedFileName">${member.renamedFileName}</div>
	<div style="display:none;" id="pno">${project.pno}</div>
	<div style="display:none;" id="ptitle">${project.ptitle}</div>
	<div class="wrap">
		<section class="left" style="background: #f98d70">
			<!-- 대화방 검색 -->
			<div class="profile" style="height:60px;">
				<span style="margin-left:15%; display:table-cell; line-height:60px; color:white; font-size:25px; vertical-align:middle;"><b>DOPE</b> <small>Do Project!</small></span>
			</div>
			<hr />
			<!-- 참여자 리스트 화면 -->
			<div class="contact-list">
				<!-- 프로젝트 단체방 -->
				<div class="contact" onclick="chatPtm(${member.mno}, ${project.pno});">
					<img src="resources/images/profile/dope2.png" alt="logo">
					<div class="contact-preview">
						<div class="contact-text" style="margin-top:10%;">
							<h1 class="font-name">${project.ptitle}</h1>
						</div>
					</div>
					<div class="contact-time">
						<p>1주 전</p>
					</div>
				</div>
				<c:forEach items="${secondList}" var="sl">
						<c:if test="${sl.mno ne member.mno}">
							<div class="contact" onclick="chatMtm(${member.mno}, ${sl.mno}, '${sl.nickName}');">
								<img src="resources/images/profile/${sl.renamedFileName}" alt="profilpicture">
								<div class="contact-preview">
									<div class="contact-text" style="margin-top:10%;">
										<h1 class="font-name">${sl.nickName}</h1>
									</div>
								</div>
								<div class="contact-time">
								<p>10:00</p>
								</div>
							</div>
						</c:if>
				</c:forEach>
			</div>
		</section>

		<section class="right">
			<div class="chat-head" id="chatHead">
				<img src="resources/images/profile/default.png" id="thisImg"
					alt="profilpicture">
				<div class="chat-name">
					<h1 class="font-name" id="chatNickName"></h1>
				</div>
			</div>
			<hr />
			<div class="wrap-chat">
				<!-- 채팅 내용 화면 -->
				<div class="chat" id="chatList">
				</div>
				<div class="information"></div>
			</div>
			<!-- 메시지 입력 화면 -->
			<div class="wrap-message">
				<div class="message">
					<textarea class="input-message" name="chatContent" id="chatContent"
						cols="30" rows="10" placeholder="메시지를 입력하세요.&#13;&#10;(Enter로 전달, Shift-Enter로 줄바꿈)"
						style="resize: none;"></textarea>
				</div>
				<i class="fa fa-paper-plane" aria-hidden="true" id="submit"></i>
			</div>
		</section>
	</div>
</body>
</html>