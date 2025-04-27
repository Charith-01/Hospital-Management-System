package com.suwani.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suwani.model.User;
import com.suwani.service.UserService;

/**
 * Servlet implementation class DeleteUserProfile
 */
@WebServlet("/DeleteUserProfile")
public class DeleteUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = new User();
		
		user.setUserid(Integer.parseInt(request.getParameter("id")));
		
		UserService service = new UserService();
		service.deleteuserprofile(user);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		
		dispatcher.forward(request, response);
	}

}
