package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//fetch username and password
		String username= req.getParameter("email");
		String password= req.getParameter("password");
		PrintWriter pw = resp.getWriter();
		
//		Creating DAO Object
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
//		taking user object from dao object by using getUserByEmailAndPassword()  
		User user = dao.getUserByEmailAndPassword(username, password);
		//check user is valid or not if valid create seesion Object of currentUser and send to profile page
		if(user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("currentUser", user);
			resp.sendRedirect("profile.jsp");
		}
//		if not create on object of Massage object which is responsible to to hold erroe message , type, cssClass
//		and get session , set the message object to session and send all details to login page
		else
		{
//			pw.println("Invalid Details..try again");
			Message message = new Message("Invalid Details ! try with another","error","alert-danger");
			HttpSession s = req.getSession();
			s.setAttribute("msg",message);
			resp.sendRedirect("login.jsp");
			
		}
		
	}
}
