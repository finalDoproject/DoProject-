<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="https://code.jquery.com/jquery-2.1.0.min.js" ></script>

<link href="https://fonts.googleapis.com/css?family=Muli:900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700" rel="stylesheet">

<style>

body{
	 background: url('/semi/resources/img/handsOn.jpg') no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  font-family:'HelveticaNeue','Arial', sans-serif; 
/*   font-family: 'Muli', sans-serif; */

}

#title{
/* font-family: 'Muli', sans-serif; */
font-family: 'Noto Sans KR', sans-serif;

}

a{color:#F88E6F;text-decoration: none;}
a:hover{color:#aaa; }
.pull-right{float: right;}
.pull-left{float: left;}
.clear-fix{clear:both;}
div.logo{text-align: center; margin: 20px 20px 30px 20px; fill: #566375;}
.head{padding:40px 0px; 10px 0}
.logo-active{fill: #44aacc !important;}
#formWrapper{
	background: rgba(0,0,0,.2); 
	width:100%; 
	height:100%; 
	position: absolute; 
	top:0; 
	left:0;
	transition:all .3s ease;}
.darken-bg{background: rgba(0,0,0,.5) !important; transition:all .3s ease;}

div#form{
	position: absolute;
	width:360px;
	height:320px;
	height:auto;
	/* background-color: rgba(127, 127, 127, 0.51); */
	 background-color: #fff; 
	margin:auto;
	border : 3px solid #fff;
	border-radius: 5px;
	padding:20px;
	left:50%;
	top:47%;
	margin-left:-180px;
	margin-top:-200px;
}
div.form-item{position: relative; display: block; margin-bottom: 36px;}
 input{transition: all .2s ease;}
 input.form-style{
	color:#8a8a8a;
	display: block;
	width: 90%;
	height: 44px;
	padding: 5px 5%;
	border:1px solid #ccc;
	-moz-border-radius: 27px;
	-webkit-border-radius: 27px;
	border-radius: 5px; 
	-moz-background-clip: padding;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	background-color: #fff;
	font-family:'HelveticaNeue','Arial', sans-serif;
	font-size: 105%;
	letter-spacing: .8px;
}
div.form-item .form-style:focus{outline: none; border:1px solid #F88E6F; color:#F88E6F; }
div.form-item p.formLabel {
	position: absolute;
	left:26px;
	top:10px;
	transition:all .4s ease;
	color:#bbb;}
.formTop{top:-22px !important; left:26px;  padding:0 5px; font-size: 14px; color:#F88E6F !important;}
.formStatus{color:#8a8a8a !important;}
input[type="submit"].login{
	float:right;
	width: 112px;
	height: 37px;
	-moz-border-radius: 19px;
	-webkit-border-radius: 19px;
	border-radius:5px;
	-moz-background-clip: padding;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	background-color: #F88E6F;
	border:1px solid #F88E6F;
	border:none;
	color: #fff;
	font-weight: bold;
}
input[type="submit"].login:hover{background-color: #fff; border:1px solid #F88E6F; color:#F88E6F; cursor:pointer;}
input[type="submit"].login:focus{outline: none;}

input[type="radio"]:checked:after {
   background-color: #ffa500;
        
        border: 2px solid #F88E6F;
}




</style>







<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<div id="formWrapper">

<div id="form">
<div class="logo">
        <ul class="nav nav-tabs">
			<li class="active"><a href=" ">&nbsp;
					ID찾기 &nbsp;</a></li>
			<li><a href="">비밀번호 찾기</a></li>
			
		</ul>
<h1 class="text-center head" id="title">ID 찾기</h1>

		
</div>

<form id="findId" name="findId" action = "findId.do" method="post">
 		<div class="form-item">
			<p class="formLabel">이름</p>
			<input type="text" name="nickName" id="nickName" class="form-style" autocomplete="off"/>
		</div>
		
		<div class="form-item">
			<p class="formLabel">이메일 주소</p>
			<input type="email" name="email" id="email" class="form-style" autocomplete="off"/>
		</div>

		
		<div class="form-item">
		<!--  <p class="pull-left"><a href="#"><small>Register</small></a></p>  -->
		<input type="submit" class="login pull-right" value="아이디 찾기">
		<br />
		<!-- <div class="clear-fix"></div>  -->
	    </div>
	
	</form>
	

		
</div>
</div>


<script>

$(document).ready(function(){
	var formInputs = $('input[type="text"],input[type="email"]');
	formInputs.focus(function() {
       $(this).parent().children('p.formLabel').addClass('formTop');
       $('div#formWrapper').addClass('darken-bg');
       $('div.logo').addClass('logo-active');
	});
	formInputs.focusout(function() {
		if ($.trim($(this).val()).length == 0){
		$(this).parent().children('p.formLabel').removeClass('formTop');
		}
		$('div#formWrapper').removeClass('darken-bg');
		$('div.logo').removeClass('logo-active');
	});
	$('p.formLabel').click(function(){
		 $(this).parent().children('.form-style').focus();
	});
});


$(document).on('click','.login pull-right',function(){
	
	var nickName = $("#nickName").val();
	var email = $("#email").val();
	var postData = {'nickName' : nickName, 'email' : email};
	
	$.ajax({
		url: "${pageContext.request.contextPath}/member/findId.do",
		data: postData,
		dataType: "json",
		success:function(data){
			if(data = null){
			    alert("가입 시 작성한 이름과 이메일에 따른 아이디가 존재하지 않습니다. ");
			}else {
				
			alert("가입하신 아이디는"+userId+"입니다.");
			
		}, error : function(jqxhr, textStatus, errorThrown){
            console.log("ajax 처리 실패");
            //에러로그
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
        }
		
	});
	
});
</script>


</body>
</html>