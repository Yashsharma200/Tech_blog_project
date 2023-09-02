<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<html>
<head>
<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/MyCss.css" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
	.banner-clip-Background{
		clip-path: polygon(50% 0%, 100% 0, 100% 94%, 61% 100%, 27% 91%, 0 95%, 0 0);
	}	
</style>
</head>
<body>
	<!-- navbar -->
	<%@include file="normal_Nav.jsp"%>

	<!-- Banner -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-background text-white banner-clip-Background">
			<div class="container">
				<h3 class="display-3">Welcome to TechBlog</h3>
				<p>As we know, to communicate with a person, we need a specific
					language, similarly to communicate with computers, programmers also
					need a language is called Programming language.</p>

				<p>A programming language is a computer language that is used by
					programmers (developers) to communicate with computers. It is a set
					of instructions written in any specific language ( C, C++, Java,
					Python) to perform a specific task.</p>

				<a href="register.jsp" class="btn btn-outline-light btn-lg" >
					<span class="fa fa-user-plus"></span> SingUp
				</a>
				<a href="login.jsp" class="btn btn-outline-light btn-lg" >
					<span class="fa fa-user-circle fa-spin"></span> Login
				</a>
			</div>
		</div>
	</div>

	<!-- Card -->
	<div class="container">
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card" >
					
					<div class="card-body">
						<h5 class="card-title">Java Programming language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary text-white">Go somewhere</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" >
					
					<div class="card-body">
						<h5 class="card-title">Java Programming language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary text-white">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" >
					
					<div class="card-body">
						<h5 class="card-title">Java Programming language</h5>
						<p class="card-text">Some quick example	e text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary text-white">Go somewhere</a>
					</div>
				</div>
			</div>
		</div>
	</div>

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

	<script src="js/myJs.js" type="text/javascript">
		
	</script>
</body>
</html>
