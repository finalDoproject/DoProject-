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

<style>

body{
	/*  background: url('/semi/resources/img/handsOn.jpg') no-repeat center center fixed;  */
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  font-family:'HelveticaNeue','Arial', sans-serif; 
/*   font-family: 'Muli', sans-serif; */

}

#title{
font-family: 'Muli', sans-serif;
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
	top:46%;
	margin-left:-180px;
	margin-top:-200px;
}
div.form-item{position: relative; display: block; margin-bottom: 40px;}
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


</style>







<meta charset="UTF-8">
<title>login</title>
</head>
<body>



<div id="formWrapper">

<div id="form">
<div class="logo">
<h1 class="text-center head" id="title">Login</h1>
</div>
<form action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
		<div class="form-item">
			<p class="formLabel">아이디</p>
			<input type="text" name="userId" id="userId" class="form-style" autocomplete="off" />
		</div>
		<div class="form-item">
			<p class="formLabel">비밀번호</p>
			<input type="password" name="password" id="password" class="form-style" required="required" />
			<!-- <div class="pw-view"><i class="fa fa-eye"></i></div> -->
			<!--  <p><a href="#" ><small>Forgot Password ?</small></a></p>  -->
			<!-- <p align="center"><a href="#">아이디 찾기</a> &nbsp; <a href="#">비밀번호 찾기</a> &nbsp; <a href="#">회원가입</a></p>  --> 
		</div>

		<div class="form-item">
		<!--  <p class="pull-left"><a href="#"><small>Register</small></a></p>  -->
		 <p align="center"><a href="${pageContext.request.contextPath}/member/toFindId.do">아이디 찾기</a> &nbsp; <a href="${pageContext.request.contextPath}/member/toFindFw.do">비밀번호 찾기</a> &nbsp; <a href="${pageContext.request.contextPath}/member/join.do">회원가입</a></p>

			<br />
		<input type="submit" class="login pull-right" value="Log In">
		<br />
		<!-- <div class="clear-fix"></div> -->
		</div>
</form>
</div>
</div>


<script>

$(document).ready(function(){
	var formInputs = $('input[type="text"],input[type="password"]');
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

</script>


</body>
</html>