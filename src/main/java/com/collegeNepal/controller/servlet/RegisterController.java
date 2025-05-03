package com.collegeNepal.controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collegeNepal.controller.dao.UserDAO;
import com.collegeNepal.model.User;


/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				
				
				try {
					
					
					String name = request.getParameter("username");
					String email = request.getParameter("studentEmail");
					String password = request.getParameter("password");
					String confirmPassword = request.getParameter("passwordConfirm");
					System.out.println(password);
					System.out.println(confirmPassword);
					
					
					if(!password.equals(confirmPassword)) {
						HttpSession session = request.getSession();
						session.setAttribute("errorMessage", "Password and confirmation do not match");
						response.sendRedirect(request.getContextPath() + "/Pages/register.jsp");
		                return;
					}
					
					
					User newUser = new User(name, email, password, "student");
					UserDAO userMaker = new UserDAO();
					System.out.println("backtoregistercontroller");
					
					boolean confirmRegistration = userMaker.register(newUser);
					
					if(confirmRegistration) {
						response.sendRedirect(request.getContextPath() + "/Pages/logIn.jsp");
					}else {
						request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
		                request.getRequestDispatcher("/Pages/register.jsp").forward(request, response);
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
						
			}
				
	}


