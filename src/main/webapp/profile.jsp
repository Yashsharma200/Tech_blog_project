<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="org.apache.tomcat.dbcp.pool2.impl.PooledSoftReference"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/MyCss.css" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<!-- if login successfully completed then in profile page we need to show username so we taking user object by the session. -->
	<%
	User user = (User) session.getAttribute("currentUser");
	/* if user pointing to null we need to display login page again */
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
	%>

	<%-- <%@include file="normal_Nav.jsp" %> --%>
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
				<li class="nav-item active"><a class="nav-link" href="#"> <span
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

	<!-- start Main Body of Profile page -->
		
		<div class=" container ml-0 mr-0">
			<div class="row mt-4">
				<!-- first col of size 4 -->
				<div class="col-md-4">
				<div class="list-group">
				  <a href="#" onclick="getPost(0,this)" class="rounded c-link list-group-item list-group-item-action active  d-flex justify-content-between align-items-center">
				    All Posts
				    <span class="badge badge-primary badge-pill">14</span>
				  </a>
				  <%
					PostDao postDao = new PostDao(ConnectionProvider.getConnection());
				     ArrayList<Category>list1 = postDao.getAllCategories();
				     for(Category cc: list1){
				  %>
				  <a href="#" onclick="getPost(<%= cc.getId()%>,this)"   class="rounded c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
				  
				  <%
				  } 
				  %>
				</div>
				
				</div>
				<!-- second col of size 8 -->
				<div class="col-md-8">
					<div class="container text-center" id="loader" >
						<i class="fa fa-refresh fa-4x fa-spin">	</i>
						<h3 class="mt-2">Loading...</h3>
					</div>
					
					<div class="container-fluid " id="post-container" >
						
					</div>
				
				</div>
			</div>
		</div>
	
	<!-- End main body of profile page -->

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
	<!-- loading post using ajax -->
	<script type="text/javascript">
		function getPost(catId,currentRefrence){
			
			$('#loader').show();
			$('#post-container').hide();
			$('.c-link').removeClass('active');
			$.ajax({
				url: "load_posts.jsp",
				data: {c_id:catId},
				success: function(data,textStatus,jqXHR){
					//success
					$('#loader').hide();
					$('#post-container').show();
					
					console.log(data);
					$("#loader").hide();
					$("#post-container").html(data);
					$(currentRefrence).addClass('active');
				}
					
			});
		}
		$('document').ready(function(){
			let allRefrence = $('.c-link')[0];
			 getPost(0,allRefrence); 
		});
	</script>
</body>
</html>