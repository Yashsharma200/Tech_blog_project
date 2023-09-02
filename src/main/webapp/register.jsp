<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/MyCss.css" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.banner-clip-Background {
	clip-path: polygon(50% 0%, 100% 0, 100% 94%, 61% 100%, 27% 91%, 0 95%, 0 0);
}
</style>	
</head>
<body>

	<%@include file="normal_Nav.jsp"%>
	<main class="d-flex align-items-center primary-background p-6 banner-clip-Background" style= " padding-bottom: 100px;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3 ">
					<div class="card">
						<div class="header primary-background  text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span> <br>
							<p>Register Here</p>
						</div>

						<div class="card-body">
							<form action="RegisterServlet" method="post" id="register_form">
								<div class="form-group">
									<label for="user_name">User Name</label> 
									<input name="user_name"type="text" class="form-control" id="user_name"
										aria-describedby="emailHelp" placeholder="Enter User Name"/>
									
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> 
									<input name="user_email" type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> 
									<input name="user_pass" type="password" class="form-control" 
										id="exampleInputPassword1" placeholder="Password">
								</div>
								
								<div class="form-group">
									<label for="gender">Select Gender</label> 
									<input type="radio"id="gender" name="gender" value="male"/> Male
									<input type="radio"id="gender" name="gender" value="female"/> Female
									<input type="radio"id="gender" name="gender" value="other"/> Others
								</div>
								
								<div class="form-group">
									<textarea name="about" class="form-control" id="" rows="5" cols="10" placeholder="Enter something  about yourself"></textarea>
								</div>
								
								<div class="form-check">
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1"> agree terms and condition </label>
								</div>
								<br>
								<div class="container text-center" id="loader" style="display: none;">
								<span class="fa fa-refresh fa-spin fa-4x"></span>
								<h4>Please Wait..</h4>
								</div>
								<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
							</form>

						</div>
						<div class="footer"></div>
					</div>

				</div>
			</div>
		</div>
	</main>



	<!-- Script -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<!-- cdn of SweetAlert -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" type="text/javascript"></script>
	<script src="js/myJs.js" type="text/javascript"></script>
	<script> 
		$(document).ready(function(){
			console.log("load..")
			//on submit of register form this method will invoke 
			$('#register_form').on('submit',function(event){
				event.preventDefault();//it will stop to go the servlet page
				
				let form  = new FormData(this);//creating variable of form which holds all data of form and submit to servlet page 
				 $("#submit-btn").hide();
				$("#loader").show(); 
				
				//send register servlet using by ajax function
				$.ajax({
					url:"RegisterServlet",
					type: 'Post',
					data: form,
					//if form submmited succesfully execute success block otherwise error 
					success: function(data,textStatus,jqXHR){
						console.log(data)
						 $("#submit-btn").show();
						$("#loader").hide(); 
						if(data.trim() === 'done'){
							swal("Registration done successfully.. we are redirecting to login page")//sweetalert
							.then((value) => {
							  	window.location = "login.jsp"
							});
						}
						else
							{
								swal(data);
							}

					},
					error: function(jqXHR, textStatus, errorThrown){
						console.log(jqXHR)
						 $("#submit-btn").show();
						$("#loader").hide(); 
						swal("Something went wrong.. try again")
						
						
					},
					processData: false,
					contentType: false
				});
			});
		});
	</script>
</body>
</html>