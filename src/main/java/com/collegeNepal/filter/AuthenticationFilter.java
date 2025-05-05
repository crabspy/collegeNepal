package com.collegeNepal.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/Pages/*" })
public class AuthenticationFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("AuthenticationFilter initialized");
	}

	@Override
	public void destroy() {
		System.out.println("AuthenticationFilter destroyed");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();

		// Paths that should be allowed without login
		boolean isLoginPage = uri.endsWith("logIn.jsp");
		boolean isLoginController = uri.endsWith("LogInController");
		boolean isRegisterPage = uri.endsWith("register.jsp");
		boolean isRegisterController = uri.endsWith("RegisterController");

		HttpSession session = req.getSession(false);
		if (req.getSession(false) == null) {
			System.out.println("No existing session");
		}else {
			System.out.println("Yes existing session");
		}
		boolean loggedIn = session != null && session.getAttribute("userWithSession") != null;
		//System.out.println(session.getAttribute("userWithSession"));
		
	

		if (loggedIn) {
			// Redirect logged-in user away from login page			
			if (isLoginPage || isLoginController || isRegisterPage || isRegisterController) {
				System.out.println("THIS MUST BE LOGIN OR LOGINCONTROLLER");
				System.out.println(session.getAttribute("userWithSession"));
				res.sendRedirect(contextPath + "/Pages/Dashboard.jsp");
			} else {
				System.out.println("THIS MUST NOT BE LOGIN OR LOGINCONTROLLER");
				chain.doFilter(request, response); // Proceed as normal
			}
		} else {
			// Allow login page and controller access
			if (isLoginPage || isLoginController || isRegisterPage || isRegisterController) {
				System.out.println("THIS MUST BE LOGIN OR LOGINCONTROLLER");
				chain.doFilter(request, response);
			} else {
				// Redirect unauthenticated users to login
				System.out.println("USER IS NOT LOGGED IN AnD IS NOT ON LOGIN SCREEN");
				res.sendRedirect(contextPath + "/Pages/logIn.jsp");
			}
		}
	}
}
