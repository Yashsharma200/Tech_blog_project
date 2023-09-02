package com.tech.blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.PicHelper;

@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter pw = resp.getWriter();
		int cid = Integer.parseInt(req.getParameter("cid"));
//		pw.println(cid);
		String pTitle = req.getParameter("post_title");
		String pContent = req.getParameter("post_content_text");
		String pProgram = req.getParameter("post_program_text");
		Part part = req.getPart("post_image");
		String pImage = part.getSubmittedFileName();
//		pw.println(pImage);
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currentUser");  
		Post post = new Post(pTitle, pContent, pProgram, pImage, null, cid, user.getId());
		PostDao postDao = new PostDao(ConnectionProvider.getConnection());
		if(postDao.savePost(post))
		{
			
			if(pImage != "") {
//				String path = req.getRealPath("/")+"profile_pics"+File.separator + pImage;
				String path = "D:\\ADV_Java_Practice\\TechBlog\\src\\main\\webapp\\"+"blog_pics"+File.separator+pImage; 
				PicHelper.savePic(part.getInputStream(), path);	
			}
			pw.println("done");
		}
		else
		{
			pw.println("error");
		}
	}
}
