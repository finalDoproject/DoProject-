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


#active{
color:#F88E6F;
}

</style>



<meta charset="UTF-8">
<title>search password</title>
</head>
<body>



<div id="formWrapper">

<div id="form">
<div class="logo">
        <ul class="nav nav-tabs">
			<li ><a href=" ">&nbsp;
					ID찾기 &nbsp;</a></li>
			<li class="active"><a href="">비밀번호 찾기</a></li>
			
		</ul>
<h1 class="text-center head" id="title">비밀번호 찾기</h1>

		
</div>

<form id="findPw" name="findPw" action = "findPw.do" method="post">
 		<div class="form-item">
			<p class="formLabel">아이디</p>
			<input type="text" name="userId" id="userId" class="form-style" autocomplete="off"/>
		</div>
		
		<div class="form-item">
			<p class="formLabel">가입시 저장한 이메일주소</p>
			<input type="email" name="email" id="email" class="form-style" autocomplete="off" />
		</div>

		
		<div class="form-item">
		<!--  <p class="pull-left"><a href="#"><small>Register</small></a></p>  -->
		<input type="submit" id="findId" class="login pull-right" value="비밀번호 찾기">
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


$("findId").submit(function(){
	alert("임시 비밀번호가 입력하신 이메일로 전송되었습니다. 임시 비밀번호로 로그인 하신 후 꼭 비밀번호 변경을 하시기 바랍니다.");
});

</script>


</body>
</html>