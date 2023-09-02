
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
<% 

	Thread.sleep(1000);
	PostDao postdao = new PostDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("c_id"));
	List<Post> list = null; 
	if(cid == 0){
		list = 	postdao.getAllPostDetails();
	}
	else{
		list = postdao.getPostByCatId(cid);
	}
	
	if(list.size() == 0)
	{
		out.println("<h3 class='display-3 text-center'>No Posts in this category..<h3>");
		return;
	}
	for(Post p :list){
%>
	<div class="container col-md-6  mt-2 ">
		<div class="card">
			 <img class="card-img-top" src="blog_pics/<%= p.getP_pic()%>" alt="Card image cap">
			<div class="card-body">
				<b> <%= p.getP_titile() %></b>
				<p><%= p.getP_content() %></p>
			<%-- 	<pre><%= p.getP_code() %> </pre> --%>
			</div>
			<div class="card-footer text-center primary-background"> 

				<a href="#!" class="btn btn-outline-primary btn-sm bg-light"> <i class="fa fa-thumbs-o-up"> <span>10</span> </i> </a>
				<a href="show_individual_blog_page.jsp?postId=<%=p.getPid()%>" class="btn btn-outline-primary btn-sm bg-light">Read More...</a>
				<a href="#!" class="btn btn-outline-primary btn-sm bg-light"> <i class="fa fa-commenting-o"> <span>20</span> </i> </a>
					
			</div>
		</div>
	
	</div>
	
	
<%		
}
	
%>
 </div>