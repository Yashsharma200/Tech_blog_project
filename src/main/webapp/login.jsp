<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
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

<!-- navbar -->
	<%@include file="normal_Nav.jsp"%>

<main class="d-flex align-items-center primary-background banner-clip-Background" style="height: 80vh">
	<div class="container">
		<div class="row ">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header primary-background text-white text-center" style="height:15vh">
					<span class="fa fa-user-plus fa-2x"></span>
					<br> 
						<p>Login Here</p>
					</div>
					<!-- to display any warning, error, success message in login form above the email id using message object,which is taken by session --> 
					<%
						Message m = (Message)session.getAttribute("msg");
						if(m!=null){
							%>
							<div class="alert <%= m.getCssClass() %> h-25" role="alert">
						  		<%= m.getContent() %>
						 </div>
							<%
							session.removeAttribute("msg");
						}
					%>
					<div class="card-body ">
	 					<form action="LoginServlet" method="Post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> 
								<input type="email" name="email" required="required" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> 
								<input name="password"  required="required" type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<!-- <div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div> -->
							<div class="container text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>

	</div>
</main>


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

	<script src="js/myJs.js" type="text/javascript">
		
	</script>
</body>
</html>