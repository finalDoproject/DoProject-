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
	top:36%;
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

</style>

<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<div id="formWrapper">

<div id="form">
<div class="logo">
<h1 class="text-center head" id="title">회원가입</h1>
</div>

<form id="mbEnrollFrm" name="memberEnroll" action="memberEnroll.do" method="post">
 		
 		<!-- 네임이랑 디비 받아오는 값이랑 맞춰 주기!!브이오랑  -->
 		<div class="form-item">
			<p class="formLabel">아이디</p>
			<!-- <input type="email" name="email" id="email" class="form-style" autocomplete="off" required="required"/> -->
			<input type="text" name="userId" id="userId" class="form-style" autocomplete="off" />
			<span class="idCheckPass"><em>사용가능한 아이디입니다.</em></span>
			<span class="idCheckFail"><em>이미 사용중인 아이디입니다.</em></span>
			<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>	
		</div>
		
		<div class="form-item">
			<p class="formLabel">비밀번호</p>
			<input type="password" name="password" id="password" class="form-style" required="required"/>
			<span class="pwdCheckFail"><em>비밀번호는 숫자, 문자, 특수문자 각각 1개 이상을 포함하여 최소 4글자 입니다.</em></span>
		</div>
		
		<div class="form-item">
			<p class="formLabel">비밀번호 재확인</p>
			<input type="password" id="password2" class="form-style"  />
			<span class="pw2CheckFail"><em>비밀번호를 다시 한 번 확인해주세요.</em></span>
		</div>
		
		<div class="form-item">
			<p class="formLabel">이름</p>
			<input type="text" name="nickName" id="nickName" class="form-style" required="required" />
			
		</div>
		
		<div class="form-item">
			<p class="formLabel">이메일 주소</p>
			<input type="email" name="email" id="email" class="form-style" required="required" />
			<span class="emailDuplicateCheck"><em>이미 사용중인 이메일입니다.</em></span>
			<input type="hidden" name="emailDuplicateCheck" id="emailDuplicateCheck" value="0"/>	
			<br>
		</div>
		
		<div class="form-item">
		<!--  <p class="pull-left"><a href="#"><small>Register</small></a></p>  -->
		<input type="submit" id="sbmComplete" class="login pull-right" value="가입완료">
		<br />
		
	    </div>
	</form>	
</div>
</div>

<script>

$(document).ready(function(){
	
	$(".idCheckPass").hide();
	$(".idCheckFail").hide();
 	$(".pwdCheckFail").hide(); 
	$(".pw2CheckFail").hide();
	$(".emailDuplicateCheck").hide();
	
	var formInputs = $('input[type="text"],input[type="password"],input[type="email"],input[type="radio"]');
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

$(function(){
	
	// id중복검사
	$("#userId").on("keyup",function(){
		
		var userId = $(this).val().trim();
		
	    $.ajax({
            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
            data : {userId:userId},
            dataType: "json",
            success : function(data){
                console.log(data);
                if(data.isUsable==true){ 
                	$(".idCheckFail").hide();
                    $(".idCheckPass").show();
                    $("#idDuplicateCheck").val(1);
                } else {
                	$(".idCheckPass").hide();
                    $(".idCheckFail").show();
                    $("#idDuplicateCheck").val(0);
                }
            }, error : function(jqxhr, textStatus, errorThrown){
                console.log("ajax 처리 실패");
                //에러로그
                console.log(jqxhr);
                console.log(textStatus);
                console.log(errorThrown);
            }
    	});
	});
});

$(function(){
	
	$("#email").on("keyup",function(){
	
	var email = $('#email').val();
	
	$.ajax({
        url  : "${pageContext.request.contextPath}/member/checkEmailDuplicate.do",
        data : {email:email},
        dataType: "json",
        success : function(data){
            console.log(data);
            if(data.isUsable2==true){ 
                $(".emailDuplicateCheck").show();
                $("#emailDuplicateCheck").val(1);
                
            } else {
            	$(".emailDuplicateCheck").hide();
            	$("#emailDuplicateCheck").val(0);
            }
        }, error : function(jqxhr, textStatus, errorThrown){
            console.log("ajax 처리 실패");
            //에러로그
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
         }			
	  });
   });
});

$("#mbEnrollFrm").submit(function(event){
	
		//아이디중복체크여부
	    if($("#idDuplicateCheck").val()==0){
	        alert("사용가능한 아이디를 입력해주세요.");
	        return false;
	    }
		
		var pw  = $('#password').val();
		var pwRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	
		if (!pwRegex.test(pw)) {
    	
			$(".pwdCheckFail").show();
    		return false;
        }
		
		if( pw != $('#password2').val()){
			
			$('.pw2CheckFail').show();
			return false;
		}
		
		/* if($("#emailDuplicateCheck").val()==0){
			return false;
		} */
		
		return true;
	
	/* 
		event.preventDefault();
	 */
	
});
  
</script>


</body>
</html>