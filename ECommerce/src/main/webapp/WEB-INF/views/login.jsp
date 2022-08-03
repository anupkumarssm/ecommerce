<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta name="viewport" content="width=device-width">
</head>
<body>
	<style>
.button {
	font-size: 8px;
	text-align: center;
	cursor: pointer;
	outline: none;
	color: #fff;
	background-color: #4CAF50;
	border: none;
	border-radius: 15px;
	box-shadow: 0 9px #999;
	font-size: 15px;
}

.button:hover {
	background-color: #3e8e41
}

body {
	background-image: url("resources/images/bgimg.jpg");
	background-color: #cccccc;
} 
</style>
	<br>


	<div class="row">
		<div class="col-sm-7"></div>
		<div class="col-sm-5">
			<div class="card " style="background-color: #ccccff">
				<div class="card-body">

					<ul class="nav nav-pills textstyle">
						<li class="nav-item"><a class="nav-link active button"
							data-toggle="pill" href="#signin">Sign in</a></li>
						<li class="nav-item"><a class="nav-link button"
							data-toggle="pill" href="#signup">Sign up</a></li>
					</ul>
					<hr> 
					<!-- Tab panes -->
					<div class="tab-content textstyle">
						<div class="tab-pane container active" id="signin">
							<h4>Sing in</h4>
							<form action="/login" method="post" class="needs-validation" id="singinForm"
								novalidate>
								<div class="form-group">
									<label for="username">Email</label> <input type="email"
										name="username" class="form-control"
										placeholder="Enter email" autocomplete="off">
								</div>
								<div class="form-group">
									<label for="pwd">Password:</label> <input type="password"
										name="password" class="form-control"
										placeholder="Enter password" id="pwd" autocomplete="off">
								</div>
								<div class="form-group form-check">
									<label class="form-check-label"> <input
										class="form-check-input" type="checkbox"> Remember me
									</label>
								</div>
								<input type="submit"
									class="btn btn-sm btn-info form-control col-sm-4"
									value="Sign in">
							</form>
						</div>
						<div class="tab-pane container fade" id="signup">
							<h4>Sing up</h4>
							<form action="/add-new-user" method="post"
								class="needs-validation" id="singupForm" novalidate>
								<div class="form-group textstyle">
									<label for="username">First name:</label> <input type="text"
										class="form-control" placeholder="Enter First name" name="firstname" autocomplete="off">
								</div>
									<div class="form-group textstyle">
									<label for="username">Last name:</label> <input type="text"
										class="form-control" placeholder="Enter Last name" name="lastname" autocomplete="off">
								</div>
								<div class="form-group textstyle">
									<label for="username">Mobile:</label> <input type="text"
										class="form-control" placeholder="Enter Mobile" name="mobile" autocomplete="off" maxlength="10">
								</div>
								 
								<hr>
								
								<div class="form-group textstyle">
									<label for="username">Email:</label> <input type="email"
										class="form-control" placeholder="Enter Email" name="username" id="username" autocomplete="off">
								</div>
								<div class="form-group textstyle">
									<label for="pwd">Password:</label> <input type="password"
										class="form-control" placeholder="Enter Password" name="password" autocomplete="off">
								</div> 
								<div class="form-group form-check textstyle">
									<label class="form-check-label"> <input
										class="form-check-input" type="checkbox"> Remember me
									</label>
								</div> 
								<input type="submit"
									class="btn btn-sm btn-info form-control col-sm-4"
									value="Sign up">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<link rel="stylesheet" href="resources/css/bootstrapValidator.min.css" />
		<script type="text/javascript" src="resources/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
var status='${status}'; 
if(status == '1'){
	$.notify("You have successfully created.", "success");
}

$("#username").keyup(function(){ 
	  $.ajax({url: "validateUserName?username="+$(this).val(), success: function(data){
		  if(data == '1'){
			  $.notify("Email Already Exists..", "error");
			  $("#username").val('');
			 }
  }});
	 
	});
	
	
	
$('#singupForm')
.bootstrapValidator(
		{
			fields : {
				firstname : {
					validators : {
						notEmpty : {
							message : '<div class="text-center text-danger">First name is required and cannot be empty</div>'
						},
					}
				},lastname : {
					validators : {
						notEmpty : {
							message : '<div class="text-center text-danger">Last name is required and cannot be empty</div>'
						},
					}
				},mobile : {
					validators : {
						digits: {
                        message: '<div class="text-center text-danger">The phone number can contain digits only</div>'
                    },
						notEmpty : {
							message : '<div class="text-center text-danger">Mobile is required and cannot be empty</div>'
						},
					}
				},username : { 
					 validators: { emailAddress: {
						  message: '<div class="text-center text-danger"> Email is not a valid.</div>'
	                    },
					        notEmpty: {
					          message: '<div class="text-center text-danger">Email is required and cannot be empty</div>'
					        },
					        regexp: {
					          regexp: '^[^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
					          message: '<div class="text-center text-danger"></div>'
					        }
					      }
				},password : {
					validators : {
						notEmpty : {
							message : '<div class="text-center text-danger">Password is required and cannot be empty</div>'
						},
					}
				}
			}
		});
		
		
$('#singinForm')
.bootstrapValidator(
		{
			fields : { username : { 
					 validators: { emailAddress: {
						  message: '<div class="text-center text-danger"> Email is not a valid.</div>'
	                    },
					        notEmpty: {
					          message: '<div class="text-center text-danger">Email is required and cannot be empty</div>'
					        },
					        regexp: {
					          regexp: '^[^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
					          message: '<div class="text-center text-danger"> </div>'
					        }
					      }
				},password : {
					validators : {
						notEmpty : {
							message : '<div class="text-center text-danger">Password is required and cannot be empty</div>'
						},
					}
				}
			}
		});

});


</script>
</body>
</html>