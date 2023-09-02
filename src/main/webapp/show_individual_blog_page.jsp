<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <!-- Validate user login or not before showing Blog details -->
	<%
	User user = (User) session.getAttribute("currentUser");
	/* if user pointing to null we need to display login page again */
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	
	<%
		int postId = Integer.parseInt(request.getParameter("postId"));
		/* out.println("<h2>PostId::"+ postId+"<h2>"); */
		PostDao pd = new PostDao(ConnectionProvider.getConnection());
		Post post = pd.getPostByPostId(postId);
		if(post == null){
			
		}
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= post.getP_titile()  %></title>
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
	.post-title{
		font-weight: 100;
		font-size: 30px;
	}
	.post-content{
		font-weight: 100;
		font-size: 23px;
	}
	.post-date{
		font-style: italic;
		font-weight: bold;	
	}
	.post-user-info{
		font-size: 20px;
	}
	.row-user{
	border: 1px solid #e2e2e2;
	padding-top: 15px; 
	}
	
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span class="fa fa-home"></span>
			TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="profile.jsp"> <span
						class="fa fa-bell-o"></span> LearnCode <span class="sr-only">(current)</span></a>
				</li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-check-square-o"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementaion</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"> <span
						class="fa fa-address-card-o"></span> Contact
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post"> <span
						class="fa fa-plus-square"></span> Post
				</a></li>

			</ul>


			<ul class="navbar-nav  mr-right">
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#profile-Modal" href="#"> <span
						class="fa fa-user-circle"></span> <%=user.getName()%></a> <!-- taking user name --></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet">
						<span class="fa fa-user-plus"></span> logout
				</a></li>
			</ul>

		</div>
	</nav>
	<!-- end of nav bar -->
	
	<%-- <h2>Going to show single blogs</h2>
	<h1>post id :: <%= post.getPid() %></h1> --%>
	
	<!-- Main Content of body -->
		<div class="container ">
			<div class="row my-2">
				<div class="col-md-7 offset-md-3">
					<div class="card">
						<div class="card-header primary-background text-white">
							<h4 class="post-title"><%= post.getP_titile() %></h4>
						</div>
						<div class="card-body">
						 <img class="card-img-top my-1" src="blog_pics/<%= post.getP_pic()%>" alt="unable to load">
							
							<div class="row my-1 row-user">
								<div class="col-md-8">
									<p class="post-user-info"><a href="#!"><%=user.getName()%></a> has Posted: </p>
								</div>
								<div class="col-md-4">
									<p class="post-date"><%= post.getP_date().toLocalDateTime().toString()%></p>
								</div>
							</div>
							
							<p class="post-content"><%= post.getP_content() %></p>
							<br>
							<br>
							<div class="post-code">
								<pre> <%= post.getP_code()%></pre>
							</div>
						</div>
						
						<div class="footer primary-background text-center">
							<a href="#!" class="btn btn-outline-primary btn-sm bg-light"> <i class="fa fa-thumbs-o-up"> <span>10</span> </i> </a>
							<a href="#!" class="btn btn-outline-primary btn-sm bg-light"> <i class="fa fa-commenting-o"> <span>20</span> </i> </a>
						</div>
					</div>
				</div>
			</div>
		
		</div>
		
	<!-- end main content of body -->
	
		<!-- profile Model -->
	<!--  Button trigger modal

	<!-- Modal -->
	<div class="modal fade " id="profile-Modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background">
					<h5 class="modal-title " id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="profile_pics/<%=user.getProfile()%>" class="img-fluid"
							style="max-width: 130px; border-radius: 50%">
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- //details -->
						<div id="profile-details">
							<table class="table table-striped">

								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status:</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered On:</th>
										<td><%=user.getDateTime()%></td>

									</tr>
								</tbody>
							</table>
						</div>

						<!-- Profile Edit -->
						<div id="profile-edit" style="display: none">
							<h3>Please Edit Carefully</h3>

							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table table-striped">
									<tbody>
										<tr>
											<th scope="row">ID:</th>
											<td><%=user.getId()%></td>
										</tr>

										<tr>
											<th scope="row">Email:</th>
											<td><input type="email" class="form-control"
												name="user_email" value="<%=user.getEmail()%>" /></td>
										</tr>

										<tr>
											<th scope="row">Name:</th>
											<td><input type="text" class="form-control"
												name="user_name" value="<%=user.getName()%>" /></td>
										</tr>

										<tr>
											<th scope="row">Password:</th>
											<td><input type="password" class="form-control"
												name="user_password" value="<%=user.getPassWord()%>" /></td>
										</tr>

										<tr>
											<th scope="row">Gender:</th>
											<td><%=user.getGender().toUpperCase()%></td>
										</tr>
										<tr>
											<th scope="row">About:</th>
											<td><textarea class="form-control" name="user_about"
													rows="2"><%=user.getAbout()%>
												</textarea></td>
										</tr>

										<tr>
											<th scope="row">Select Profile:</th>
											<td><input type="file" class="form-control"
												name="user_image" /></td>
										</tr>
									</tbody>
								</table>

								<div class="container">
									<button class="btn btn-outline-primary" type="submit">Save</button>
								</div>
							</form>
						</div>


						<!-- End profile Edit -->
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="profile-edit-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of profile model -->
	
	<!-- After updating profile this below expression statement execute -->
	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%> h-25" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>
	<!-- end of expression statement -->


	<!-- Do post Model -->

	<!-- 	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModalCenter">Launch demo modal</button> -->

	<!-- Modal -->
	<div class="modal fade" id="add-post" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Provide the
						post details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- action="AddPostServlet" method="post" -->
				<div class="modal-body">
					<form  id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected="selected" disabled="disabled">Select Categories</option>
								<% 
									PostDao postd = new PostDao(ConnectionProvider.getConnection());
									ArrayList<Category> list = postd.getAllCategories();
									for(Category c : list){
										%>
									<option value="<%= c.getId()%>"><%=c.getName() %></option>		
								<%		
									}
								%>
								
								
							</select>
						</div>
						<div class="form-group">
						 <input type="text" class="form-control"
							name="post_title" placeholder="Enter the post title" /> 
						</div>
						<div class="form-group">
						<textarea class="form-control" rows="6" cols=""
							name="post_content_text" placeholder="Enter your content"></textarea>
						</div>
						<div class="form-group">
						<textarea class="form-control" rows="6" cols=""
							name="post_program_text"
							placeholder="Enter your program (if any)"></textarea>
						</div>
						<div class="form-group">
						Select your pic.. <br> <input type="file" name="post_image" />
						</div>
						<div class="container text-center">
							<button class="btn btn-primary" id="save-post-btn" type="submit">Post</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	<!-- end Post Model -->


	<%-- <%= user.getName() %><br>
<%= user.getEmail() %><br>
<%= user.getAbout() %> --%>

	<!-- script code -->
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="js/myJs.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;

			$('#profile-edit-btn').click(function() {
				/* alert("Edit-btn"); */
				if (editStatus == false) {
					$('#profile-details').hide();
					$('#profile-edit').show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$('#profile-details').show();
					$('#profile-edit').hide();
					editStatus = false;
					$(this).text("Edit");
				}
			});
		});
	</script>
	<script >
		$(document).ready(function(){
			$("#add-post-form").on("submit", function(event){
				 event.preventDefault(); 
					console.log("you have clicked on submit..");
				let form = new FormData(this);
				
				//now requesting to server
				$.ajax({
					url: "AddPostServlet",
					type: 'POST',
					data: form,
					success: function(data,textStatus,jqXHR){
						//success
						console.log(data);
						if(data.trim() == 'done'){
							swal("Good job!", "Saved Successfully", "success");
							
						}
						else{
							swal("Error!", "Something Went Wrong try again...", "error");
						}
						/* window.location.reload(); */
					},
					error: function(jqXHR, textStatus,errorThrown){
						//error
						swal("Error!", "Something Went Wrong try again...", "error");
						/* window.location.reload(); */
					},
					processData: false,
					contentType:false
				});
			});
		});
	</script>
	
</body>
</html>