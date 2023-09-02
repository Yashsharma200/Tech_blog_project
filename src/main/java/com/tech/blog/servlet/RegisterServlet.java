package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter  pw= resp.getWriter(); 
		//fetch all form data
		String  check = req.getParameter("check");
		if(check== null) {
			pw.println("Please check terms and condition");
		}
		else
		{
			String name = req.getParameter("user_name");
			String email = req.getParameter("user_email");
			String pass= req.getParameter("user_pass");
			String gender = req.getParameter("gender");
			String about = req.getParameter("about");
			//Create user data and set data to user object
			User user = new User(name,email,pass,about,gender);
			
			
			//CreateuserDao object
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			//passing user object to dao
			if(dao.saveUser(user)) {
				//save..
				pw.println("done");
			}
			else
			{
				//Unable to save
				pw.println("Error");
				
			}
				
		}
	}
}
