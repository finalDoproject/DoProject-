<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>채팅방</title>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/chat.css">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<script src="https://use.fontawesome.com/1c6f725ec5.js"></script>
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
					<div>
						<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
							alt="profilpicture" style="float: left;">
						<div class="chat-bubble you" style="float: left;">
							<!-- <div class="your-mouth"></div> -->
							<div class="content">그럼 수고하세요.</div>
							<div class="time">17:39</div>
						</div>
					</div>
					<div style="clear: both;"></div>
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
						<div class="content">네 저도 반갑습니다네 저도 반갑습니다네 저도 반갑습니다네 저도
							반갑습니다네 저도 반갑습니다네 저도 반갑습니다네 저도 반갑습니다네 저도 반갑습니다</div>
						<div class="time">17:38</div>
					</div>
					<div style="clear: both;"></div>
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
				</div>
				<div class="information"></div>
			</div>
			<!-- 메시지 입력 화면 -->
			<div class="wrap-message">
				<div class="message">
					<textarea class="input-message" name="chatContent" id="chatContent"
						cols="30" rows="10" onkeydown="keyDown()" placeholder="내용을 입력해주세요"
						style="resize: none;"></textarea>
				</div>
				<i class="fa fa-paper-plane" aria-hidden="true" id="submit"
					onclick="submitMsg();"></i>
			</div>
		</section>
	</div>
	<script>
		$(window).load(function(){
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

        function keyDown() {
            var date = formatAMPM(new Date());

            if (event.shiftKey && event.keyCode == 13) {
            } else if (event.keyCode == 13) {
                inputMsg();
            }
        }

        function submitMsg() {
            inputMsg();            
            $('#chatContent').focus();
        }
        
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
</body>
</html>