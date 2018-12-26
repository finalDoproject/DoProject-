<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>채팅방</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- cnd방식으로 sockjs불러오기 -->
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/chat.css">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<script src="https://use.fontawesome.com/1c6f725ec5.js"></script>
<script>

$(document).ready(function(){
	window.addEventListener('resize', resizeTest);
	
	function resizeTest(){
		if($(window).width() < 800 || $(window).height() < 600){
			window.resizeTo(800,600);
		}
	}
	
	$("#chatList").scrollTop($("#chatList")[0].scrollHeight);
});

function formatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}

var sock=new SockJS("<c:url value='/chat'/>");
sock.onmessage=onMessage;
sock.onclose=onClose;
var today=null;

$(function(){
	$("#submit").click(function(){
		sendMessage();
		$("#chatContent").val('');
	    $("#chatList").scrollTop($("#chatList")[0].scrollHeight);
	});
});

function keyUp() {
    if (event.shiftKey && event.keyCode == 13) {
    } else if (event.keyCode == 13) {
    	sendMessage();
		$("#chatContent").val('');
	    $("#chatList").scrollTop($("#chatList")[0].scrollHeight);
    }
}

function sendMessage(){
	sock.send($("#chatContent").val());
};

function onMessage(evt){
	var data=evt.data;//new text객체로 보내준 값을 받아옴.
	var host=null;//메세지를 보낸 사용자 ip저장
	var strArray=data.split("|");//데이터 파싱처리하기
	var userName=null;//대화명 저장
	console.log("data : " + data.split("|")[3].substr(5,4));
	console.log("data : " + data);
	if(strArray.length>1)
	{
		sessionId=strArray[0];
		message=strArray[1];
		host=String(strArray[2]).substr(1,String(strArray[2]).indexOf(":")-1);
		userName=strArray[3];
		today=new Date();
		
		console.log("strArray[0] : " + strArray[0]);
		console.log("strArray[1] : " + strArray[1]);
		console.log("strArray[2] : " + strArray[2]);
		console.log("strArray[3] : " + strArray[3]);

		var ck_host='${host}';
		if(host==ck_host||(host==0&&ck_host.includes('0:0:')))
		{
			var printHTML="<div style='clear:both;'></div>";
			printHTML+="<div class='chat-bubble me' id='myChat'>";
			printHTML+="<div class='content' id='content' style='word-break:break-all;'>";
			printHTML+=ConvertSystemSourcetoHtml(message);
			printHTML+="</div><div class='time'>";
			printHTML+=formatAMPM(today)+"</div></div>";
			$('#chatList').append(printHTML);
		}
		else{
			var printHTML="<div><img src='https://bootdey.com/img/Content/avatar/avatar1.png' alt='profilpicture' style='float: left;'>";
			printHTML+="<div class='chat-bubble you' style='float: left;'>";
			printHTML+="<div class='content'>";
			printHTML+=ConvertSystemSourcetoHtml(message);
			printHTML+="</div><div class='time'>";
			printHTML+=formatAMPM(today)+"</div></div></div>";
			printHTML+="<div style='clear: both;'></div>";
			$('#chatList').append(printHTML);
						
		}

	}
	else
	{
		today=new Date();
		printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
		message=strArray[0];
		var printHTML="<div style='clear:both;'></div>";
		printHTML+="<div class='chat-bubble me' id='myChat'>";
		printHTML+="<div class='content' id='content' style='word-break:break-all;'>";
		printHTML+=ConvertSystemSourcetoHtml(message);
		printHTML+="</div><div class='time'>";
		printHTML+=formatAMPM(today)+"</div></div>";
		$('#chatList').append(printHTML);	
		
	}
};

function onClose(evt){
	location.href='${pageContext.request.contextPath};';
};

function inputMsg(){
	var date = formatAMPM(new Date());

    $("<div style='clear:both;'></div>" + "<div class='chat-bubble me' id='myChat'>" +
        "<div class='content' id='content' style='word-break:break-all;'>" + ConvertSystemSourcetoHtml($('#chatContent').val()) +
        "</div><div class='time'>" + date + "</div></div>"
    ).appendTo($('#chatList'));
    $('#chatContent').val("");
    $("#chatList").scrollTop($("#chatList")[0].scrollHeight);
}

function ConvertSystemSourcetoHtml(str){
	 str = str.replace(/</g,"&lt;");
	 str = str.replace(/>/g,"&gt;");
	 str = str.replace(/\"/g,"&quot;");
	 str = str.replace(/\'/g,"&#39;");
	 str = str.replace(/\n/g,"<br />");
	 return str;
}

function searchRoom() {
    if(('#searchRoom').val() == ""){
        
    } else {

    }
    console.log('Ajax로 DB검색해서 읽어오기, 값이 없으면 모두 보여주기');
}
</script>
</head>

<body>
	<div class="wrap">
		<section class="left" style="background: #f98d70">
			<!-- 대화방 검색 -->
			<div class="profile">
				<div class="search">
					<i class="fa fa-search fa" aria-hidden="true"></i> <input
						type="text" class="input-search" placeholder="대화방을 검색하세요"
						id="searchRoom" name="searchRoom" oninput="searchRoom();">
				</div>
			</div>
			<!-- 참여자 리스트 화면 -->
			<div class="contact-list">
				<!-- 프로젝트 단체방 -->
				<div class="contact" id="1">
					<img src="" alt="logo">
					<div class="contact-preview">
						<div class="contact-text">
							<h1 class="font-name">DOPE</h1>
						</div>
					</div>
					<div class="contact-time">
						<p>1주 전</p>
					</div>
				</div>
				<!-- 프로젝트 참여자 목록 -->
				<div class="contact" id="2">
					<img src="https://bootdey.com/img/Content/avatar/avatar2.png"
						alt="profilpicture">
					<div class="contact-preview">
						<div class="contact-text">
							<h1 class="font-name">이순신</h1>
							<p class="font-preview">온라인</p>
						</div>
					</div>
					<div class="contact-time">
						<p>17:54</p>
					</div>
				</div>
				<div class="contact" id="3">
					<img src="https://bootdey.com/img/Content/avatar/avatar4.png"
						alt="profilpicture">
					<div class="contact-preview">
						<div class="contact-text">
							<h1 class="font-name">김유신</h1>
							<p class="font-preview">온라인</p>
						</div>
					</div>
					<div class="contact-time">
						<p>3일 전</p>
					</div>
				</div>
				<div class="contact" id="4">
					<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
						alt="profilpicture">
					<div class="contact-preview">
						<div class="contact-text">
							<h1 class="font-name">홍길동</h1>
							<p class="font-preview">온라인</p>
						</div>
					</div>
					<div class="contact-time">
						<p>1일 전</p>
					</div>
				</div>
				<div class="contact" id="5">
					<img src="https://bootdey.com/img/Content/avatar/avatar3.png"
						alt="profilpicture">
					<div class="contact-preview">
						<div class="contact-text">
							<h1 class="font-name">신사임당</h1>
							<p class="font-preview">오프라인</p>
						</div>
					</div>
					<div class="contact-time">
						<p>20:11</p>
					</div>
				</div>
			</div>
		</section>

		<section class="right">
			<div class="chat-head">
				<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
					alt="profilpicture">
				<div class="chat-name">
					<h1 class="font-name">홍길동</h1>
					<p class="font-online">온라인</p>
				</div>
			</div>
			<div class="wrap-chat">
				<!-- 채팅 내용 화면 -->
				<div class="chat" id="chatList">
					<div>
						<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
							alt="profilpicture" style="float: left;">
						<div class="chat-bubble you" style="float: left;">
							<!-- <div class="your-mouth"></div> -->
							<div class="content">
								안녕하세요. <br> 만나서 반갑습니다. <br> 저는 홍길동 입니다.
							</div>
							<div class="time">17:24</div>
						</div>
					</div>
					<div style="clear: both;"></div>
					<div class="chat-bubble me" id="myChat">
						<!-- <div class="my-mouth"></div> -->
						<div class="content">네 저도 반갑습니다</div>
						<div class="time">17:38</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="information"></div>
			</div>
			<!-- 메시지 입력 화면 -->
			<div class="wrap-message">
				<div class="message">
					<textarea class="input-message" name="chatContent" id="chatContent"
						cols="30" rows="10" onkeyup="keyUp();" placeholder="내용을 입력해주세요"
						style="resize: none;"></textarea>
				</div>
				<i class="fa fa-paper-plane" aria-hidden="true" id="submit"></i>
			</div>
		</section>
	</div>
</body>
</html>