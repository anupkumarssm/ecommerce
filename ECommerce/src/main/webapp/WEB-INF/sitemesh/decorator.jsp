
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EDU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0" />

<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/sidemenucss.css">
<link rel="stylesheet" href="resources/css/leaflet.css" />
<link href="resources/css/bootstrap4-toggle.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/bootstrapValidator.min.css" /> 
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/bootbox.min.js"></script>
<script src="resources/js/leaflet.js"></script>
<script src="resources/js/notify.js"></script>
</head>
<style> 
.textstyle {
 color: blue;
}
.shoppingbasket {
  width:40px;
  height:40px; 
  position:absolute;
  top:20px;
  margin-top: -11px;
  right:8%;
}
.basketitems {
  color:#fff;
  font-size:80%;
  background-color:#e74c3c;
  position:absolute;
  top:50%;
  left:50%;
  -webkit-transform:translate(-50%,-90%);
  -moz-transform:translate(-50%,-90%);
  transform:translate(-50%,-90%);
  padding:0 12%;
  border-radius:1000px;
}
.shoppingbasket .top {
  width:60%;
  height:10%;
  border-radius:1000px;
  background-color:#fff;
  position:absolute;
  top:25%;
  left:50%;
  -webkit-transform: translateX(-50%);
  -moz-transform: translateX(-50%);
  transform: translateX(-50%);
}
.shoppingbasket .bottom {
  width:50%;
  height:10%;
  border-radius:1000px;
  background-color:#fff;
  position:absolute;
  bottom:25%;
  left:50%;
  -webkit-transform: translateX(-50%);
  -moz-transform: translateX(-50%);
  transform: translateX(-50%);
}
.shoppingbasket .left {
  width:50%;
  height:10%;
  border-radius:1000px;
  background-color:#fff;
  position:absolute;
  top:45%;
  left:1%;
  -webkit-transform: rotate(80deg);
  -moz-transform: translateX(80deg);
  transform: translateX(80deg);
}
.shoppingbasket .right {
  width:50%;
  height:10%;
  border-radius:1000px;
  background-color:#fff;
  position:absolute;
  top:45%;
  right:1%;
  -webkit-transform: rotate(-80deg);
  -moz-transform: translateX(-80deg);
  transform: translateX(-80deg);
}
</style>
<body class="d-flex flex-column min-vh-100">
 <header>
	<nav class="navbar navbar-expand-lg navbar-primary bg-primary ">
		<a class="navbar-brand" href="home"><img
			src="resources/images/logo.png" height="30px;" width="200px;">
			<b class="text-white">Home</b></a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav w-100"> 
				<sec:authorize access="hasAnyRole('ADMIN')">
					<li class="nav-item"><a class="nav-link text-white" id="categoryLink"
						href="category">Category</a></li>
					<li class="nav-item"><a class="nav-link textstyle text-white"
						href="category-product">Add Product </a></li> 
						 
				</sec:authorize>
<li class="nav-item"><a class="nav-link textstyle text-white"
						href="products">Products </a></li> 
			</ul>
			<sec:authorize access="hasAnyRole('USER','ADMIN')">
			<a href="/cart">
<div class="shoppingbasket"> 
  <div class="top"></div>
  <div class="bottom"></div>
  <div class="left"></div>
  <div class="right"></div>
  <div class="basketitems" id="itemCounts">0</div>
</div>
</a>

			 <a class="nav-itemb" style="color: red;"
						href="${pageContext.request.contextPath}/logout?${_csrf.parameterName}=${_csrf.token}"
						class="text-white"> Logout </a>
			</sec:authorize>
			<sec:authorize access="!hasAnyRole('USER','ADMIN')"> 
					<a href="login" class="nav-itemb text-white"> Login </a>
			 
			</sec:authorize>
		</div>
	</nav>
	 </header>
    <content><div class="container"><sitemesh:write property="body" /></div></content>
    <footer class="mt-auto text-center" style="background: #818896;">

<!-- <div class="wrapper"> 
			<div class="col-sm-12 mb-2">
				<small class="text-white"> © 2020 made with <i
					class="fa fa-heart" style="color: red"></i> by - Anup kumar
				</small>
		</div>
</div> -->
<script type="text/javascript"> 
  $(document).ready(function(){   
	var cartItemCount =   localStorage.getItem("cartItemCount");
	document.getElementById("itemCounts").innerHTML = cartItemCount
  });
  </script>

  <footer id="sticky-footer" class="py-4 text-white-50" style="background: #243e8e">
    <div class="container text-center text-white">
      <strong>© 2020 made with  <i class="fa fa-heart" style="color: red"></i> by - Me</strong>
    </div>
  </footer>


</footer>
 
	<!-- <div class="container" style="margin-top: 10px; margin-bottom: 50px;">
		<sitemesh:write property="body" />
	</div>
	<footer class="text-center fixed-bottom" style="background: #818896;">

		<div class="row">
			<div class="col-sm-12 mb-2">
				<small class="text-white"> © 2020 made with <i class="fa fa-heart" style="color: red"></i> by - Anup kumar
				</small>
			</div>
		</div>
	</footer> -->
</body>
</html>