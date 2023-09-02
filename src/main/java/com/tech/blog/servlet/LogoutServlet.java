package com.tech.blog.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;


@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		session.removeAttribute("CurrentUser");//removing currentUser from session  
		Message m = new Message("Logout Successfully","success","alert-success"); // creating object of successfully logout message
		session.setAttribute("msg", m);//setting message object to session  
		resp.sendRedirect("login.jsp");//redirecting to login page
	}
}
