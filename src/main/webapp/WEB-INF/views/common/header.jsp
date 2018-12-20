<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- Bootstrap 4 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<!-- Bootstrap core CSS-->
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath }/resources/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="${pageContext.request.contextPath }/resources/css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath }/resources/css/sb-admin.css" rel="stylesheet">
<!-- Logo fonts -->
<link href="https://fonts.googleapis.com/css?family=Exo+2:300i,800i" rel="stylesheet">
</head>
<body id="page-top" >
	<div>
		<nav class="navtop navbar navbar-expand static-top" >
	      <div class="logo_area " style="width: 200px; height: 60px;">
	        <a class="navtop_logo"  href="index.html">
	        	<b style="font-family:'Exo 2', sans-serif; font-size: 26px">DOPE</b>
	        	<small style="font-family:'Exo 2', sans-serif; font-size: 17px">Do Project!</small></a>
	      </div>
	
	     
	
	      <!-- Navbar Search -->
	      <form>
	        <div class="input-group">
	          <div class="input-group-append searchBar_area" >
	            <i class="fas fa-search" style="color: rgba(73, 77, 82, 0.6); margin: 5px 10px;"></i>
	            <input type="text" class="searchBar" placeholder="검색어 입력 후 Enter" aria-label="Search" >
	          </div>
	        </div>
	      </form>
	
	      <!-- Navbar -->
	      <ul class="navbar-nav" style="padding-right: 30px; position: absolute; right: 0;">
	          <li class="nav-item dropdown no-arrow mx-1" style="margin-top: 10px">
	              <a class="nav-link dropdown-toggle goPjview" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
	              target=_blank title="프로젝트 목록보기">
	              <!-- <i class="fas fa-folder" style="color: rgba(248, 143, 111, 0.6)"></i> -->
	              <i class="fas fa-home" style="color: rgba(248, 143, 111, 0.6)"></i>
	              </a>
	            </li>
	        <li class="nav-item dropdown no-arrow mx-1" style="margin-top: 10px">
	          <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <i class="fas fa-bell fa-fw" style="color: rgba(248, 143, 111, 0.6)"></i>
	            <span class="badge badge-danger">9+</span>
	          </a>
	          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
	            <a class="dropdown-item" href="#">Action</a>
	            <a class="dropdown-item" href="#">Another action</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">Something else here</a>
	          </div>
	        </li>
	
	        <li class="nav-item dropdown no-arrow mx-1" style="margin-top: 10px">
	          <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <i class="fas fa-comment fa-fw" style="color: rgba(248, 143, 111, 0.6)"></i>
	            <span class="badge badge-danger">7</span>
	          </a>
	          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
	            <a class="dropdown-item" href="#">Action</a>
	            <a class="dropdown-item" href="#">Another action</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">Something else here</a>
	          </div>
	        </li>
	        <li class="nav-item dropdown no-arrow">
	          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <!-- <i class="fas fa-user-circle fa-fw" style="color: rgba(248, 143, 111, 0.6)"></i> -->
	            <div id="userImg" class="cropcircle"></div>
	          </a>
	          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
	            <a class="dropdown-item" href="#">Settings</a>
	            <a class="dropdown-item" href="#">Activity Log</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
	          </div>
	        </li>
	      </ul>
	    </nav>
	</div>
	


<!-- Bootstrap 4 JavaScript -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath }/resources/js/jquery.easing.min.js"></script>


<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath }/resources/js/sb-admin.min.js"></script>
<script>

	 $('.goPjview').click(function (e) {  
       e.preventDefault();  
       var url = "${pageContext.request.contextPath}/project/projectMain.do";  
       window.open(url, "_self");  
   });  
</script>
</body>
</html>