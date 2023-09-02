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

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.PicHelper;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter pw = resp.getWriter();
//		pw.println("EditServlet");
		String userEmail = req.getParameter("user_email");
		String userName = req.getParameter("user_name");
		String userPass = req.getParameter("user_password");
		String userAbout = req.getParameter("user_about");
		Part part = req.getPart("user_image");
		String imageName = part.getSubmittedFileName();
//		pw.println(imageName);
		HttpSession session = req.getSession();
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User user = (User) session.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassWord(userPass);
		user.setAbout(userAbout);
		String oldPic = user.getProfile();
		if (imageName != "")
			user.setProfile(imageName);
		else
			user.setProfile(oldPic);

		if (dao.updateUser(user)) {
//			pw.println("update");
			boolean flag = false;
			if (imageName != "") {

			String path = req.getRealPath("/")+"profile_pics"+File.separator + user.getProfile();
			String path1 = req.getRealPath("/")+"profile_pics"+File.separator + oldPic;
//				String path = "D:\\ADV_Java_Practice\\TechBlog\\src\\main\\webapp\\" + "profile_pics" + File.separator
//						+ user.getProfile();
//				String path1 = "D:\\ADV_Java_Practice\\TechBlog\\src\\main\\webapp\\" + "profile_pics" + File.separator
//						+ oldPic;
				if (!oldPic.equals("Default.png"))
					PicHelper.deletePic(path1);
//				pw.println(part.getInputStream());
				if (PicHelper.savePic(part.getInputStream(), path)) {
//				pw.println("");
					Message message = new Message("Profile Updated...", "success", "alert-success");
					HttpSession s = req.getSession();
					s.setAttribute("msg", message);
					resp.sendRedirect("profile.jsp");

				} else {
//				pw.println("Unable to update");
					Message message = new Message("Something went wrong... ", "error", "alert-danger");
					HttpSession s = req.getSession();
					s.setAttribute("msg", message);
					resp.sendRedirect("profile.jsp");

				}
				flag = true;
			}
			if (flag == false) {
				Message message = new Message("Profile Updated...", "success", "alert-success");
				HttpSession s = req.getSession();
				s.setAttribute("msg", message);
				resp.sendRedirect("profile.jsp");
			}

		} else {
			pw.println(" not update");
		}
	}
}
