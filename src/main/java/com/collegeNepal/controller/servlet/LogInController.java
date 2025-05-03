package com.collegeNepal.controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collegeNepal.controller.dao.UserDAO;
import com.collegeNepal.model.User;

/**
 * Servlet implementation class LogInController
 */
@SuppressWarnings("unused")
@WebServlet(asyncSupported = true, urlPatterns = { "/LogInController"})
public class LogInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to the login page
        response.sendRedirect(request.getContextPath() + "/Pages/logIn.jsp");
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			UserDAO userdao = new UserDAO();
			User user = userdao.login(email, password);
			if(user != null) {
					
							 // Create a session for the logged-in user
			                HttpSession session = request.getSession();
			                System.out.println("Session made " + session.getId());
			                session.setAttribute("user", user);

			                // Redirect to the Dashboard or home page (could be a different page based on your setup)
			                response.sendRedirect(request.getContextPath() + "/Pages/Dashboard.jsp");
			                return;
					
			}else {
		                // If login fails, send an error message
						HttpSession session = request.getSession();
		            	session.setAttribute("errorMessage", "Invalid email or password. Please try again.");
		            	response.sendRedirect(request.getContextPath() + "/Pages/logIn.jsp");
		                return;
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// Log the error properly in production (use a logger)
			System.out.print(e);
		    request.setAttribute("errorMessage", "A system error occurred. Please try again later.");
		    request.getRequestDispatcher("/Pages/logIn.jsp").forward(request, response);
		} 
		
	}

}







